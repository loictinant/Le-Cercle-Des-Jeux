param(
    [string]$BuildLabel = 'Store-1.2.0-PartnerCenter',
    [string]$BundlePlatforms = 'x64|arm64'
)

$ErrorActionPreference = 'Stop'
$windowsRoot = $PSScriptRoot
$gameRoot = Split-Path -Parent (Split-Path -Parent $windowsRoot)
$repoRoot = Split-Path -Parent $gameRoot
$outputBase = Join-Path $repoRoot 'deliverables\LeCercleDesJeux\Windows'
if ($BuildLabel -notmatch '^[A-Za-z0-9.-]{1,40}$') {
    throw 'Le libellé de compilation doit contenir uniquement des lettres, chiffres, points et tirets.'
}
if ($BundlePlatforms -notin @('x64', 'arm64', 'x64|arm64')) {
    throw 'Les plateformes autorisées sont x64, arm64 ou x64|arm64.'
}
$outputDir = Join-Path $outputBase $BuildLabel
$syncScript = Join-Path (Split-Path -Parent $windowsRoot) 'Sync-GameFiles.ps1'

& $syncScript -Destination (Join-Path $windowsRoot 'www')
& (Join-Path $windowsRoot 'generate-assets.ps1')
if (Test-Path -LiteralPath $outputDir) { throw "Ce dossier de compilation existe déjà : $outputDir. Choisis un autre BuildLabel pour conserver les paquets précédents." }
New-Item -ItemType Directory -Path $outputDir -Force | Out-Null

$vswhere = 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe'
$vsPath = & $vswhere -products * -requires Microsoft.VisualStudio.Workload.Universal -property installationPath
if (-not $vsPath) { throw "Le composant Windows UWP requis n'a pas été trouvé." }
$msbuild = Join-Path $vsPath 'MSBuild\Current\Bin\MSBuild.exe'

$buildArguments = @(
    (Join-Path $windowsRoot 'LeCercleDesJeux.Windows.csproj'),
    '/restore',
    '/t:Rebuild',
    '/verbosity:minimal',
    '/p:Configuration=Release',
    '/p:Platform=x64',
    '/p:GenerateAppxPackageOnBuild=true',
    '/p:AppxPackageSigningEnabled=false',
    '/p:UseDotNetNativeToolchain=true',
    '/p:UapAppxPackageBuildMode=StoreUpload',
    '/p:AppxBundle=Always',
    "/p:AppxBundlePlatforms=$BundlePlatforms",
    ("/p:AppxPackageDir=" + $outputDir + '\')
)
Push-Location $windowsRoot
try {
    & $msbuild @buildArguments
} finally {
    Pop-Location
}
if ($LASTEXITCODE -ne 0) { throw 'La compilation MSIX Windows a échoué.' }

$uploadPackage = Get-ChildItem -LiteralPath $outputDir -Recurse -File |
    Where-Object { $_.Extension -in '.msixupload', '.appxupload' } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1
if (-not $uploadPackage) { throw "Visual Studio n'a pas créé de paquet Store .msixupload/.appxupload dans : $outputDir" }

Write-Host "Paquet Store créé par Visual Studio pour Partner Center : $($uploadPackage.FullName)"
Get-Item -LiteralPath $uploadPackage.FullName | Select-Object Name, Length, LastWriteTime
