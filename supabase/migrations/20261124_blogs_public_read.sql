-- Allow public (anonymous) users to read published blog posts
alter table public.blogs enable row level security;

drop policy if exists "public reads published blogs" on public.blogs;
create policy "public reads published blogs" on public.blogs
  for select using (status = 'published');

drop policy if exists "admin manages blogs" on public.blogs;
create policy "admin manages blogs" on public.blogs
  for all using (public.is_admin()) with check (public.is_admin());
