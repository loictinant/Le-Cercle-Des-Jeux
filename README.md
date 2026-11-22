# Le Cercle des jeux — version 1.5.0

Jeu de réflexion en français : sudoku, mots croisés, mots fléchés, mots mêlés et mémory. Les niveaux solo fonctionnent hors ligne ; les comptes et classements en ligne sont facultatifs.

![Aperçu du menu d’accueil du jeu](LeCercleDesJeux-accueil-3d-v1.2.0.png)

## Version 1.5.0

- Les classements solo sont organisés par jeu et par difficulté, avec une vue par pays ou mondiale.
- Les trophées peuvent être comparés par total ou par niveau (bronze, argent, or, diamant) ; leur partage public reste facultatif.
- Les scores et trophées du compte sont conservés dans MySQL. Le paquet source contient la migration et un guide phpMyAdmin.
- Les mots fléchés utilisent maintenant des définitions dans la grille, séparées des mots croisés.

## Télécharger

- [EXE d’essai Windows x64 et fichiers nécessaires](https://github.com/loictinant/Le-Cercle-Des-Jeux/releases/tag/v1.5.0-essai)
- [Sources Windows, Android, API PHP/MySQL et guide de base de données](LeCercleDesJeux-GitHubSource-v1.5.0.zip)
- [Toutes les versions et captures d’écran](https://github.com/loictinant/Le-Cercle-Des-Jeux/releases)

La version Microsoft Store 1.5.0 a été envoyée en certification. Elle sera publiée automatiquement si elle est approuvée par Microsoft. La version actuellement disponible dans le Store reste la précédente jusqu’à la fin de cette certification.

Pour activer les classements de la version 1.5.0, la base MySQL et l’API PHP doivent aussi être mises à jour. Le détail se trouve dans `server/mysql-api/README.md` et `server/mysql-api/GUIDE-ACCES-BASE-MYSQL.md`. Les identifiants MySQL et les clés de signature ne sont pas inclus dans les sources publiques.
