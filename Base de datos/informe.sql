use dynait
--CERRADOS POR CONSULTOR
select nombre_usuario, count(id_ticket) as N_Ticket from ticket 
inner join usuario on usuario.id_usuario = ticket.usuario_id 
where estado_id = 5 group by nombre_usuario

go
-- CREADOS POR CONSULTOR

select nombre_usuario, count(id_ticket) as N_tickets from ticket 
inner join usuario on usuario.id_usuario = ticket.usuario_id 
 where Fecha between @fecha_inicio AND @fecha_fin group by nombre_usuario

 go
 --Trabajados por agente

select nombre_usuario, count(distinct ticket.id_ticket) as N_tickets from ticket 
inner join nota on nota.id_ticket = ticket.id_ticket 
inner join usuario on usuario.id_usuario = nota.usuario_id_nota
where FechaNota between @fecha_inicio AND @fecha_fin and nota_usuario = 1 group by nombre_usuario
go
--tickets por empresas

select nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket
inner join cliente on cliente.id_Cliente = ticket.cliente_id 
inner join empresa on empresa.id_empresa = cliente.empresa_id where Fecha between @fecha_inicio AND @fecha_fin
group by nombre_empresa order by COUNT(2)
go



drop procedure informe

 create proc informe
  @fecha_ini datetime,
  @fecha_fin datetime
  as
  begin
select * into #table_informe from (
select id_usuario, nombre_usuario as consulto, estado_Ticket as estado, id_ticket as N_tickets from ticket
inner join usuario on usuario.id_usuario = ticket.usuario_id
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
inner join acta on acta.ticket_id = ticket.id_ticket
where Fecha between @fecha_ini AND @fecha_fin and fecha_crea_acta between @fecha_ini AND @fecha_fin
and ticket_Habilitado= 'Si' )t

select * from #table_informe 
pivot (count(N_tickets) for estado in ([Abierto], [En proceso],[Resuelto],[Cerrado])) as fpv
group by fpv.id_usuario, fpv.consulto, Abierto, [En proceso],Resuelto,Cerrado
end

exec informe '2022-03-29 00:00:00', '2022-05-27 23:59:58';
select sum(n_creditos_acta), fk_usuario_id from acta where fk_usuario_id=10 and fecha_crea_acta between '2022-03-29 00:00:00' AND  '2022-05-27 23:59:58' group by fk_usuario_id






select COUNT(id_ticket) from ticket where usuario_id = 10 and estado_id=

	
DECLARE @Tabla1 TABLE(id INT IDENTITY(1,1), nombre VARCHAR(20), telefono VARCHAR(12));
	
	declare @nombres varchar(20);
	set @nombres ='estelita';
INSERT INTO @Tabla1 VALUES(@nombres, '222555');
INSERT INTO @Tabla1 VALUES('Juan', '222555');
INSERT INTO @Tabla1 VALUES('Juan', '222555');
INSERT INTO @Tabla1 VALUES('Juan', '222555');
INSERT INTO @Tabla1 VALUES(@nombres, '222555');
INSERT INTO @Tabla1 VALUES(@nombres, '222555');
INSERT INTO @Tabla1 VALUES(@nombres, '222555');
INSERT INTO @Tabla1 VALUES('Juan', '222555');

SELECT * FROM @Tabla1 ;

select count(n_creditos_acta)  from acta

select * from usuario where area_id in (select id_area from area where area_habilitado='Si') order by area_id


select id_area from area where area_habilitado='Si'