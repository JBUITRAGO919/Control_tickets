use DynaIT

select top(@top_trabajados) nombre_usuario, 
(select count(id_acta) from acta where fecha_crea_acta between @fecha_inicio and @fecha_fin and acta.fk_usuario_id = usuario.id_usuario ) as n_tickets
from usuario where usuario_Habilitado = 'Si' 

select  nombre_usuario, 
(select count(id_acta) from acta where fecha_crea_acta between '2022-05-11 00:00:00' and '2022-05-11 23:59:58' and acta.fk_usuario_id = usuario.id_usuario ) as n_tickets
from usuario where usuario_Habilitado = 'Si' order by n_tickets desc


select (@top_trabajados) nombre_usuario, 
(select count(*) from (select DISTINCT ticket_id from acta where fecha_crea_acta between @fecha_inicio and @fecha_fin and acta.fk_usuario_id = usuario.id_usuario )t ) as n_ticket
from usuario where usuario_Habilitado = 'Si' 


select id_usuario, nombre_usuario, 
(select count(*) from (select DISTINCT ticket_id from acta where fecha_crea_acta between '2022-05-11 00:00:00' and '2022-05-11 23:59:58' and acta.fk_usuario_id = usuario.id_usuario )t ) as n_ticket
from usuario where usuario_Habilitado = 'Si' 
select * from acta where fecha_crea_acta between '2022-05-11 00:00:00' and '2022-05-11 23:59:58'





select * from acta