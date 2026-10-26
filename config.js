// 在 Supabase 后台 → Project Settings → API 里找到这两个值，填进来。
// anon key 是公开的，可以放在前端。千万不要把 service_role key 放进这里。
window.WORKBENCH_CONFIG = {
  supabaseUrl: "https://YOUR_PROJECT_ID.supabase.co",
  supabaseAnonKey: "YOUR_ANON_KEY"
};
