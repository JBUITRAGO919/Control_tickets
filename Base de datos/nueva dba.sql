CREATE DATABASE DynaIT;
USE DynaIT;
go
CREATE TABLE rol  (
	id_rol int IDENTITY(1,1) NOT NULL,
	rol nvarchar(45) NOT NULL,
	rol_habiliado nvarchar(45) NOT NULL DEFAULT 'Si',
	CONSTRAINT pk_id_rol PRIMARY KEY (id_rol),
	CONSTRAINT uk_id_rol unique (id_rol));


	insert into rol (rol) 
	VALUES
	('--Seleccionar--'),
	('Administrador'),
	('Agente'),
	('Cliente admin'),
	('Cliente');

	select * from rol;

CREATE TABLE area(
	id_area int IDENTITY(1,1) NOT NULL,
	area nvarchar(45) NOT NULL,
	area_Habilitado nvarchar(45) NOT NULL DEFAULT 'Si',
	CONSTRAINT pk_id_area PRIMARY KEY(id_area),
	CONSTRAINT uk_id_area unique (id_area));

	insert into area(area) 
	VALUES
	('--Seleccionar--'),
	('Tegnologia'),
	('nomina'),
	('facturacion electronica');

	select * from area;


	CREATE TABLE usuario(
	id_usuario int IDENTITY(1,1) NOT NULL,
	nombre_usuario nvarchar(45) NOT NULL,
	correo_usu nvarchar(45) NOT NULL,
	rol_id int NOT NULL,
	prefijo_usuario nvarchar(45) NOT NULL,
	area_id int NOT NULL,
	contrasena_usu nvarchar(MAX) NOT NULL,
	usuario_Habilitado nvarchar(45) NOT NULL DEFAULT 'Si',
	CONSTRAINT pk_id_usuario PRIMARY KEY(id_usuario),
	CONSTRAINT uk_id_usuario unique (id_usuario),
	CONSTRAINT fk_id_area foreign key (area_id) REFERENCES area (id_area),
	CONSTRAINT fk_id_rol foreign key (rol_id) REFERENCES rol (id_rol));
 
 insert into usuario(nombre_usuario, correo_usu, rol_id, prefijo_usuario, area_id, contrasena_usu) 
	VALUES
	('Sin asignar', 'sin asignar',1,'Sin asignar',1, '***00101'),
	('Javier Buitrago', 'jbuitrago919@gmail.com', 2, 'c28',2, 'Password13');

	select * from usuario;
	update usuario set rol_id = 2 where id_usuario =10


 CREATE TABLE empresa(
	id_empresa int IDENTITY(1,1) NOT NULL,
	nombre_empresa nvarchar(45) NOT NULL,
	nit nvarchar(45) NOT NULL,
	telefono_empresa nvarchar(45) NOT NULL,
	representante_empresa nvarchar(45)NOT NULL,
	empresa_habilitada nvarchar(45) NOT NULL DEFAULT 'Si',
	CONSTRAINT pk_id_empresa PRIMARY KEY(id_empresa),
	CONSTRAINT uk_id_empresa unique (id_empresa));
 
 insert into empresa(nombre_empresa, nit, telefono_empresa, representante_empresa) 
	VALUES
	('--Seleccionar--', '--Seleccionar--','--Seleccionar--','--Seleccionar--'),
	('Espumas', '9001274376','7354578','Pedro perez');

	select * from empresa;

