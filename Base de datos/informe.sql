use dynait
--informe general
drop procedure informe
 create proc informe
  @fecha_ini datetime,
  @fecha_fin datetime
  as
  begin
select *  into #table_informe from (
select id_usuario, nombre_usuario as consulto, estado_Ticket as estado, id_ticket as N_tickets, sum(n_creditos_acta) as creditos from ticket
inner join usuario on usuario.id_usuario = ticket.usuario_id
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
inner join acta on acta.fk_usuario_id =usuario.id_usuario
where  (fecha_crea_acta between @fecha_ini AND @fecha_fin) or (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si')
group by usuario.id_usuario, usuario.nombre_usuario,estado_Ticket,ticket.id_ticket)t
select *, ([Abierto]+[En proceso]+[Resuelto]+[Cerrado])as total, creditos from #table_informe 
pivot (count(N_tickets) for estado in ([Abierto], [En proceso],[Resuelto],[Cerrado])) as fpv
group by id_usuario, consulto, Abierto, [En proceso],Resuelto,Cerrado, creditos
end
exec informe '2022-05-06 00:00:00', '2022-05-06 23:59:58';
select sum(n_creditos_acta) from acta where fk_usuario_id=10 and fecha_crea_acta between '2022-05-06 00:00:00'and '2022-05-06 23:59:58'
go

---------------------informe general 2
drop procedure informe2; go
 create proc informe2
  @fecha_ini datetime,
  @fecha_fin datetime
  as
  begin
select *  into #table_informe from (
select id_usuario, nombre_usuario as consulto, estado_Ticket as estado, id_ticket as N_tickets, sum(n_creditos_acta) as creditos from ticket
inner join usuario on usuario.id_usuario = ticket.usuario_id
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
inner join acta on acta.fk_usuario_id =usuario.id_usuario
where  ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si'
group by usuario.id_usuario, usuario.nombre_usuario,estado_Ticket,ticket.id_ticket)t

select *  into #table_informe2 from (
select id_usuario, nombre_usuario as consulto, sum(n_creditos_acta) as creditos from ticket
inner join usuario on usuario.id_usuario = ticket.usuario_id
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
inner join acta on acta.fk_usuario_id =usuario.id_usuario
where  fecha_crea_acta between @fecha_ini AND @fecha_fin
group by usuario.id_usuario, usuario.nombre_usuario,estado_Ticket,ticket.id_ticket)t2


select *, ([Abierto]+[En proceso]+[Resuelto]+[Cerrado])as total, creditos from #table_informe t1
inner join #table_informe2 t2 on t2.id_usuario = t1.id
pivot (count(N_tickets) for estado in ([Abierto], [En proceso],[Resuelto],[Cerrado])) as fpv
group by id_usuario, consulto, Abierto, [En proceso],Resuelto,Cerrado, creditos
end 

exec informe2 '2022-04-06 00:00:00', '2022-05-06 23:59:58'; 

select sum(n_creditos_acta) from acta 
where fk_usuario_id=10 and fecha_crea_acta between '2022-05-06 00:00:00'and '2022-05-06 23:59:58' go
-------------------

select nombre_usuario, sum(n_creditos_acta) from acta 
inner join usuario on usuario.id_usuario = acta.fk_usuario_id group by nombre_usuario
go

drop proc informe3
 create proc informe3
  @fecha_ini datetime,
  @fecha_fin datetime
  as
  begin
select id_usuario, nombre_usuario, 
(select COUNT(id_ticket) from ticket where (ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario))as n_casos_inicio_jornada,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between DATEADD(day,-1, @fecha_ini) AND DATEADD(day,-1, @fecha_fin) and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario))as n_ticket_nuevos_dia,
(select COUNT(id_ticket) from ticket where (ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and estado_id=4))as n_ticket_Resueltos_hoy,
(select COUNT(id_ticket) from ticket where (ticket.fecha_cierre_ticket between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and estado_id=5))as n_ticket_cerrados_hoy,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario))as n_ticket_nuevos_cierre_jornada,
(select ISNULL(sum(n_creditos_acta),0) from acta where fecha_crea_acta between @fecha_ini AND @fecha_fin and acta.fk_usuario_id = a.id_usuario) as n_creditos_hoy,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and tipo_ticket_id=3 ))as n_ticket_desarrollo,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and tipo_ticket_id=2 ))as n_ticket_proyecto
from usuario as a where usuario_Habilitado= 'Si'
end
exec informe3 '2022-05-10 00:00:00', '2022-05-10 23:59:58';


select COUNT(id_ticket) from ticket where Fecha between '2022-05-10 00:00:00' and '2022-05-10 23:59:58'
select COUNT(id_ticket) from ticket where fecha_resuelto_ticket between '2022-05-09 00:00:00' and '2022-05-09 23:59:58'


select * from nota where id_ticket=6

select * from nota where id_nota=15

select * from acta
select * from usuario where id_usuario=10