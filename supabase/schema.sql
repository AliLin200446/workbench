-- 工作台 · 建表
-- 在 Supabase 后台 → SQL Editor 里整段贴上，点 Run。只需要跑一次。

create table if not exists public.items (
  id            text primary key,
  user_id       uuid not null default auth.uid() references auth.users(id) on delete cascade,
  title         text not null,
  area          text not null default 'other',
  status        text not null default 'todo' check (status in ('todo','doing','waiting','done')),
  next_step     text default '',
  due           date,
  who           text default '',
  note          text default '',
  x             double precision,
  y             double precision,
  waiting_since date,
  done_at       date,
  created       bigint,
  updated       bigint
);

create table if not exists public.logs (
  id       text primary key,
  user_id  uuid not null default auth.uid() references auth.users(id) on delete cascade,
  date     date not null,
  at       bigint not null,
  text     text not null,
  kind     text not null default 'manual',
  item_id  text default '',
  area     text default ''
);
create index if not exists logs_user_at on public.logs (user_id, at desc);

create table if not exists public.settings (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  key     text not null,
  value   jsonb,
  primary key (user_id, key)
);

-- 只有本人能读写自己的数据
alter table public.items    enable row level security;
alter table public.logs     enable row level security;
alter table public.settings enable row level security;

drop policy if exists "own items" on public.items;
create policy "own items" on public.items
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "own logs" on public.logs;
create policy "own logs" on public.logs
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "own settings" on public.settings;
create policy "own settings" on public.settings
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

-- 多设备实时同步
alter publication supabase_realtime add table public.items, public.logs, public.settings;