CREATE TABLE cliente(
	id_Cliente int IDENTITY(1,1) NOT NULL,
	nombre_cliente nvarchar(45) NOT NULL,
	correo_cli nvarchar(45) NOT NULL,
	Telefono_cliente nvarchar(45) NOT NULL,
	rol_id int NOT NULL,
	empresa_id int NOT NULL,
	Contrasena_cli nvarchar(max) NOT NULL,
	Cliente_Habilitado nvarchar(45) NOT NULL DEFAULT 'Si',
 CONSTRAINT pk_idCliente PRIMARY KEY (id_Cliente),
 CONSTRAINT uk_idCliente unique (id_Cliente),
 CONSTRAINT fk_id_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa),
 CONSTRAINT fk_id_rol_cliente foreign key (rol_id) REFERENCES rol (id_rol));
 
 insert into cliente(nombre_cliente, correo_cli, Telefono_cliente, rol_id, empresa_id,Contrasena_cli) 
	VALUES
	('--Seleccionar--', '--Seleccionar--','--Seleccionar--',1,1,'--Seleccionar--'),
	('fabio perez', 'jbuitrago919@misena.edu.co', '3005013887', 3, 2,'password12');

	select * from estado_ticket;

	select * from rol




CREATE TABLE estado_ticket(
	id_Estado_Ticket int IDENTITY(1,1) NOT NULL,
	estado_Ticket nvarchar(45) NOT NULL,
	estado_Habilitado nvarchar(45) NOT NULL DEFAULT 'Si',
 CONSTRAINT PK_id_estado_Ticket PRIMARY KEY (id_estado_Ticket ),
 CONSTRAINT uk_id_Estado_ticket unique (id_Estado_ticket));

 insert into estado_ticket(estado_Ticket) values('--Seleccionar--'),('Abierto'),('En proceso'),('Resuleto'),('Cerrado');
 select * from estado_ticket;

 CREATE TABLE prioridad(
	id_prioridad int IDENTITY(1,1) NOT NULL,
	Prioridad nvarchar(45) NOT NULL,
	H_respuesta_prioridad int NOT NULL, 
	prioridad_habilitada nvarchar(45) NOT NULL DEFAULT 'Si',
CONSTRAINT pk_id_prioridad PRIMARY KEY (id_prioridad),
CONSTRAINT uk_id_prioridad unique (id_prioridad));

insert into prioridad(Prioridad, H_respuesta_prioridad) values('--Seleccionar--', 0 ),('Baja', 12),('Media',6),('Alta',3),('Urgente',1);
 select * from prioridad;


CREATE TABLE tipo_ticket(
	id_tipo_Ticket int IDENTITY(1,1) NOT NULL,
	tipo_Ticket nvarchar(45)NOT  NULL,
	Tipo_Ticket_Habilitado nvarchar(45) NOT NULL DEFAULT 'Si',
	H_respuesta_tipo_ticket int NOT NULL,
 CONSTRAINT pk_id_tipo_Ticket PRIMARY KEY (id_tipo_Ticket),
 CONSTRAINT uk_id_tipo_Ticket unique (id_tipo_Ticket));

 insert into tipo_ticket(tipo_Ticket, H_respuesta_tipo_ticket) values('--Seleccionar--', 0 ),('Incidente', 24),('Desarrollo',30);
 select * from tipo_ticket;

 CREATE TABLE ticket(
	id_ticket int IDENTITY(1,1) NOT NULL,
	Fecha datetime2 NOT NULL DEFAULT '0001-01-01 00:00:00',
	Resumen_Problema nvarchar(100) NOT NULL,
	Descripcion nvarchar(max) NOT NULL,
	tipo_ticket_id int NOT NULL,
	prioridad_id int NOT NULL,
	estado_id int NOT NULL,
	cliente_id int NOT NULL,
	usuario_id int NOT NULL,
	ticket_Creado_por nvarchar(45) NOT NULL,
	creditos_desarrollo int NOT NULL DEFAULT 0,
	creditos_garantia int NOT NULL DEFAULT 0,
	fecha_vencimiento datetime2 NOT NULL DEFAULT '0001-01-01 00:00:00',
	ticket_Habilitado nvarchar(45) NOT NULL DEFAULT 'Si',
	fecha_inicio_proceso datetime2 NOT NULL DEFAULT '0001-01-01 00:00:00',
	fecha_resuelto_ticket datetime2 NOT NULL DEFAULT '0001-01-01 00:00:00',
	fecha_cierre_ticket datetime2 NOT NULL DEFAULT '0001-01-01 00:00:00',
	adjuntos_ticket nvarchar(500) NOT NULL,
	numero_Dias int NOT NULL DEFAULT 0,
	numero_Factura nvarchar(100) NOT NULL DEFAULT 0,
	CONSTRAINT pk_id_ticket PRIMARY KEY CLUSTERED (id_Ticket),
	CONSTRAINT uk_id_Ticket unique (id_Ticket),
	CONSTRAINT fk_id_tipo_ticket FOREIGN KEY (tipo_ticket_id) REFERENCES tipo_ticket (id_tipo_ticket),
	CONSTRAINT fk_id_prioridad FOREIGN KEY (prioridad_id) REFERENCES prioridad (id_prioridad),
	CONSTRAINT fk_id_estado FOREIGN KEY (estado_id) REFERENCES estado_ticket (id_estado_ticket),
	CONSTRAINT fk_id_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente),
	CONSTRAINT fk_id_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
	);
	insert into ticket(Resumen_Problema, Descripcion, tipo_ticket_id,prioridad_id,estado_id,cliente_id,usuario_id,ticket_Creado_por, adjuntos_ticket) 
					values('errorese de inserción','errorese de inserción', 2,2,2,2,2,'jbuitrago919@gmail.com', 'E:\archivos adjuntos\1' );
	select * from ticket;

