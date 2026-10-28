# Carnet de films

Mon carnet personnel de films et séries : notes de 0 à 5 étoiles (+ 1 à 3 ✦ pour les pépites), dates de visionnage, annotations, sélection quotidienne de 10 titres à voir chez soi.

- **Catalogue, affiches, distribution, « où regarder »** : API TMDB (affichage autorisé pour un usage non commercial, avec la mention en bas de page).
- **Synchronisation entre appareils** : Supabase (connexion par lien envoyé par e-mail).
- **Sélection du jour** : fichier `selection.json`, réécrit chaque matin par une tâche programmée Claude. Le bouton « Autre sélection » en propose une nouvelle instantanément (TMDB).

## Mise en route (15 minutes, une seule fois)

### 1. Jeton TMDB
1. Crée un compte gratuit sur https://www.themoviedb.org/signup
2. Va dans **Paramètres → API**, demande une clé (type « Developer », usage personnel).
3. Copie le **jeton d'accès en lecture à l'API** (longue chaîne qui commence par `eyJ`).

### 2. Projet Supabase
1. Crée un compte sur https://supabase.com puis un projet (offre gratuite, région Europe).
2. **SQL Editor → New query** : colle le contenu de `supabase.sql`, puis **Run**.
3. **Authentication → URL Configuration** : mets l'adresse du site dans **Site URL**
   (ex. `https://ton-pseudo.github.io/carnet-films/`) et ajoute-la aussi dans **Redirect URLs**.
4. **Project Settings → API** : copie la **Project URL** et la clé **anon public**.

### 3. Configuration
Remplis `config.js` avec le jeton TMDB, l'URL et la clé Supabase.

### 4. Mise en ligne
Le site est servi par GitHub Pages depuis la branche `main` (dossier racine).

## Utilisation
- Sur chaque appareil : bouton **Se connecter** en haut à droite → e-mail → ouvre le lien reçu.
- Les notes prises sans être connecté restent sur l'appareil et sont envoyées à la première connexion.
