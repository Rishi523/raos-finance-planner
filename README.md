# Rao's Finance Planner

Private family finance planner frontend with Supabase Auth and per-user cloud storage.

## Before using live data

Run `supabase_schema.sql` in the Supabase SQL editor. The app uses the public publishable key in the browser, so Row Level Security must be enabled before storing real finance data.

## Data model

- Public source code contains no real family finance rows.
- User data is stored in `public.finance_plans.state` as JSONB.
- A local browser cache and JSON export/import are kept as backups.

## Deploy

This repo is ready for GitHub Pages from the `main` branch root.
