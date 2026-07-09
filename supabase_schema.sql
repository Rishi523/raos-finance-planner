create table if not exists public.finance_plans (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.finance_plans enable row level security;

drop policy if exists "Users can read own finance plan" on public.finance_plans;
create policy "Users can read own finance plan"
on public.finance_plans
for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "Users can insert own finance plan" on public.finance_plans;
create policy "Users can insert own finance plan"
on public.finance_plans
for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update own finance plan" on public.finance_plans;
create policy "Users can update own finance plan"
on public.finance_plans
for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);
