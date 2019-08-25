create table guestbook(
seq   number primary key,
name  varchar2(30),
email  varchar2(30),
homepage  varchar2(35),
subject   varchar2(500) not null,
content  varchar2(4000) not null,
logtime  date);

create sequence seq_guestbook nocycle nocache;
commit;
select * from guestbook;


select * from
(select rownum rn, tt.* from
(select name,email,homepage,subject,content,to_char(logtime,'YYYY-MM-DD HH24:MI:SS') as logtime
    from guestbook
    order by seq desc) tt)
where  rn BETWEEN 1 AND 3;
