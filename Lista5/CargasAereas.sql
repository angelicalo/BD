--Angelica 
SET search_path TO cargasaereas;

--1)
drop view tabela1;

create or replace view tabela1 as 
select v.*, e.nome, (max(r.h_chegada) - min(r.h_saida) - sum(r.h_chegada - r.h_saida)) as tescala,
				 (count(r.*) - 1) as escalas
	from Voo v join Rota r on v.CodVoo=r.CodVoo
 			   join empresa e on v.codemp = e.codemp 
group by v.CodVoo, e.nome
order by v.CodVoo;
		 
select * from tabela1;

select tab.codemp, tab.nome,sum(tab.tescala)/(
		select count(tab1.codemp)
			from tabela1 tab1
		where tab1.escalas > 0 
		group by tab1.codemp 
		having tab1.codemp=tab.codemp) as mediaescala
	from tabela1 tab
group by tab.codemp, tab.nome;

--2)
select e.* , r1.codvoo , r1.destino as cidaderepetida 
	from rota r1 join rota r2 on r1.codvoo = r2.codvoo 
							  and r1.destino = r2.origem 
							  and r1.h_chegada - r2.h_saida > '00:00:00'
				 join voo v on r1.codvoo = v.codvoo 
				 join empresa e on v.codemp = e.codemp;

--4)
drop view tabela4;

create or replace view tabela4 as
select v.*, e.nome, min(r.h_saida), max(r.h_saida), count(r.*) as viagens
	from Voo v join Rota r on v.CodVoo=r.CodVoo
			   join empresa e on v.codemp = e.codemp 
group by v.CodVoo, e.nome
order by v.CodVoo;

select * from tabela4;

select r1.codvoo, t4.nome, t4.min as inicio,r1.origem, t4.max as termino,r2.destino,t4.viagens
	from tabela4 t4 join rota r1 on t4.codvoo=r1.codvoo and r1.h_saida = t4.min
					join rota r2 on t4.codvoo=r2.codvoo and r2.h_saida = t4.max;
--5)
drop view tabela5;

create or replace view tabela5 as
	select distinct e.codemp,r.codvoo 
		from rota r join voo v on v.CodVoo=r.CodVoo
					join empresa e on v.codemp = e.codemp
	where r.origem ='POA' or r.destino ='POA';
	
select * from tabela5;

select e.* from empresa e where e.codemp not in (
		select t1.codemp from (
			select t5.codemp, count(t5.codvoo) as pass from tabela5 t5 group by t5.codemp) as t1
			full outer join (
			select v.codemp, count(v.codemp) as total from voo v group by v.codemp) as t2
			on t1.codemp=t2.codemp
		where t1.pass=t2.total);
		
--6)
drop view tabela6;

create or replace view tabela6 as
	select distinct e.codemp, r.codvoo 
		from rota r join voo v on v.CodVoo=r.CodVoo
					join empresa e on v.codemp = e.codemp
		where r.origem ='GIG' or r.destino ='GIG';
	
select * from tabela6;
			
select e.* from empresa e where e.codemp in (
		select t1.codemp from (
			select t6.codemp, count(t6.codvoo) as pass from tabela6 t6 group by t6.codemp) as t1
		 	full outer join (
		 	select v.codemp, count(v.codemp) as total from voo v group by v.codemp) as t2
			on t1.codemp=t2.codemp
		where t1.pass=t2.total);
	
--7)
select t.codemp, t.nome 
	from (select tab.codemp, tab.nome, count(tab.aeroporto) as qtd 
			from (select e.*, r.origem as aeroporto
					from rota r join voo v on r.codvoo = v.codvoo 
								join empresa e on v.codemp = e.codemp
		  		  union 
		  		  select e.*, r.destino as aeroporto
					from rota r join voo v on r.codvoo = v.codvoo 
								join empresa e on v.codemp = e.codemp) as tab
		  group by tab.codemp, tab.nome) as t
where t.qtd = (select count(total.*) 
				  from (select r.origem from rota r
						union 
						select r.destino from rota r) as total);

--8)
select e.nome, r1.codvoo, r1.h_saida, r3.h_chegada, r1.destino as escala1, r2.destino as escala2
	from rota r1 join rota r2 on r1.codvoo = r2.codvoo and r1.destino = r2.origem 
				 join rota r3 on r2.codvoo = r3.codvoo and r2.destino = r3.origem 
				 join Voo v on r1.codvoo = v.codvoo
				 join Empresa e on v.CodEmp=e.CodEmp
where r1.origem = 'BHZ' and r3.destino = 'POA'
union 
select e.nome, r1.codvoo, r1.h_saida, r2.h_chegada, r1.destino as escala1, null
	from rota r1 join rota r2 on r1.codvoo = r2.codvoo and r1.destino = r2.origem 
				 join Voo v on r1.codvoo = v.codvoo
				 join Empresa e on v.CodEmp=e.CodEmp
where r1.origem = 'BHZ' and r2.destino = 'POA'; 

--9)
drop view tabela9;

create or replace view tabela9 as
select e.*, r.codvoo,r.destino, r.h_saida
	from viagem vi join rota r on vi.codrota = r.codrota 
				   join voo vo on r.codvoo = vo.codvoo 
				   join empresa e on e.codemp = vo.codemp 
where r.origem = 'GIG' and vi.data='2017-07-11';

select * from tabela9;

select t9.codemp, t9.nome, t9.codvoo,t9.destino, t9.h_saida 
	from tabela9 t9 join (select t9.codemp, t9.nome, min(t9.h_saida) as hmin 
							 from tabela9 t9
						  group by t9.codemp, t9.nome) as t 
					on t9.codemp=t.codemp
where t9.h_saida=t.hmin;	

--10)
select r.codrota, vi.data , vi.h_saida_real, vi.h_chegada_real, vi.codaviao, 
	   case when vi.h_saida_real - r.h_saida >= '00:10:00' then 'Atrasado' else 'Pontual' end as status 
	from Viagem vi join Rota r on vi.codrota = r.codrota
				   join Voo vo on r.codvoo = vo.codvoo
				   join Empresa e on vo.CodEmp=e.CodEmp
where vi.data='2017-07-11' and vo.codemp = 'AZU'
order by r.h_saida ;
