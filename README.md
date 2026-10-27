# 工作台

一块彩色便签画布：拖动、缩放、按类别上色，完成和添加时有庆祝动画，右侧抽屉记录每天做了什么。
纯静态网页（一个 `index.html`），数据存在 Supabase。不用账号、不用邮箱：每台设备第一次打开时输一次你的口令，之后会记住。不需要编译。

```
index.html            页面本身
config.js             填 Supabase URL 和 anon key
supabase/schema.sql   建表 + 口令检查（口令不对什么都看不到、改不了）
supabase/seed.sql     从 claude.ai 版本导出的事项和记录
```

## 上线步骤

### 1. Supabase
1. 在 supabase.com 新建一个项目（之前建过的直接用）。
2. 打开 `supabase/schema.sql`，把最下面的 `换成你自己的口令` 改成你的口令，然后在 SQL Editor 整段运行。
   这会删掉旧版建的三张表，重新建。
3. 接着在 SQL Editor 运行 `supabase/seed.sql`，把原来的便签和记录导进来。
4. Project Settings → API，复制 **Project URL** 和 **anon public key**，填进 `config.js`。
   不要用 service_role key。

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

### 4. 打开
打开网站，输入口令。这台设备之后就不会再问了。
标题旁边的「锁定」会让这台设备忘掉口令。

### 想换口令
在 SQL Editor 运行：
```
update public.workbench_secret set value = '新口令' where id = 1;
```
之后每台设备都要重新输一次。

## 本地预览
```
npx serve .
```
然后打开 http://localhost:3000 。

## 注意
- Supabase 免费项目如果一周没有任何访问会自动暂停，去后台点一下 Restore 就恢复。
- 换设备时数据大约 30 秒内同步，或者切回这个页面时立刻刷新。
- 页面的视角位置和「隐藏已完成」只记在当前浏览器里，换设备会重置，这是正常的。
- 导出的数据里有几件事项是「已完成」状态，如果是当时试动画点的，在便签上点「撤销」就能改回来。
