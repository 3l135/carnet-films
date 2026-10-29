-- Carnet de films : table des notes personnelles.
-- À coller dans Supabase > SQL Editor > New query, puis « Run ».

create table if not exists public.entries (
  user_id     uuid        not null default auth.uid() references auth.users on delete cascade,
  media_type  text        not null check (media_type in ('movie', 'tv')),
  tmdb_id     integer     not null,
  title       text,
  year        integer,
  poster_path text,
  stars       smallint    check (stars between 0 and 5),
  score       smallint    check (score between 0 and 10),
  pepite      smallint    not null default 0 check (pepite between 0 and 3),
  viewings    date[]      not null default '{}',
  annotations jsonb       not null default '[]'::jsonb,
  watchlist   boolean     not null default false,
  wl_added    date,
  updated_at  timestamptz not null default now(),
  primary key (user_id, media_type, tmdb_id),
  constraint pepite_seulement_a_5_etoiles check (pepite = 0 or stars = 5)
);

-- Si la table existait déjà avant la liste « À voir » :
alter table public.entries add column if not exists watchlist boolean not null default false;
alter table public.entries add column if not exists wl_added  date;
-- Note sur 10 (demi-pop-corn) ; reprend les anciennes notes sur 5.
alter table public.entries add column if not exists score smallint check (score between 0 and 10);
update public.entries set score = stars * 2 where score is null and stars is not null;

alter table public.entries enable row level security;

drop policy if exists "lire mes notes"      on public.entries;
drop policy if exists "ajouter mes notes"   on public.entries;
drop policy if exists "modifier mes notes"  on public.entries;
drop policy if exists "supprimer mes notes" on public.entries;

create policy "lire mes notes"      on public.entries for select using (auth.uid() = user_id);
create policy "ajouter mes notes"   on public.entries for insert with check (auth.uid() = user_id);
create policy "modifier mes notes"  on public.entries for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "supprimer mes notes" on public.entries for delete using (auth.uid() = user_id);
