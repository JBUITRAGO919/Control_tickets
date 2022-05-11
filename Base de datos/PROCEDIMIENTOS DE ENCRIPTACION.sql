----PROCEDIMIENTOS COMPLETOS

--PROCEDIMIENTOS INGRESAR USUARIOS ENCRYPT

 create proc Sp_pass_usu
  @nombre_usuario nvarchar(45),
  @correo_usu nvarchar (45),
  @rol_id int,
  @prefijo_usuario nvarchar(45),
  @area_id int,
  @contrasena_usu nvarchar(45),
  @usuario_Habilitado nvarchar (45),
  @Patron varchar(50)
  as 
  begin 
  insert into usuario
				(nombre_usuario,correo_usu,rol_id,prefijo_usuario,area_id,contrasena_usu,usuario_Habilitado)
				values
				(@nombre_usuario,
				@correo_usu,
				@rol_id,
				@prefijo_usuario,
				@area_id,
				ENCRYPTBYPASSPHRASE('Dynamics1', @contrasena_usu),
				@usuario_Habilitado
				)
				end


--PROCEDIMIENTOS INGRESAR CLIENTES ENCRYPT

 create proc Sp_pass_clien
  @nombre_cliente nvarchar(45),
  @correo_cli nvarchar (45),
  @Telefono_cliente nvarchar(45),
  @rol_id int,
  @empresa_id int,
  @Contrasena_cli nvarchar (60),
  @Cliente_Habilitado nvarchar(45),
  @Patron varchar(50)
  as 
  begin 
  insert into cliente
				(nombre_cliente,correo_cli,Telefono_cliente,rol_id,empresa_id,Contrasena_cli,Cliente_Habilitado)
				values
				(@nombre_cliente,
				@correo_cli,
				@Telefono_cliente,
				@rol_id,
				@empresa_id,
				ENCRYPTBYPASSPHRASE('Dynamics1', @Contrasena_cli),
				@Cliente_Habilitado
				)
				end

----PROCEDIMIENTOS VALIDAR CLIENTE

create proc Validar_cli
  @correo_cli nvarchar (45),
  @Contrasena_cli nvarchar (60),
  @Cliente_Habilitado nvarchar(45),
  @Patron varchar(max)
  as 
  begin 
  select * from cliente 
				where correo_cli=@correo_cli and CONVERT(nvarchar(max), DECRYPTBYPASSPHRASE(@Patron, Contrasena_cli))=@Contrasena_cli
				end

--PROCEDIMIENTOS VALIDAR USUARIO

create proc Validar_usu
  @correo_usu nvarchar (45),
  @contrasena_usu nvarchar(45),
  @Patron varchar(max)
  as 
  begin 
  select * from usuario 
				where correo_usu = @correo_usu and CONVERT(nvarchar(max), DECRYPTBYPASSPHRASE(@Patron, contrasena_usu))= @contrasena_usu and usuario_Habilitado = 'Si' 
				end
				select * from usuario
----PROCEDIMIENTO UPDATE USUARIO

  create proc Sp_update_usu
  @id_usuario int,
  @nombre_usuario nvarchar(45),
  @correo_usu nvarchar (45),
  @rol_id int,
  @prefijo_usuario nvarchar(45),
  @area_id int,
  @contrasena_usu nvarchar(MAX),
  @usuario_Habilitado nvarchar (45),
  @Patron varchar(50)
  as 
  begin 
  UPDATE usuario SET 
					 nombre_usuario = @nombre_usuario, 
					 correo_usu = @correo_usu, 
					 rol_id = @rol_id, 
					 prefijo_usuario = @prefijo_usuario,
					 area_id = @area_id,
					 contrasena_usu = ENCRYPTBYPASSPHRASE('Dynamics1', @contrasena_usu),
					 usuario_Habilitado = @usuario_Habilitado
					 WHERE id_usuario = @id_usuario 
					 end

--PROCEDIMIENTO UPDATE CLIENTE

  create proc Sp_update_cli
  @id_Cliente int,
  @nombre_cliente nvarchar(45),
  @correo_cli nvarchar (45),
  @Telefono_cliente nvarchar(45),
  @rol_id int,
  @empresa_id int,
  @Contrasena_cli nvarchar(max),
  @Cliente_Habilitado nvarchar (45),
  @Patron varchar(50)
  as 
  begin 
  UPDATE cliente SET 
					 nombre_cliente = @nombre_cliente, 
					 correo_cli = @correo_cli, 						
					 Telefono_cliente = @Telefono_cliente,
					 rol_id = @rol_id,
					 empresa_id = @empresa_id,
					 Contrasena_cli = ENCRYPTBYPASSPHRASE('Dynamics1', @Contrasena_cli),
					 Cliente_Habilitado = @Cliente_Habilitado
					 WHERE id_Cliente = @id_Cliente
					 end