CREATE TABLE nota(
	id_nota int IDENTITY(1,1) NOT NULL,
	descripcionNota nvarchar(max) NOT NULL,
	FechaNota datetime2 NOT NULL DEFAULT '0001-01-01 00:00:00',
	id_ticket int NOT NULL,
	nota_creada_por nvarchar(45) NOT NULL,
	nota_interna nvarchar(45)NOT NULL,
	notas_Habilitado nvarchar(45) NOT NULL DEFAULT 'Si',
	adjuntos_nota nvarchar(500) NOT NULL,
	nota_usuario bit not null, DEFAULT 0,
 CONSTRAINT PK_id_nota PRIMARY KEY(id_nota),
 CONSTRAINT uk_id_nota unique (id_nota),
 CONSTRAINT FK_nota_usuario_id FOREIGN KEY (nota_creada_por) REFERENCES usuario (id_usuario)),
 CONSTRAINT fk_id_ticket_nota FOREIGN KEY (id_ticket) REFERENCES ticket (id_ticket));

 insert into nota(descripcionNota,id_ticket, nota_creada_por, nota_interna, adjuntos_nota) values('validar inserciones vacias',1,'jbuitrago919qgmail.com','Si','e:\');
 SELECT nota_usuario FROM nota;

CREATE TABLE notas_compartida_usuario (
	id_Notas_compartida_usuario int IDENTITY(1,1) NOT NULL,
	nota_id int NOT NULL,
	usario_id int NOT NULL,
 CONSTRAINT pk_id_Notas_compartida_usuario PRIMARY KEY (id_Notas_compartida_usuario),
 CONSTRAINT uk_id_Notas_compartida_usuario unique (id_Notas_compartida_usuario),
 CONSTRAINT fk_id_usuario_n_compartida FOREIGN KEY (id_Notas_compartida_usuario) REFERENCES usuario (id_usuario),
 CONSTRAINT fk_id_Nota_compartida FOREIGN KEY (nota_id) REFERENCES nota (id_nota));

 insert into notas_compartida_usuario(nota_id, usario_id) values(1,2);
 SELECT * FROM notas_compartida_usuario;

 CREATE TABLE acta(
	id_acta int IDENTITY(1,1) NOT NULL,
	numero_Acta nvarchar(45) NOT NULL DEFAULT '0',
	fecha_crea_acta datetime2 NOT NULL DEFAULT '0001-01-01 00:00:00',
	ticket_id int NOT NULL,
	n_creditos_acta nvarchar(45) NOT NULL DEFAULT 0,
	numero_Factura nvarchar(45) NOT NULL DEFAULT '0',
	CONSTRAINT pk_id_acta PRIMARY KEY (id_acta),
	CONSTRAINT uk_id_acta unique (id_acta),
	CONSTRAINT fk_id_ticket_acta FOREIGN KEY (ticket_id) REFERENCES ticket(id_ticket));	
	
	
	
	
			insert into acta(numero_Acta, fecha_crea_acta, ticket_id, n_creditos_acta, fk_usuario_id) values('3-c58-27', '2022-04-13 08:22:14.0000000', 1, 5, 10);
   
 SELECT * FROM acta;
	GO



	select  Resumen_Problema, tipo_ticket.tipo_Ticket, estado_ticket.estado_ticket, 
                 Descripcion, Fecha,  cliente.nombre_cliente, usuario.nombre_usuario, 
                 Cliente_id, Usuario_id, estado_id, fecha_vencimiento, 
                 Fecha_inicio_proceso, creditos_desarrollo, Adjuntos_ticket, empresa.id_Empresa, 
                 empresa.Nombre_Empresa, empresa.Representante_empresa, usuario.prefijo_usuario from ticket 
                 inner join cliente on cliente.id_cliente = ticket.Cliente_id
                 inner join usuario on usuario.id_usuario = ticket.Usuario_id
                 inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id
                 inner join tipo_ticket on tipo_ticket.id_tipo_Ticket = ticket.tipo_ticket_id 
                 inner join empresa on empresa.id_Empresa = cliente.empresa_id
                 where ticket.id_ticket = 1


				 select count(*) from ticket where estado_id = '3'


				 select nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket 
 inner join cliente on cliente.id_Cliente = ticket.cliente_id
 inner join empresa on empresa.id_empresa = cliente.empresa_id
 group by nombre_empresa
 order by COUNT (2)

select top 10 nombre_usuario, count(id_usuario) as N_tickets from ticket
 inner join usuario on usuario.id_usuario = ticket.Usuario_id
 group by nombre_usuario
 order by count(2) desc

 SELECT id_Empresa, Nombre_Empresa FROM empresa where Empresa_Habilitada = 'Si' or id_Empresa = '1'

 SELECT id_usuario, nombre_usuario FROM usuario where Usuario_Habilitado = 'Si' or id_usuario = '1'

 SELECT id_Estado_Ticket, estado_Ticket FROM estado_ticket where estado_Habilitado = 'Si' or id_Estado_Ticket = '1'

 SELECT id_acta, Numero_Acta, ticket_id, Fecha_crea_acta, ticket.creditos_desarrollo, N_creditos_acta, ticket.Resumen_Problema, empresa.Nombre_Empresa, 
empresa.Representante_empresa, usuario.nombre_usuario, acta.Numero_Factura, ticket.Fecha, ticket.Fecha_cierre_ticket,estado_ticket.estado_Ticket
FROM acta inner join ticket on ticket.id_ticket = acta.ticket_id
inner join cliente on cliente.id_Cliente = ticket.Cliente_id
inner join empresa on empresa.id_Empresa = cliente.empresa_id
inner join usuario on usuario.id_usuario = ticket.Usuario_id
inner join estado_ticket on ticket.estado_id = estado_ticket.id_Estado_Ticket
order by id_acta desc

SELECT id_acta, Numero_Acta, ticket_id, Fecha_crea_acta, ticket.creditos_desarrollo, N_creditos_acta, ticket.Resumen_Problema, 
                 empresa.Nombre_Empresa, empresa.Representante_empresa, usuario.nombre_usuario, acta.Numero_Factura,
                 ticket.Fecha, ticket.Fecha_cierre_ticket, estado_ticket.estado_Ticket FROM acta 
				 inner join ticket on ticket.id_ticket = acta.ticket_id
                 inner join cliente on cliente.id_Cliente = ticket.Cliente_id
                 inner join empresa on empresa.id_Empresa = cliente.empresa_id 
                 inner join usuario on usuario.id_usuario = ticket.Usuario_id
                 inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
                 where Id_Empresa = @Id_Empresa order by acta.id_acta desc

				 SELECT id_acta, Numero_Acta, ticket_id, Fecha_crea_acta, ticket.creditos_desarrollo, N_creditos_acta, ticket.Resumen_Problema, 
                 empresa.Nombre_Empresa, empresa.Representante_empresa, usuario.nombre_usuario, acta.Numero_Factura, estado_ticket.estado_Ticket, 
                 ticket.Fecha, ticket.Fecha_cierre_ticket FROM acta 
				 inner join ticket on ticket.id_ticket = acta.ticket_id
                 inner join cliente on cliente.id_Cliente = ticket.Cliente_id
                 inner join empresa on empresa.id_Empresa = cliente.empresa_id
                 inner join usuario on usuario.id_usuario = ticket.Usuario_id
                 inner join estado_ticket on ticket.estado_id = estado_ticket.id_Estado_Ticket 
                 where Id_Empresa = @Id_Empresa and usuario.id_usuario = @idUsuario order by ticket.id_ticket desc



SELECT id_acta, Numero_Acta, ticket_id, Fecha_crea_acta, ticket.creditos_desarrollo, N_creditos_acta, ticket.Resumen_Problema,
                 empresa.Nombre_Empresa, empresa.Representante_empresa, usuario.nombre_usuario, acta.Numero_Factura, estado_ticket.estado_Ticket,
                 ticket.Fecha, ticket.Fecha_cierre_ticket 
				 FROM acta 
				 inner join ticket on ticket.id_ticket = acta.ticket_id
                 inner join cliente on cliente.id_Cliente = ticket.Cliente_id 
                 inner join empresa on empresa.id_Empresa = cliente.empresa_id
                 inner join usuario on usuario.id_usuario = ticket.Usuario_id
                 inner join estado_ticket on ticket.estado_id = estado_ticket.id_Estado_Ticket 
                 where ticket.estado_id = @idEstadoticket and usuario.id_usuario = @idUsuario order by ticket.id_ticket desc


				 SELECT id_acta, Numero_Acta, ticket_id, Fecha_crea_acta, ticket.creditos_desarrollo, N_creditos_acta, ticket.Resumen_Problema, 
                 empresa.Nombre_Empresa, empresa.Representante_empresa, usuario.nombre_usuario, acta.Numero_Factura, estado_ticket.estado_Ticket, 
                 ticket.Fecha, ticket.Fecha_cierre_ticket
				 FROM acta 
				 inner join ticket on ticket.id_ticket = acta.ticket_id
                 inner join cliente on cliente.id_Cliente = ticket.Cliente_id 
                 inner join empresa on empresa.id_Empresa = cliente.empresa_id 
                 inner join usuario on usuario.id_usuario = ticket.Usuario_id 
                 inner join estado_ticket on ticket.estado_id = estado_ticket.id_Estado_Ticket 
                 where ticket.estado_id = @idEstado_Ticket order by ticket.id_ticket desc;


				 SELECT id_acta, Numero_Acta, ticket_id, Fecha_crea_acta, ticket.creditos_desarrollo, N_creditos_acta, ticket.Resumen_Problema,
                empresa.Nombre_Empresa, empresa.Representante_empresa, usuario.nombre_usuario, acta.Numero_Factura, estado_ticket.estado_Ticket, 
                ticket.Fecha, ticket.Fecha_cierre_ticket FROM acta 
                inner join ticket on ticket.id_ticket = acta.ticket_id 
                inner join cliente on cliente.id_Cliente = ticket.Cliente_id 
                inner join empresa on empresa.id_Empresa = cliente.empresa_id 
                inner join usuario on usuario.id_usuario = ticket.Usuario_id 
                inner join estado_ticket on ticket.estado_id = estado_ticket.id_Estado_Ticket 
                where Id_Empresa = 1 and usuario.id_usuario = 3 order by ticket.id_ticket desc
				 

	select top 10 nombre_usuario, count(id_usuario) as N_tickets from ticket
 inner join usuario on usuario.id_usuario = ticket.Usuario_id
 group by nombre_usuario
 order by count(2) desc





 select top (5) nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where estado_id = 5 and fecha_cierre_ticket between @fecha_inicio AND @fecha_fin group by nombre_usuario

  select * from ticket where estado_id =5


  select top(1) nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket 
 inner join cliente on cliente.id_Cliente = ticket.cliente_id
 inner join empresa on empresa.id_empresa = cliente.empresa_id
 group by nombre_empresa
 order by COUNT (2)

 

 select nombre_usuario, count(ticket.id_ticket) as N_tickets, sum(n_creditos_acta) as N_creditos from ticket
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  inner join nota on nota.id_ticket = ticket.id_ticket
  inner join acta on acta.ticket_id = ticket.id_ticket  
  where FechaNota between '2022-04-05 00:00:00' AND '2022-04-05 23:59:58' group by nombre_usuario, acta.n_creditos_acta

  select * from ticket where usuario_id = 15;
  select * from usuario

select nombre_usuario, count(ticket.id_ticket) as N_tickets, sum(n_creditos_acta) as N_creditos from acta
inner join ticket on ticket.id_ticket = acta.ticket_id
inner join usuario on usuario.id_usuario = acta.fk_usuario_id 
where acta.fecha_crea_acta  between '2022-04-04 00:00:00' AND '2022-04-07 23:59:58'  group by nombre_usuario

select * from nota

  select * from usuario


  select * from cliente

  select ticket_Habilitado from ticket where id_ticket=27

  SELECT id_Cliente, nombre_cliente FROM cliente WHERE empresa_id = 1 and Cliente_Habilitado ='Si';



  select top (5) nombre_usuario, COUNT(ticket.id_ticket) as N_tickets from nota  
  inner join ticket on ticket.id_ticket = nota.id_ticket
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where FechaNota between '2022-04-05 00:00:00' AND '2022-04-05 23:59:58' group by nombre_usuario

  select * from nota

    select Resumen_Problema, tipo_ticket.tipo_Ticket, estado_ticket.estado_ticket,
                 Descripcion, Fecha,  cliente.nombre_cliente, usuario.nombre_usuario, 
                 Cliente_id, Usuario_id, estado_id, fecha_vencimiento, 
                 Fecha_inicio_proceso, creditos_desarrollo, Adjuntos_ticket, empresa.id_Empresa, 
                 empresa.Nombre_Empresa, empresa.Representante_empresa, usuario.prefijo_usuario, id_ticket from ticket 
                 inner join cliente on cliente.id_cliente = ticket.Cliente_id 
                 inner join usuario on usuario.id_usuario = ticket.Usuario_id 
                 inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
                 inner join tipo_ticket on tipo_ticket.id_tipo_Ticket = ticket.tipo_ticket_id  
                 inner join empresa on empresa.id_Empresa = cliente.empresa_id 
                 where ticket.id_ticket = 21


				  Select ticket.id_ticket, Tipo_Ticket_Habilitado, tipo_ticket.tipo_Ticket, ticket.Fecha, ticket.Resumen_Problema, ticket.Descripcion, 
                 prioridad.Prioridad, empresa.Nombre_Empresa, cliente.nombre_cliente, usuario.nombre_usuario,
                 estado_ticket.estado_ticket, ticket.Ticket_Creado_por, ticket.creditos_desarrollo, ticket.Fecha_cierre_ticket, ticket.Numero_Dias 
                 from ticket 
                 inner join prioridad on prioridad.id_prioridad = ticket.prioridad_id 
                 inner join cliente on cliente.id_Cliente = ticket.cliente_id 
                 inner join empresa on empresa.id_empresa = cliente.empresa_id
                 inner join usuario on Usuario.id_usuario = ticket.usuario_id 
                 inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
                 inner join tipo_ticket on tipo_ticket.id_tipo_Ticket = ticket.tipo_ticket_id where ticket_Habilitado='Si'  order by ticket.id_ticket desc 


				 select id_ticket, ticket_Habilitado, fecha_vencimiento from ticket where ticket_Habilitado='Si'
				 select * from estado_ticket

				 SELECT id_ticket, fecha_vencimiento FROM ticket 
                 where fecha_vencimiento <= '8/04/2022 8:23:05 p. m.' and estado_id = 2 or estado_id = 3


				 select top (5) nombre_usuario, count(id_ticket) as N_tickets from ticket 
                 inner join usuario on usuario.id_usuario = ticket.usuario_id 
where Fecha between '2022-04-05 00:00:00' AND '2022-04-11 23:59:58' group by nombre_usuario

select nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where Fecha between '2022-04-05 00:00:00' AND '2022-04-11 23:59:58' group by nombre_usuario

  select nombre_usuario, count(id_ticket) as N_tickets from ticket 
                 inner join usuario on usuario.id_usuario = ticket.usuario_id 
                 where Fecha between '2022-04-05 00:00:00' AND '2022-04-11 23:59:58' group by nombre_usuario
				 
				 select Fecha from ticket where id_ticket = 31

				 select *from estado_ticket

				 select id_ticket, fecha_inicio_proceso from ticket where fecha_inicio_proceso < '2021-04-12 00:00:00'

				 select nombre_usuario, count(id_ticket) as N_tickets from ticket 
                 inner join usuario on usuario.id_usuario = ticket.usuario_id 
                 where Fecha between '2022-04-05 00:00:00' AND '2022-04-11 23:59:58' group by nombre_usuario


select top(@top_trabajados) nombre_usuario, count(ticket.id_ticket) as N_tickets from ticket 
                 inner join usuario on usuario.id_usuario = ticket.usuario_id 
                 inner join nota on nota.id_ticket = ticket.id_ticket 
                 where FechaNota between @fecha_inicio AND @fecha_fin group by nombre_usuario 

				 select top(5) nombre_usuario, count(ticket.id_ticket) as N_tickets from ticket 
                inner join usuario on usuario.id_usuario = ticket.usuario_id 
                 inner join nota on nota.id_ticket = ticket.id_ticket 
                 where FechaNota between '2022-04-05 00:00:00' AND '2022-04-11 23:59:58' group by nombre_usuario


				 select top (@top_empresa) nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket 
 inner join cliente on cliente.id_Cliente = ticket.cliente_id
 inner join empresa on empresa.id_empresa = cliente.empresa_id where Fecha between @fecha_inicio AND @fecha_fin
 group by nombre_empresa order by COUNT (2)



				 select * from ticket

				 select  estado_Ticket, COUNT(id_Estado_Ticket) as N_tickets from ticket 
         inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id where Fecha between @fecha_inicio AND @fecha_fin
         group by estado_Ticket order by COUNT (2)


select nombre_usuario, count(ticket.id_ticket) as N_tickets, sum(n_creditos_acta) as N_creditos from acta
inner join ticket on ticket.id_ticket = acta.ticket_id
inner join usuario on usuario.id_usuario = acta.fk_usuario_id 
where acta.fecha_crea_acta  between '2022-04-13 00:00:00' AND '2022-04-13 23:59:58' group by nombre_usuario



select id_usuario, nombre_usuario, rol from usuario inner join rol on rol.id_rol= usuario.rol_id where correo_usu = @Correo
SELECT id_Cliente, nombre_cliente, rol, empresa_id FROM cliente inner join rol on rol.id_rol= cliente.rol_id where correo_cli = @correo_cli 

SELECT count(id_ticket) as N_tickets FROM ticket where fecha_vencimiento <= '2022-04-13 00:00:00' and estado_id = 2 or estado_id = 3

SELECT id_ticket, fecha_vencimiento FROM ticket  where fecha_vencimiento <= '2022-04-13 00:00:00' and estado_id = 2 or estado_id = 3






  select top(5) nombre_usuario, count(ticket.id_ticket) as N_tickets from ticket 
  inner join nota on nota.id_ticket = ticket.id_ticket
  inner join usuario on usuario.id_usuario = nota.nota_creada_por
                 where FechaNota between '2022-04-19 00:00:00' AND '2022-04-19 23:59:58' group by nombre_usuario 
--ultimo ticket
go
  select COUNT(ticket.id_ticket) as N_ticket_trabajados from ticket
  inner join nota on nota.id_ticket = ticket.id_ticket
  inner join usuario on usuario.id_usuario = nota.usuario_id_nota
  where ticket.id_ticket = nota.id_ticket and FechaNota between '2022-04-27 00:00:00' AND '2022-04-27 23:59:58'   
  group by nombre_usuario

select nombre_usuario, count(distinct nota.id_ticket) as N_tickets from ticket 
 inner join nota on nota.id_ticket = ticket.id_ticket 
inner join usuario on usuario.id_usuario = nota.usuario_id_nota 
where FechaNota between '2022-04-27 00:00:00' AND '2022-04-27 23:59:58'  and nota_usuario = 1 group by nombre_usuario

select nombre_usuario, count(distinct ticket.id_ticket) as N_tickets from ticket 
inner join nota on nota.id_ticket = ticket.id_ticket 
inner join usuario on usuario.id_usuario = nota.usuario_id_nota
where FechaNota between '2022-03-01 00:00:00' AND '2022-04-27 23:59:58' and nota_usuario = 1 group by nombre_usuario

select id_usuario, nombre_usuario, rol, rol_id from usuario inner join rol on rol.id_rol= usuario.rol_id where correo_usu = 'jbuitrago919@gmail.com'


--CERRADOS POR CONSULTOR
declare @ticket_cerrados int;
declare @tickets_creados int;
set @ticket_cerrados = (select nombre_usuario, count(id_ticket) as N_Ticket_cerrados from ticket 
inner join usuario on usuario.id_usuario = ticket.usuario_id 
where estado_id = 5 and fecha_cierre_ticket between '2022-03-01 00:00:00' AND '2022-04-27 23:59:58' group by nombre_usuario)

set @tickets_creados = (select nombre_usuario, count(id_ticket) as N_ticket_creados from ticket 
inner join usuario on usuario.id_usuario = ticket.usuario_id 
 where Fecha between '2022-03-01 00:00:00' AND '2022-04-27 23:59:58' group by nombre_usuario)

 select nombre_usuario, @ticket_cerrados, @tickets_creados from ticket
 inner join usuario on usuario.id_usuario = ticket.usuario_id 

 DBCC CHECKIDENT(([acta], RESEED,100)
 

 
 select id_ticket as n_ticket, max(id_nota)as ultima_nota from nota group by id_ticket
 
 select ticket.id_ticket, 
 isnull((select max(id_nota)as ultima_nota from nota where nota.id_ticket = ticket.id_ticket group by id_ticket),0)
 from ticket
 inner join nota on nota.id_ticket= ticket.id_ticket 
 where nota_usuario =0 group by ticket.id_ticket


 select ticket.id_ticket, 
 (select max(id_nota)as ultima_nota from nota where nota.id_ticket = ticket.id_ticket group by id_ticket) 
 from ticket

 select ticket.id_ticket from ticket 
 where  case 
	when (select max(id_nota)as ultima_nota,
	case  
		when nota_usuario = 0 then 'Si'
		else 'no'
		end	 
		from nota where nota.id_ticket = ticket.id_ticket group by id_ticket)
		then
end
 
 select id_ticket, nota_usuario from nota where id_nota= 13


 select id_ticket, 
 case nota_usuario 
 when 0 then id_ticket
 end,
 from nota

SELECT ticket.id_ticket, 
 (select max(id_nota)as ultima_nota from nota where nota.id_ticket = ticket.id_ticket)as n_nota 
FROM ticket
inner join nota on nota.id_ticket = ticket.id_ticket 
ORDER BY 
CASE nota.nota_usuario WHEN 0 THEN 0 END 

select nota_usuario from nota where id_nota= @id_nota
 