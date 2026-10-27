// 在 Supabase 后台 → Project Settings → API 里找到这两个值，填进来。
// anon key 本来就是公开的，可以放在前端。千万不要把 service_role key 放进这里。
window.WORKBENCH_CONFIG = {
  supabaseUrl: "https://YOUR_PROJECT_ID.supabase.co",
  supabaseAnonKey: "YOUR_ANON_KEY",

  // 可选：把口令写在这里，就连第一次输入都省了。
  // 代价：config.js 是公开文件，任何打开网址/config.js 的人都能看到口令，等于没有锁。
  // workbenchKey: "和 schema.sql 里一样的口令"
};
