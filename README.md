# 工作台

一块彩色便签画布：拖动、缩放、按类别上色，完成和添加时有庆祝动画，右侧抽屉记录每天做了什么。
纯静态网页（一个 `index.html`），数据存在 Supabase，用邮箱 magic link 登录。不需要编译。

```
index.html            页面本身
config.js             填 Supabase URL 和 anon key
supabase/schema.sql   建表 + 权限（只有本人能读写）+ 实时同步
supabase/seed.sql     从 claude.ai 版本导出的事项和记录
```

## 上线步骤

### 1. Supabase
1. 在 supabase.com 新建一个项目。
2. SQL Editor → 贴上 `supabase/schema.sql` → Run。
3. Project Settings → API，复制 **Project URL** 和 **anon public key**，填进 `config.js`。
   不要用 service_role key。
4. Authentication → URL Configuration：
   - Site URL：`https://workbench.alilinlab.com`
   - Redirect URLs 加上：`https://workbench.alilinlab.com/**`、`http://localhost:3000/**`，以及 Vercel 给的预览网址 `https://*.vercel.app/**`

### 2. GitHub + Vercel
1. 把这个文件夹推到一个新的 GitHub repo。
2. Vercel → Add New Project → 选这个 repo。
   Framework Preset 选 **Other**，Build Command 和 Output Directory 都留空。
3. Deploy。

### 3. 域名
1. Vercel 项目 → Settings → Domains → 添加 `workbench.alilinlab.com`。
2. 去管理 alilinlab.com 的 DNS 那里加一条：
   - 类型 `CNAME`，名称 `workbench`，值 `cname.vercel-dns.com`
3. 等 Vercel 显示 Valid（通常几分钟）。

### 4. 第一次登录 + 搬数据
1. 打开网站，用你的邮箱登录一次（这会创建账号）。
2. 打开 `supabase/seed.sql`，把 `YOUR_EMAIL` 换成刚才登录的邮箱。
3. SQL Editor → 贴上 → Run。刷新网站，原来的便签和记录就回来了。

### 5. 关掉注册（推荐）
Authentication → Providers → Email → 关闭 "Allow new users to sign up"。
这样只有你自己的账号能登录。就算不关，别人登录后也只能看到他自己的空白画布，看不到你的数据。

## 本地预览
```
npx serve .
```
然后打开 http://localhost:3000 。

## 注意
- Supabase 免费项目如果一周没有任何访问会自动暂停，去后台点一下 Restore 就恢复。
- 页面的视角位置和「隐藏已完成」只记在当前浏览器里，换设备会重置，这是正常的。
- 导出的数据里有几件事项是「已完成」状态，如果是当时试动画点的，在便签上点「撤销」就能改回来。
