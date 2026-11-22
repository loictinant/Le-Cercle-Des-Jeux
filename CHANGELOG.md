# Changements

## 1.5.0 — 22 novembre 2026

- Les mots fléchés ont maintenant des définitions et des flèches intégrées aux cases ; les mots croisés gardent leur liste de définitions séparée.
- Les classements solo sont filtrés par jeu, difficulté et zone, et enregistrent chaque meilleur résultat dans MySQL.
- Les trophées débloqués, leurs identifiants et les totaux par rang sont enregistrés dans le compte MySQL ; leur affichage public reste facultatif.
- Le message de classement vide distingue désormais les défis quotidiens des niveaux solo.
- Ajout de la migration MySQL v1.5.0 et d’un guide phpMyAdmin pour retrouver les comptes, scores et trophées.
- L’historique des défis quotidiens est conservé en base tant que le compte existe, avec des requêtes et un guide d’export phpMyAdmin.

## 1.3.3 — 19 novembre 2026

- Ajout du choix Tranquille, Classique ou Expert ; le nombre de cases, de mots et de paires varie selon le jeu, le niveau et ce réglage.
- Ajout d’une indication de progression concrète pour chaque grille (cases, mots ou paires à traiter).
- La partie en cours est enregistrée après les actions, périodiquement et lorsque l’application passe en arrière-plan ; elle peut être reprise depuis l’accueil.
- Ajout de réglages d’accessibilité pour agrandir l’affichage et renforcer le contraste, ainsi que d’un meilleur repérage clavier.
- Enrichissement de la banque française des mots croisés, mots fléchés et mots mêlés.
- Correction du démarrage de partie pour éviter une erreur liée à l’état d’une partie précédente.

## 1.3.2 — 19 novembre 2026

- Ajout d’indices progressifs en trois étapes dans les cinq jeux, avec des révélations adaptées à chaque grille.
- Ajout de statistiques par jeu : parties terminées, meilleur temps, moyenne, indices et erreurs signalées.
- Ajout de trophées « sans indice » pour les mots mêlés et le mémory ; les trophées d’efficacité du mémory ne peuvent plus être obtenus avec des indices.
- Les anciennes sauvegardes sont conservées ; les nouvelles statistiques de durée commencent avec cette version.
- Le démarrage Windows Store attend maintenant le chargement réel du jeu et propose une nouvelle tentative en cas d’échec.
- La grille de mots mêlés s’adapte aux petites fenêtres ; les statistiques s’accordent aussi au thème sombre.
- Les cartes du mémory se réinitialisent proprement après un changement de jeu ou une sauvegarde interrompue.

## 1.3.1 — 18 novembre 2026

- Correction de l’affichage Windows Store : le jeu utilise WebView2 (Edge Chromium), comme la version EXE.
- Cette mise à jour remplace l’ancien moteur UWP, qui ne gérait pas correctement les clics et la mise en page du jeu.

## 1.3.0 — 18 novembre 2026

- Ajout du thème clair/sombre, du partage du jeu et du crédit développeur avec le numéro de version.
- Ajout d’une sauvegarde manuelle locale, d’un export JSON et d’une restauration de partie/progression.
- Les défis détectent le pays par IP côté serveur et proposent des classements locaux ou mondiaux ; la grille du jour reste commune.
- Ajout de défis quotidiens consécutifs, de quatre trophées associés, des couleurs bronze/argent/or et du pourcentage de progression.
- Ajout d’une comparaison anonyme des trophées sur consentement séparé, par pays ou dans le monde.
- Ajout du compte facultatif par pseudo, de la vérification d’e-mail et de la récupération par code.
- L’API 1.3.0 requiert une migration SQL et un expéditeur e-mail configuré ; rien n’est déployé automatiquement.

## 1.2.0 — 18 novembre 2026

- Le joueur choisit un pseudo public unique de 3 à 20 caractères et peut le modifier ensuite.
- Ajout d’une vérification de compatibilité : l’application signale quand le service PHP du site doit être mis à jour.
- Remplacement de l’illustration d’accueil par une scène 3D réunissant les cinq jeux.
- Ajout d’animations douces sur l’accueil, avec respect du réglage « réduire les animations » de l’appareil.
- Précision dans l’interface : le classement reste réglé sur la France et n’utilise pas la localisation de l’appareil.

## 1.1.0 — 18 novembre 2026

- Ajout des défis quotidiens asynchrones France et d’un classement séparé pour chacun des cinq jeux.
- Les grilles quotidiennes sont générées à partir d’une graine commune fournie par le service.
- La participation au classement est facultative et demande une acceptation explicite ; le pseudo était généré automatiquement dans cette version.
- Ajout d’une API PHP/MySQL, de la suppression du profil et d’une politique de confidentialité dédiée.
- Le mode solo, sa progression et les trophées internes restent disponibles hors ligne.
- Les succès Windows/Xbox restent désactivés. Le service doit être installé et configuré sur l’hébergement avant que le classement soit joignable.
