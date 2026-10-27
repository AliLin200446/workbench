-- 工作台 · 导入你在 claude.ai 版本里的事项和记录
-- 先跑 schema.sql，再把这个文件整段贴进 SQL Editor 运行。重复运行不会产生重复数据。

insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed01','fal Growth Engineer','job','done','确认是否已正式投递；没投就投',null,'fal 设计负责人','按之前聊过的情况预填，过时就改或删。',0,176,null,'2026-10-26',1793040001000,1793048209289) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed02','FLORA Creative Producer','job','done','确认面试结果，没消息就写一封跟进',null,'Megha Narayan','九月面试的记录，过时就改或删。',0,352,'2026-10-26','2026-10-26',1793040002000,1793048209289) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed03','alilinlab.com 改版','job','doing','先定视觉，再做交互原型',null,'','',5,-32,null,null,1793040003000,1793048217743) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed04','EIN','lab','done','',null,'','',264,0,null,'2026-10-26',1793040004000,1793048209289) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed05','Mercury 卡','lab','done','',null,'','',264,176,null,'2026-10-26',1793040005000,1793048209290) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed06','税单','lab','done','',null,'','',264,352,null,'2026-10-26',1793040006000,1793048209290) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed07','CAC 博客（Notion + Super）','cac','done','',null,'Dr. Hedy Chen','',528,176,null,'2026-10-26',1793040007000,1793048209290) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed08','CAC GAD-7 自测工具','cac','done','',null,'Dr. Hedy Chen','',528,352,null,'2026-10-26',1793040008000,1793048209290) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed09','新营销专员的需求：GA4、隐私政策、邮箱收集','cac','todo','确认算不算额外范围，报价或回复',null,'','',526,-64,null,null,1793040009000,1793048275649) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed10','LinkedIn 推进','linkedin','todo','定下这周要做的一件具体的事',null,'','',819,-5,null,null,1793040010000,1793048280182) on conflict (id) do nothing;
insert into public.items (id,title,area,status,next_step,due,who,note,x,y,waiting_since,done_at,created,updated) values ('seed11','Coffee chat','coffee','todo','列出想约的人，一人拆成一条',null,'','',1056,0,null,null,1793040011000,1793048209289) on conflict (id) do nothing;

insert into public.logs (id,date,at,text,kind,item_id,area) values ('lmvpqcvzjsi3iw','2026-10-26',1793047788271,'完成：FLORA Creative Producer','done','seed02','job') on conflict (id) do nothing;
insert into public.logs (id,date,at,text,kind,item_id,area) values ('lmvpqd3hbgsm2y','2026-10-26',1793047797983,'完成：CAC GAD-7 自测工具','done','seed08','cac') on conflict (id) do nothing;
insert into public.logs (id,date,at,text,kind,item_id,area) values ('lmvpqd4fscz4n3','2026-10-26',1793047799224,'完成：CAC 博客（Notion + Super）','done','seed07','cac') on conflict (id) do nothing;
insert into public.logs (id,date,at,text,kind,item_id,area) values ('lmvpqd57b8szpp','2026-10-26',1793047800215,'完成：税单','done','seed06','lab') on conflict (id) do nothing;
insert into public.logs (id,date,at,text,kind,item_id,area) values ('lmvpqd5kyzzcbf','2026-10-26',1793047800706,'完成：Mercury 卡','done','seed05','lab') on conflict (id) do nothing;
insert into public.logs (id,date,at,text,kind,item_id,area) values ('lmvpqd5pu1say5','2026-10-26',1793047800882,'完成：EIN','done','seed04','lab') on conflict (id) do nothing;
