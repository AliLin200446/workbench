-- 工作台 · 建表（不用登录版）
-- 在 Supabase → SQL Editor 整段贴上，先把最下面的口令改成你自己的，再点 Run。
-- 注意：这会删掉旧版（邮箱登录版）建的三张表。旧表里如果没有你要的数据，直接跑就行。

drop table if exists public.items cascade;
drop table if exists public.logs cascade;
drop table if exists public.settings cascade;

create table public.items (
  id            text primary key,
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

create table public.logs (
  id       text primary key,
  date     date not null,
  at       bigint not null,
  text     text not null,
  kind     text not null default 'manual',
  item_id  text default '',
  area     text default ''
);
create index logs_at on public.logs (at desc);

create table public.settings (
  key   text primary key,
  value jsonb
);

-- 口令存在这张表里。它开了 RLS 但没有任何规则，所以网页读不到它，只有下面的检查函数能读。
create table if not exists public.workbench_secret (id int primary key default 1, value text not null);
alter table public.workbench_secret enable row level security;

-- 每个请求都会带上 x-workbench-key，口令对了才放行
create or replace function public.workbench_ok() returns boolean
language sql stable security definer set search_path = public as $$
  select coalesce(current_setting('request.headers', true)::json ->> 'x-workbench-key', '')
         = coalesce((select value from public.workbench_secret where id = 1), '#never#')
$$;
grant execute on function public.workbench_ok() to anon, authenticated;

alter table public.items    enable row level security;
alter table public.logs     enable row level security;
alter table public.settings enable row level security;

create policy "passphrase" on public.items    for all to anon, authenticated using (workbench_ok()) with check (workbench_ok());
create policy "passphrase" on public.logs     for all to anon, authenticated using (workbench_ok()) with check (workbench_ok());
create policy "passphrase" on public.settings for all to anon, authenticated using (workbench_ok()) with check (workbench_ok());

-- ↓↓↓ 把引号里的内容换成你自己的口令（越长越安全，比如一句只有你知道的话）
insert into public.workbench_secret (id, value) values (1, '换成你自己的口令')
on conflict (id) do update set value = excluded.value;
