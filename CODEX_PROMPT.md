把下面这段贴给 Codex：

---

This repo is a finished static site: `index.html` + `config.js`, backed by Supabase (tables and RLS are in `supabase/schema.sql`). Do not rewrite or restructure the page; keep it a single static HTML file with no build step.

Please:
1. Put my Supabase Project URL and anon key into `config.js` (I'll paste them). Never use or commit a service_role key.
2. Add a `vercel.json` only if needed for a plain static deploy (no framework, no build command).
3. Add a `.gitignore` for `.DS_Store`, `node_modules`, `.vercel`.
4. Initialize git, commit, and push to a new GitHub repo named `workbench`.
5. Run `npx serve .` and confirm the page loads without console errors before pushing. A login screen asking for an email is the expected first screen.

Do not change the Supabase schema, the data field names, or the login flow.
