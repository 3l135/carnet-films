// Réglages du site. Ces deux clés sont faites pour être publiques :
// - le jeton TMDB ne donne qu'un accès en lecture aux données publiques de TMDB ;
// - la clé « anon » Supabase est protégée par les règles d'accès (chacun ne voit que ses propres notes).
window.CARNET_CONFIG = {
  // TMDB : themoviedb.org > Paramètres > API > « Jeton d'accès en lecture à l'API » (commence par eyJ…)
  TMDB_TOKEN: "",

  // Supabase : app.supabase.com > ton projet > Project Settings > API
  SUPABASE_URL: "",       // ex. https://abcdefgh.supabase.co
  SUPABASE_ANON_KEY: ""   // la clé « anon public »
};
