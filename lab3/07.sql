with recursive cte(NPK,n,k,i) as
    (
    select  1 AS NPK, 0 AS n, 0 AS k
        union distinct
    select   1,n + 1,0 from cte where n <= 9
        union distinct
    select  1,n+1,n+1 from cte where n <= 9
        union distinct
    select  ((NPK*(n-k+(i+1)))/i),n,k from cte where n<=9 && n>=5 && n <> 6 && k>=2 && k<=5 && i<=k
    )
    select * from cte;






























/*
WITH RECURSIVE dwumian (n,k) AS
(
  select 2
  union ALL
  select n + 1 from cte where n < 5
)
select * from cte;

with recursive factorial(n) as
(
	select n
	union all
	select n*(n-1) from 






























/*
WITH RECURSIVE cte (NPK,n ,k) AS
(
  select  1 AS NPK ,0 AS n ,0 AS k
  union distinct
  select   1,n + 1,0 from cte where n < 10
 union distinct
  select  1,n+1,n+1 from cte where n < 10
 union distinct
  select  NPK*(n+1)/(k+1),n+1,k+1 from cte where n<10 && n>=0 && k>=0 && k<10
)
select * from cte;