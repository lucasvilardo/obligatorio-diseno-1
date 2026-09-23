use master 
go

create database Diseño1
go

use Diseño1
go

USE master
go
 
CREATE LOGIN [IIS APPPOOL\DefaultAppPool] FROM WINDOWS   
go
 
 
USE Diseño1
go
 
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] 
go
 
Grant execute To [IIS APPPOOL\DefaultAppPool]
go

-- TABLAS --------------------------------------------

create table Usuario
(
	NomUsuario varchar(30) primary key check(LEN(NomUsuario) >= 8 ),
	Mail varchar(60) check(Mail like '_%@_%._%'),
	FechaNacimiento date not null check(FechaNacimiento < getdate()),
	NomCompleto varchar(30) not null,
	Contraseña varchar(8) check(LEN(Contraseña) = 8 and Contraseña like '%[a-zA-Z]%[a-zA-Z]%[a-zA-Z]%'
						and Contraseña like '%[0-9]%[0-9]%[0-9]%'
						and Contraseña like '%[^a-zA-Z0-9]%[^a-zA-Z0-9]%'),
	ActivoUsu bit not null default(1)
)

create table Mensaje
(
	NumIdenti int primary key  identity (1,1),
	FyHEnvio datetime not null default(getdate()),
	Asunto varchar(80)  not null,
	Texto varchar(max) not null, 
	NomUsuario varchar(30) not null foreign key references Usuario(NomUsuario),
	ActivoMen bit not null default(1)
)

create table Categoria
(
	CodCat varchar(3) not null primary key check (CodCat like '[A-Za-z][A-Za-z][A-Za-z]'),
	NomCat varchar(30) not null 
)

create table Recordatorio
(
	NumIdenti int primary key foreign key references Mensaje(NumIdenti),
	TipoRecordatorio varchar(8) not null check(TipoRecordatorio in ('Laboral', 'Estudio', 'Personal'))
)
create table Privado
(
	NumIdenti int primary key foreign key references Mensaje(NumIdenti),
	FechaCaducidad datetime not null check(FechaCaducidad >= DATEADD(DAY, 1, GETDATE())) 
)
create table Comun
(
	NumIdenti int primary key foreign key references Mensaje(NumIdenti),
	CodCat varchar(3) not null foreign key references Categoria(CodCat) 
)
create table Recibe
(
	NomUsuario varchar(30) not null foreign key references Usuario(NomUsuario),
	NumIdenti int not null foreign key references Mensaje(NumIdenti),
	primary key (NomUsuario, NumIdenti)
)																																															  
																					   select * from Usuario where nomUsuario = 'Juancito11'	   update Usuario set ActivoUsu = 1 where NomUsuario = 'Juancito11' 
----- DATOS DE PRUEBA ----------																												 

-----   USUARIOS   ---------------

insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Juancito11', 'juancito11@gmail.com', '20020629', 'Juan Rodriguez', 'jua123&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Roberto123', 'roberto123@gmail.com', '19981112', 'Roberto Sanchez', 'rob638"$')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Laura1998', 'laura98@gmail.com', '19980522', 'Laura Fernandez', 'lau456&%')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Tomasito1', 'tomas1@gmail.com', '19970314', 'Tomas Perez', 'tom123$!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Valen2000', 'valen00@gmail.com', '20001230', 'Valentina Gomez', 'val789*@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Luciano33', 'lucho33@gmail.com', '19960908', 'Luciano Lopez', 'luc369@#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('MartinaA1', 'martina@gmail.com', '20010617', 'Martina Acosta', 'mar741!&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('EmaRodri9', 'emarodri@gmail.com', '19991105', 'Emanuel Rodríguez', 'ema852#@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Meli_1999', 'meli99@gmail.com', '19990222', 'Melina Ruiz', 'mel753&*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Santi9999', 'santiz@gmail.com', '20000412', 'Santiago Diaz', 'san321$#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Luana5678', 'luana@gmail.com', '19980810', 'Luana Torres', 'lua999&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Gonza2023', 'gonza23@gmail.com', '19970131', 'Gonzalo Cabrera', 'gon147*%')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Carla2022', 'carla22@gmail.com', '20000727', 'Carla Morales', 'car888@&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Nico_1987', 'nico87@gmail.com', '19870304', 'Nicolas Viera', 'nic321*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Romi0000', 'romina@gmail.com', '19951030', 'Romina Silva', 'rom456&!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Fede_1234', 'fede12@gmail.com', '19960615', 'Federico Nuñez', 'fed963#@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Sofi1994', 'sofi94@gmail.com', '19940111', 'Sofia Castro', 'sof741!&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Marce_88', 'marce88@gmail.com', '19881219', 'Marcelo Olivera', 'mar258*#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Agus5555', 'agus55@gmail.com', '19930528', 'Agustina Ramos', 'agu963@!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Leo33333', 'leo33@gmail.com', '19970409', 'Leonardo Vera', 'leo123#/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Flopi321', 'florpi@gmail.com', '19990907', 'Florencia Mendez', 'flo963*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Mati9000', 'mati90@gmail.com', '19951126', 'Matias Lopez', 'mat852$#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Naza0001', 'naza01@gmail.com', '20010814', 'Nazareno Techera', 'naz741@*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Barby000', 'barby@gmail.com', '19981203', 'Barbara Lopez', 'bar369$@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Ivan1992', 'ivan92@gmail.com', '19920218', 'Ivan Torres', 'iva654!@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('JulioM88', 'julim@gmail.com', '19940923', 'Julieta Martinez', 'jul741&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Cami7777', 'cami77@gmail.com', '19960606', 'Camila Suarez', 'cam963#@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Pablo333', 'pablo33@gmail.com', '19970501', 'Pablo Herrera', 'pab852*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Daniel01', 'danae@gmail.com', '19930303', 'Daniel Gonzalez', 'dan456&$')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Nahuelz7', 'nahuel@gmail.com', '19990129', 'Nahuel Zunino', 'nah321@#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Belenita', 'belenita@gmail.com', '19981017', 'Belan Franco', 'bel654*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('German55', 'german55@gmail.com', '19961225', 'German Medina', 'ger789$&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Antonela', 'antonela@gmail.com', '19940704', 'Antonela Vazquez', 'ant741!#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Franco22', 'franco22@gmail.com', '19950613', 'Franco Godoy', 'fra963@*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Yesi0101', 'yesi@gmail.com', '19930424', 'Yesica Cabrera', 'yes321$&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Kevin222', 'kevin22@gmail.com', '19970820', 'Kevin Pereira', 'kev741#/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Fiorella', 'fiorella@gmail.com', '19980515', 'Fiorella Diaz', 'fio258@!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Thiago89', 'thiago89@gmail.com', '19961118', 'Thiago Moreira', 'thi963&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Andrea90', 'andrea90@gmail.com', '19900919', 'Andrea Rivas', 'and147$#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Ezequiel', 'ezequiel@gmail.com', '19940202', 'Ezequiel Soto', 'eze888&@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Anahi001', 'anahi@gmail.com', '19921201', 'Anahi González', 'ana123*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Maxi_001', 'maxi@gmail.com', '19950707', 'Maximiliano Diaz', 'max789$&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Malena32', 'malena@gmail.com', '19980105', 'Malena Castro', 'mal963@!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Bruno111', 'bruno@gmail.com', '19971010', 'Bruno Gonzalez', 'bru321#*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Aldana77', 'aldana@gmail.com', '19960312', 'Aldana López', 'ald654&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Julian22', 'julian22@gmail.com', '19950808', 'Julian Rodriguez', 'jul951!@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Claudia8', 'claudia@gmail.com', '19910430', 'Claudia Sanchez', 'cla852*#')														
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Ramiro33', 'ramiro33@gmail.com', '19990621', 'Ramiro Medina', 'ram963$/')	
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('LuciaL88', 'lucial@gmail.com', '19940915', 'Lucia Lopez', 'luc789@*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Seba_199', 'seba199@gmail.com', '19931009', 'Sebastian Suarez', 'seb741$!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Lucas2001', 'lucas2001@gmail.com', '19931009', 'Lucas Vilardo', 'luc123?¿')





----------------- MENSAJES PRIVADOS	(30)---------------------------------											
												
insert Mensaje(Asunto, Texto, NomUsuario) values('Reunión urgente', 'Tenemos que hablar cuanto antes.', 'Laura1998')
insert Mensaje(Asunto, Texto, NomUsuario) values('Cambio de horario', 'El horario del encuentro fue modificado.', 'Tomasito1')
insert Mensaje(Asunto, Texto, NomUsuario) values('Documentos pendientes', 'No olvides enviar los documentos.', 'Valen2000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Fiesta sorpresa', 'Es una fiesta sorpresa, no digas nada.', 'Luciano33')
insert Mensaje(Asunto, Texto, NomUsuario) values('Consulta médica', 'Necesito agendar una consulta para mañana.', 'MartinaA1')
insert Mensaje(Asunto, Texto, NomUsuario) values('Entrega final', 'La entrega está prevista para el viernes.', 'EmaRodri9')
insert Mensaje(Asunto, Texto, NomUsuario) values('Nos vemos hoy', '¿Confirmamos para esta tarde?', 'Meli_1999')
insert Mensaje(Asunto, Texto, NomUsuario) values('Reunión de equipo', 'Debemos coordinar reunión con todo el equipo.', 'Santi9999')
insert Mensaje(Asunto, Texto, NomUsuario) values('Vacaciones', 'Ya tengo todo listo para las vacaciones.', 'Luana5678')
insert Mensaje(Asunto, Texto, NomUsuario) values('Nuevo proyecto', 'Quiero hablarte de una nuevo proyecto.', 'Gonza2023')
insert Mensaje(Asunto, Texto, NomUsuario) values('Ayuda urgente', 'Necesito tu ayuda con un trabajo.', 'Carla2022')
insert Mensaje(Asunto, Texto, NomUsuario) values('Lista de compras', 'Te paso la lista para mañana.', 'Nico_1987')
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea compartida', 'Te asignaron la misma parte que a mí.', 'Romi0000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Reclamo pendiente', 'Todavía no me respondieron el reclamo.', 'Fede_1234')
insert Mensaje(Asunto, Texto, NomUsuario) values('Reunión cancelada', 'Se suspendió la reunión de hoy.', 'Sofi1994')
insert Mensaje(Asunto, Texto, NomUsuario) values('Presupuesto aprobado', 'Confirmaron el presupuesto enviado.', 'Marce_88')
insert Mensaje(Asunto, Texto, NomUsuario) values('Sorpresa', 'Te tengo una sorpresa para el sábado.', 'Agus5555')
insert Mensaje(Asunto, Texto, NomUsuario) values('Informe final', 'Ya terminé el informe, revisalo.', 'Leo33333')
insert Mensaje(Asunto, Texto, NomUsuario) values('Dudas sobre la clase', 'No entendí el último tema.', 'Flopi321')
insert Mensaje(Asunto, Texto, NomUsuario) values('Viaje confirmado', 'Tenemos pasajes para el 10.', 'Mati9000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Recordatorio', 'No olvides la reunión de mañana.', 'Naza0001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Entrega postergada', 'La fecha de entrega cambió.', 'Barby000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Invitación', 'Estás invitado a la reunión anual.', 'Ivan1992')
insert Mensaje(Asunto, Texto, NomUsuario) values('Cumpleaños', 'Te esperamos para festejar el viernes.', 'JulioM88')
insert Mensaje(Asunto, Texto, NomUsuario) values('Material de estudio', 'Ya subieron los apuntes al sistema.', 'Cami7777')
insert Mensaje(Asunto, Texto, NomUsuario) values('Compra online', 'El paquete llegó esta mañana.', 'Pablo333')
insert Mensaje(Asunto, Texto, NomUsuario) values('Actividad extracurricular', '¿Te anotaste a la actividad?', 'Daniel01')
insert Mensaje(Asunto, Texto, NomUsuario) values('Nuevo número', 'Cambié el número, anotá el nuevo.', 'Nahuelz7')
insert Mensaje(Asunto, Texto, NomUsuario) values('Organización del evento', 'Necesito ayuda para organizar.', 'Belenita')
insert Mensaje(Asunto, Texto, NomUsuario) values('Inscripción confirmada', 'Quedaste anotado correctamente.', 'German55')

------------------------ MENSAJE RECORDATORIO (30)--------------------------------

insert Mensaje(Asunto, Texto, NomUsuario) values('Aprobación pendiente', 'Falta una firma para aprobarlo.', 'Antonela')
insert Mensaje(Asunto, Texto, NomUsuario) values('Pedido realizado', 'El pedido fue enviado hoy.', 'Franco22')
insert Mensaje(Asunto, Texto, NomUsuario) values('Turno médico', 'Te agendé para el lunes a las 10.', 'Yesi0101')
insert Mensaje(Asunto, Texto, NomUsuario) values('Capacitación', 'Hay una capacitación el jueves.', 'Seba_199')			   
insert Mensaje(Asunto, Texto, NomUsuario) values('Devolución', 'El producto no funcionó como esperaba.', 'LuciaL88')		 
insert Mensaje(Asunto, Texto, NomUsuario) values('Invitación evento', 'Tenés tu entrada confirmada.', 'Ramiro33')			   
insert Mensaje(Asunto, Texto, NomUsuario) values('Reserva hecha', 'La reserva del lugar está hecha.', 'Claudia8')				
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea para mañana', 'Mandaron tarea de lectura.', 'Julian22')				
insert Mensaje(Asunto, Texto, NomUsuario) values('Resultado examen', 'Ya están las notas del parcial.', 'Aldana77')				
insert Mensaje(Asunto, Texto, NomUsuario) values('Cambio de tema', 'El trabajo es sobre otro tema.', 'Bruno111')				
insert Mensaje(Asunto, Texto, NomUsuario) values('Actualización del sistema', 'Se actualiza mañana a las 22:00.', 'Malena32')	  
insert Mensaje(Asunto, Texto, NomUsuario) values('Problema técnico', 'Se cayó la red otra vez.', 'Maxi_001')					   
insert Mensaje(Asunto, Texto, NomUsuario) values('Recordatorio médico', 'Te toca análisis este viernes.', 'Anahi001')			   
insert Mensaje(Asunto, Texto, NomUsuario) values('Claves de acceso', 'Te paso las claves por privado.', 'Ezequiel')			
insert Mensaje(Asunto, Texto, NomUsuario) values('Formulario faltante', 'Falta enviar el formulario.', 'Andrea90')					
insert Mensaje(Asunto, Texto, NomUsuario) values('Borrador listo', 'Tengo el borrador del proyecto.', 'Thiago89')					
insert Mensaje(Asunto, Texto, NomUsuario) values('Clase suspendida', 'No hay clase este jueves.', 'Fiorella')						
insert Mensaje(Asunto, Texto, NomUsuario) values('Falta corregir', 'Hay errores en la sección 3.', 'Kevin222')						 
insert Mensaje(Asunto, Texto, NomUsuario) values('Redacción final', 'Revisé la redacción completa.', 'Juancito11')
insert Mensaje(Asunto, Texto, NomUsuario) values('Cumpleaños finde', 'El sábado voy a festejar mi cumpleaños.', 'Roberto123')
insert Mensaje(Asunto, Texto, NomUsuario) values('Video demostrativo', 'Gracias por ver el video demostrativo.', 'Juancito11')
insert Mensaje(Asunto, Texto, NomUsuario) values('Deberes escolares', 'Debemos entregar los deberes la proxima semana.', 'Roberto123')
insert Mensaje(Asunto, Texto, NomUsuario) values('Partido el sabado','El sabado tendremos un partido a las 9 de la noche.','Laura1998')
insert Mensaje(Asunto, Texto, NomUsuario) values('Cancelamos actividad','La actividad del martes queda suspendida, gracias.','Tomasito1')
insert Mensaje(Asunto, Texto, NomUsuario) values('No hay cupos','Buenas, no tenemos mas cupos disponibles para el evento de mañana.','Valen2000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Ofertas','Tenemos electrodomesticos a 40% de descuento.','Luciano33')
insert Mensaje(Asunto, Texto, NomUsuario) values('Festival de lectura','El miercoles tendremos un festival de lectura a las 12:00.','MartinaA1')
insert Mensaje(Asunto, Texto, NomUsuario) values('Panaderia Panes','Buenas, hay stock de bizcochos para el domingo?','EmaRodri9')
insert Mensaje(Asunto, Texto, NomUsuario) values('Nuevo producto','Queremos anunciar la llegada de un nuevo producto','Meli_1999')
insert Mensaje(Asunto, Texto, NomUsuario) values('Fin de ciclo','El domingo será el fin del ciclo productivo.','Santi9999')

--------- MENSAJES COMUNES (100)-----------

insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea pendiente', 'Esto es confidencial.', 'Tomasito1')
insert Mensaje(Asunto, Texto, NomUsuario) values('Reunión importante', 'No olvides completar el formulario.', 'Naza0001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Nuevo desafío', 'Confirmá si te sirve ese horario.', 'Nahuelz7')
insert Mensaje(Asunto, Texto, NomUsuario) values('Sugerencia del día', 'Revisá el documento adjunto.', 'Kevin222')
insert Mensaje(Asunto, Texto, NomUsuario) values('Informe semanal', 'Acordate de enviar el reporte.', 'Anahi001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Consulta rápida', 'Gracias por tu ayuda.', 'Claudia8')
insert Mensaje(Asunto, Texto, NomUsuario) values('Evento confirmado', 'Podemos reunirnos mañana.', 'Ramiro33')
insert Mensaje(Asunto, Texto, NomUsuario) values('Actualización urgente', 'Revisá el sistema hoy.', 'Romi0000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea nueva asignada', 'Leé el mensaje anterior.', 'Luana5678')
insert Mensaje(Asunto, Texto, NomUsuario) values('Pendiente de revisión', 'Esperamos tus comentarios.', 'Nico_1987')
insert Mensaje(Asunto, Texto, NomUsuario) values('Recordatorio de reunión', 'No te olvides del evento.', 'Santi9999')
insert Mensaje(Asunto, Texto, NomUsuario) values('Informe técnico', 'Revisá los cambios implementados.', 'Luana5678')
insert Mensaje(Asunto, Texto, NomUsuario) values('Invitación formal', 'Estás invitado al evento anual.', 'Valen2000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Revisión de código', 'El código ya está en GitHub.', 'Roberto123')
insert Mensaje(Asunto, Texto, NomUsuario) values('Reunión interna', 'Hablamos en sala 2 a las 14hs.', 'Maxi_001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea prioritaria', 'Este ítem debe estar hoy.', 'Seba_199')
insert Mensaje(Asunto, Texto, NomUsuario) values('Presentación final', 'Subí la versión corregida.', 'Ramiro33')
insert Mensaje(Asunto, Texto, NomUsuario) values('Pendiente de enviar', 'Falta agregar el adjunto.', 'JulioM88')
insert Mensaje(Asunto, Texto, NomUsuario) values('Resultado del test', 'Felicitaciones, aprobado.', 'Leo33333')
insert Mensaje(Asunto, Texto, NomUsuario) values('Corrección requerida', 'Hay errores en el documento.', 'Marce_88')
insert Mensaje(Asunto, Texto, NomUsuario) values('Notificación del sistema', 'Actualización completada.', 'Nico_1987')
insert Mensaje(Asunto, Texto, NomUsuario) values('Cambios en el cronograma', 'Nueva fecha: 5 de agosto.', 'Aldana77')
insert Mensaje(Asunto, Texto, NomUsuario) values('Recordatorio urgente', 'No se recibió respuesta aún.', 'Claudia8')
insert Mensaje(Asunto, Texto, NomUsuario) values('Resumen del día', 'Gran trabajo hoy equipo.', 'Ramiro33')
insert Mensaje(Asunto, Texto, NomUsuario) values('Agenda compartida', 'Se adjunta el PDF.', 'Barby000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Análisis completo', 'Todo está documentado.', 'Anahi001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Solicitud de soporte', 'El sistema no arranca.', 'German55')
insert Mensaje(Asunto, Texto, NomUsuario) values('Revisión contable', 'Faltan archivos en la carpeta.', 'Barby000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Entrega pendiente', '¿Se puede extender el plazo?', 'Marce_88')
insert Mensaje(Asunto, Texto, NomUsuario) values('Validación de datos', 'Verificá la columna D.', 'Santi9999')
insert Mensaje(Asunto, Texto, NomUsuario) values('Invitación a evento', 'Confirmá tu asistencia.', 'Flopi321')
insert Mensaje(Asunto, Texto, NomUsuario) values('Error detectado', 'Ya se notificó al equipo.', 'Nahuelz7')
insert Mensaje(Asunto, Texto, NomUsuario) values('Avance del proyecto', 'Faltan 3 tareas por cerrar.', 'Daniel01')
insert Mensaje(Asunto, Texto, NomUsuario) values('Modificación del diseño', 'Nuevo mockup adjunto.', 'Thiago89')
insert Mensaje(Asunto, Texto, NomUsuario) values('Mensaje de bienvenida', 'Gracias por sumarte.', 'Andrea90')
insert Mensaje(Asunto, Texto, NomUsuario) values('Nuevo documento', 'Revisalo antes del viernes.', 'Sofi1994')
insert Mensaje(Asunto, Texto, NomUsuario) values('Pendiente de validación', 'Aguardamos tu respuesta.', 'Santi9999')
insert Mensaje(Asunto, Texto, NomUsuario) values('Próxima reunión', 'Lunes a las 9hs.', 'EmaRodri9')
insert Mensaje(Asunto, Texto, NomUsuario) values('Informe de resultados', 'Todo está dentro del rango.', 'Kevin222')
insert Mensaje(Asunto, Texto, NomUsuario) values('Capacitación interna', 'Traer notebook cargada.', 'Andrea90')
insert Mensaje(Asunto, Texto, NomUsuario) values('Feedback recibido', 'Muy buen desempeño.', 'Anahi001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Próxima tarea', 'Automatizar carga de datos.', 'Claudia8')
insert Mensaje(Asunto, Texto, NomUsuario) values('Mail reenviado', 'Verificá el hilo anterior.', 'Antonela')
insert Mensaje(Asunto, Texto, NomUsuario) values('Actualización de agenda', 'Reunión pospuesta a jueves.', 'Seba_199')
insert Mensaje(Asunto, Texto, NomUsuario) values('Cambios de último momento', 'Ver punto 3 del mail anterior.', 'Anahi001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea duplicada', 'Se eliminó una versión.', 'Sofi1994')
insert Mensaje(Asunto, Texto, NomUsuario) values('Validación positiva', 'Todo en orden.', 'Fede_1234')
insert Mensaje(Asunto, Texto, NomUsuario) values('Llamado pendiente', 'Intentamos contactarte.', 'Romi0000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Planificación semanal', 'Armá el cronograma.', 'Nico_1987')
insert Mensaje(Asunto, Texto, NomUsuario) values('Modificación urgente', 'Se cambió la fecha límite.', 'Franco22')
insert Mensaje(Asunto, Texto, NomUsuario) values('Error subsanado', 'Ya se resolvió.', 'Thiago89')
insert Mensaje(Asunto, Texto, NomUsuario) values('Prueba finalizada', 'Esperando revisión.', 'German55')
insert Mensaje(Asunto, Texto, NomUsuario) values('Inscripción abierta', 'Cierra el viernes.', 'Leo33333')
insert Mensaje(Asunto, Texto, NomUsuario) values('Documento actualizado', 'Ver revisiones en la última hoja.', 'Marce_88')
insert Mensaje(Asunto, Texto, NomUsuario) values('Presentación subida', 'Ya está en la nube.', 'Belenita')
insert Mensaje(Asunto, Texto, NomUsuario) values('Lista de tareas', 'Asignadas por prioridad.', 'Antonela')
insert Mensaje(Asunto, Texto, NomUsuario) values('Resultado parcial', 'Aprobado con observaciones.', 'Fiorella')
insert Mensaje(Asunto, Texto, NomUsuario) values('Borrador inicial', 'Para revisar en grupo.', 'Aldana77')
insert Mensaje(Asunto, Texto, NomUsuario) values('Cambio de horario', 'Ahora es a las 15hs.', 'Ramiro33')
insert Mensaje(Asunto, Texto, NomUsuario) values('Versión final', 'Marcada como entregada.', 'Juancito11')
insert Mensaje(Asunto, Texto, NomUsuario) values('Error crítico', 'Se requiere intervención.', 'Roberto123')
insert Mensaje(Asunto, Texto, NomUsuario) values('Confirmación recibida', 'Gracias por responder.', 'Nico_1987')
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea nueva', 'Requiere testing.', 'Flopi321')
insert Mensaje(Asunto, Texto, NomUsuario) values('Pendiente de firma', 'Aguardando aprobación.', 'Naza0001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Registro de asistencia', 'Completado correctamente.', 'Mati9000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Aprobación en curso', 'Faltan dos firmas.', 'German55')
insert Mensaje(Asunto, Texto, NomUsuario) values('Archivo dañado', 'No se puede abrir.', 'Franco22')
insert Mensaje(Asunto, Texto, NomUsuario) values('Reporte mensual', 'Se entregará mañana.', 'Yesi0101')
insert Mensaje(Asunto, Texto, NomUsuario) values('Nuevo acceso', 'Ya podés ingresar al sistema.', 'Maxi_001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Evento cancelado', 'Motivos técnicos.', 'Malena32')
insert Mensaje(Asunto, Texto, NomUsuario) values('Solicitud enviada', 'Confirmar recepción.', 'Bruno111')
insert Mensaje(Asunto, Texto, NomUsuario) values('Mensaje automático', 'No responder a este correo.', 'Carla2022')
insert Mensaje(Asunto, Texto, NomUsuario) values('Entrega finalizada', 'Buen trabajo.', 'Ezequiel')
insert Mensaje(Asunto, Texto, NomUsuario) values('Agenda mensual', 'Enviada al grupo.', 'Andrea90')
insert Mensaje(Asunto, Texto, NomUsuario) values('Pendiente de análisis', 'Ver archivo adjunto.', 'Antonela')
insert Mensaje(Asunto, Texto, NomUsuario) values('Recordatorio general', 'Hoy es la fecha límite.', 'Naza0001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Reunión reprogramada', 'Nuevo día: martes.', 'Nahuelz7')
insert Mensaje(Asunto, Texto, NomUsuario) values('Backup realizado', 'Almacenado en servidor X.', 'Leo33333')
insert Mensaje(Asunto, Texto, NomUsuario) values('Resolución del problema', 'Revisá la bitácora.', 'Gonza2023')
insert Mensaje(Asunto, Texto, NomUsuario) values('Actualización automática', 'No requiere acción.', 'Romi0000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Confirmación de tarea', 'Se asignó correctamente.', 'Nico_1987')
insert Mensaje(Asunto, Texto, NomUsuario) values('Desvinculación de cuenta', 'Se completó el proceso.', 'MartinaA1')
insert Mensaje(Asunto, Texto, NomUsuario) values('Invitación interna', 'Confirmá antes del viernes.', 'Valen2000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Errores en el script', 'Revisá la línea 34.', 'Flopi321')
insert Mensaje(Asunto, Texto, NomUsuario) values('Estado actualizado', 'Todo en verde.', 'Maxi_001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Consulta técnica', '¿Qué versión estás usando?', 'Malena32')
insert Mensaje(Asunto, Texto, NomUsuario) values('Redacción corregida', 'Adjunto el nuevo borrador.', 'Aldana77')
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea extendida', 'Nueva fecha: lunes.', 'Julian22')
insert Mensaje(Asunto, Texto, NomUsuario) values('Usuario bloqueado', 'Solicitar reactivación.', 'Claudia8')
insert Mensaje(Asunto, Texto, NomUsuario) values('Satisfacción del cliente', 'Feedback positivo.', 'Ramiro33')
insert Mensaje(Asunto, Texto, NomUsuario) values('Implementación final', 'Desplegada en producción.', 'LuciaL88')
insert Mensaje(Asunto, Texto, NomUsuario) values('Pruebas completadas', 'Todo correcto.', 'Barby000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Documento duplicado', 'Eliminar uno.', 'Flopi321')
insert Mensaje(Asunto, Texto, NomUsuario) values('Checklist completo', 'Bien hecho.', 'Agus5555')
insert Mensaje(Asunto, Texto, NomUsuario) values('Anuncio interno', 'Ver comunicado oficial.', 'Carla2022')
insert Mensaje(Asunto, Texto, NomUsuario) values('Tarea finalizada', 'Marcada como completada.', 'Meli_1999')
insert Mensaje(Asunto, Texto, NomUsuario) values('Solicitud de ayuda', '¿Podés revisar el error?', 'Romi0000')
insert Mensaje(Asunto, Texto, NomUsuario) values('Actualización menor', 'Versión 1.0.3 subida.', 'Thiago89')
insert Mensaje(Asunto, Texto, NomUsuario) values('Próxima entrega', 'Miércoles a las 10hs.', 'Anahi001')
insert Mensaje(Asunto, Texto, NomUsuario) values('Sugerencia enviada', 'Revisá el formulario.', 'Aldana77')

------------------  MENSAJES PRIVADOS  --------------------------

insert Privado(NumIdenti, FechaCaducidad) values(1, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(2, '20250831')
insert Privado(NumIdenti, FechaCaducidad) values(3, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(4, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(5, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(6, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(7, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(8, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(9, '20251030')
insert Privado(NumIdenti, FechaCaducidad) values(10, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(11, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(12, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(13, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(14, '20251030')
insert Privado(NumIdenti, FechaCaducidad) values(15, '20251030')
insert Privado(NumIdenti, FechaCaducidad) values(16, '20251130')
insert Privado(NumIdenti, FechaCaducidad) values(17, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(18, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(19, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(20, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(21, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(22, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(23, '20251230')
insert Privado(NumIdenti, FechaCaducidad) values(24, '20251130')
insert Privado(NumIdenti, FechaCaducidad) values(25, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(26, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(27, '20250930')
insert Privado(NumIdenti, FechaCaducidad) values(28, '20250830')
insert Privado(NumIdenti, FechaCaducidad) values(29, '20251130')
insert Privado(NumIdenti, FechaCaducidad) values(30, '20251230')

------------------ MENSAJES RECORDATORIO  ---------------------------

insert Recordatorio(NumIdenti, TipoRecordatorio) values(31, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(32, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(33, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(34, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(35, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(36, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(37, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(38, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(39, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(40, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(41, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(42, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(43, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(44, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(45, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(46, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(47, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(48, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(49, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(50, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(51, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(52, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(53, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(54, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(55, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(56, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(57, 'Laboral')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(58, 'Estudio')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(59, 'Personal')
insert Recordatorio(NumIdenti, TipoRecordatorio) values(60, 'Laboral')
																		
-----------  CATEGORIAS  -------------------------						 

insert Categoria(CodCat, NomCat) values('INF', 'Informativo')
insert Categoria(CodCat, NomCat) values('URG', 'Urgente')
insert Categoria(CodCat, NomCat) values('EDU', 'Educativo')
insert Categoria(CodCat, NomCat) values('ENT', 'Entretenimiento')
insert Categoria(CodCat, NomCat) values('PUB', 'Publicitario')
insert Categoria(CodCat, NomCat) values('SAL', 'Salud')
insert Categoria(CodCat, NomCat) values('DEP', 'Deportes')
insert Categoria(CodCat, NomCat) values('FIN', 'Finanzas')
insert Categoria(CodCat, NomCat) values('TEC', 'Tecnología')
insert Categoria(CodCat, NomCat) values('OTR', 'Otros')

------------ MENSAJES COMUNES ----------------------------

insert Comun(Numidenti, CodCat) values(61 , 'INF')
insert Comun(Numidenti, CodCat) values(62 , 'URG')
insert Comun(Numidenti, CodCat) values(63 , 'URG')
insert Comun(Numidenti, CodCat) values(64 , 'INF')
insert Comun(Numidenti, CodCat) values(65 , 'OTR')
insert Comun(Numidenti, CodCat) values(66 , 'TEC')
insert Comun(Numidenti, CodCat) values(67 , 'DEP')
insert Comun(Numidenti, CodCat) values(68 , 'SAL')
insert Comun(Numidenti, CodCat) values(69 , 'SAL')
insert Comun(Numidenti, CodCat) values(70 , 'OTR')
insert Comun(Numidenti, CodCat) values(71 , 'ENT')
insert Comun(Numidenti, CodCat) values(72 , 'EDU')
insert Comun(Numidenti, CodCat) values(73 , 'URG')
insert Comun(Numidenti, CodCat) values(74 , 'INF')
insert Comun(Numidenti, CodCat) values(75 , 'OTR')
insert Comun(Numidenti, CodCat) values(76 , 'TEC')
insert Comun(Numidenti, CodCat) values(77 , 'FIN')
insert Comun(Numidenti, CodCat) values(78 , 'DEP')
insert Comun(Numidenti, CodCat) values(79 , 'SAL')
insert Comun(Numidenti, CodCat) values(80 , 'OTR')
insert Comun(Numidenti, CodCat) values(81 , 'INF')
insert Comun(Numidenti, CodCat) values(82 , 'URG')
insert Comun(Numidenti, CodCat) values(83 , 'EDU')
insert Comun(Numidenti, CodCat) values(84 , 'ENT')
insert Comun(Numidenti, CodCat) values(85 , 'FIN')
insert Comun(Numidenti, CodCat) values(86 , 'TEC')
insert Comun(Numidenti, CodCat) values(87 , 'FIN')
insert Comun(Numidenti, CodCat) values(88 , 'OTR')
insert Comun(Numidenti, CodCat) values(89 , 'SAL')
insert Comun(Numidenti, CodCat) values(90 , 'PUB')
insert Comun(Numidenti, CodCat) values(91 , 'TEC')
insert Comun(Numidenti, CodCat) values(92 , 'FIN')
insert Comun(Numidenti, CodCat) values(93 , 'TEC')
insert Comun(Numidenti, CodCat) values(94 , 'URG')
insert Comun(Numidenti, CodCat) values(95 , 'EDU')
insert Comun(Numidenti, CodCat) values(96 , 'PUB')
insert Comun(Numidenti, CodCat) values(97 , 'SAL')
insert Comun(Numidenti, CodCat) values(98 , 'INF')
insert Comun(Numidenti, CodCat) values(99 , 'URG')
insert Comun(Numidenti, CodCat) values(100 , 'ENT')
insert Comun(Numidenti, CodCat) values(101 , 'OTR')
insert Comun(Numidenti, CodCat) values(102 , 'TEC')
insert Comun(Numidenti, CodCat) values(103 , 'DEP')
insert Comun(Numidenti, CodCat) values(104 , 'FIN')
insert Comun(Numidenti, CodCat) values(105 , 'SAL')
insert Comun(Numidenti, CodCat) values(106 , 'PUB')
insert Comun(Numidenti, CodCat) values(107 , 'ENT')
insert Comun(Numidenti, CodCat) values(108 , 'PUB')
insert Comun(Numidenti, CodCat) values(109 , 'URG')
insert Comun(Numidenti, CodCat) values(110 , 'ENT')
insert Comun(Numidenti, CodCat) values(111 , 'ENT')
insert Comun(Numidenti, CodCat) values(112 , 'PUB')
insert Comun(Numidenti, CodCat) values(113 , 'INF')
insert Comun(Numidenti, CodCat) values(114 , 'SAL')
insert Comun(Numidenti, CodCat) values(115 , 'INF')
insert Comun(Numidenti, CodCat) values(116 , 'OTR')
insert Comun(Numidenti, CodCat) values(117 , 'TEC')
insert Comun(Numidenti, CodCat) values(118 , 'FIN')
insert Comun(Numidenti, CodCat) values(119 , 'DEP')
insert Comun(Numidenti, CodCat) values(120 , 'TEC')
insert Comun(Numidenti, CodCat) values(121 , 'FIN')
insert Comun(Numidenti, CodCat) values(122 , 'PUB')
insert Comun(Numidenti, CodCat) values(123 , 'SAL')
insert Comun(Numidenti, CodCat) values(124 , 'EDU')
insert Comun(Numidenti, CodCat) values(125 , 'ENT')
insert Comun(Numidenti, CodCat) values(126 , 'INF')
insert Comun(Numidenti, CodCat) values(127 , 'URG')
insert Comun(Numidenti, CodCat) values(128 , 'TEC')
insert Comun(Numidenti, CodCat) values(129 , 'FIN')
insert Comun(Numidenti, CodCat) values(130 , 'DEP')
insert Comun(Numidenti, CodCat) values(131 , 'FIN')
insert Comun(Numidenti, CodCat) values(132 , 'TEC')
insert Comun(Numidenti, CodCat) values(133 , 'ENT')
insert Comun(Numidenti, CodCat) values(134 , 'PUB')
insert Comun(Numidenti, CodCat) values(135 , 'SAL')
insert Comun(Numidenti, CodCat) values(136 , 'ENT')
insert Comun(Numidenti, CodCat) values(137 , 'PUB')
insert Comun(Numidenti, CodCat) values(138 , 'URG')
insert Comun(Numidenti, CodCat) values(139 , 'INF')
insert Comun(Numidenti, CodCat) values(140 , 'FIN')
insert Comun(Numidenti, CodCat) values(141 , 'DEP')
insert Comun(Numidenti, CodCat) values(142 , 'PUB')
insert Comun(Numidenti, CodCat) values(143 , 'ENT')
insert Comun(Numidenti, CodCat) values(144 , 'EDU')
insert Comun(Numidenti, CodCat) values(145 , 'URG')
insert Comun(Numidenti, CodCat) values(146 , 'INF')
insert Comun(Numidenti, CodCat) values(147 , 'TEC')
insert Comun(Numidenti, CodCat) values(148 , 'OTR')
insert Comun(Numidenti, CodCat) values(149 , 'TEC')
insert Comun(Numidenti, CodCat) values(150 , 'FIN')
insert Comun(Numidenti, CodCat) values(151 , 'ENT')
insert Comun(Numidenti, CodCat) values(152 , 'PUB')
insert Comun(Numidenti, CodCat) values(153 , 'ENT')
insert Comun(Numidenti, CodCat) values(154 , 'EDU')
insert Comun(Numidenti, CodCat) values(155 , 'URG')
insert Comun(Numidenti, CodCat) values(156 , 'OTR')
insert Comun(Numidenti, CodCat) values(157 , 'INF')
insert Comun(Numidenti, CodCat) values(158 , 'INF')
insert Comun(Numidenti, CodCat) values(159 , 'PUB')
insert Comun(Numidenti, CodCat) values(160 , 'ENT')


----------- TABLA DE RECIBEN -----------------------

insert Recibe(NumIdenti, NomUsuario) values(1, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(2, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(3, 'Luciano33')
insert Recibe(NumIdenti, NomUsuario) values(4, 'Marce_88')
insert Recibe(NumIdenti, NomUsuario) values(5, 'Barby000')
insert Recibe(NumIdenti, NomUsuario) values(6, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(7, 'Pablo333')
insert Recibe(NumIdenti, NomUsuario) values(8, 'Seba_199')
insert Recibe(NumIdenti, NomUsuario) values(9, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(10, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(11, 'Roberto123')
insert Recibe(NumIdenti, NomUsuario) values(12, 'Antonela')
insert Recibe(NumIdenti, NomUsuario) values(13, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(14, 'Barby000')
insert Recibe(NumIdenti, NomUsuario) values(15, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(16, 'Agus5555')
insert Recibe(NumIdenti, NomUsuario) values(17, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(18, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(19, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(20, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(21, 'Leo33333')
insert Recibe(NumIdenti, NomUsuario) values(22, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(23, 'Flopi321')
insert Recibe(NumIdenti, NomUsuario) values(24, 'Fiorella')
insert Recibe(NumIdenti, NomUsuario) values(25, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(26, 'Daniel01')
insert Recibe(NumIdenti, NomUsuario) values(27, 'Belenita')
insert Recibe(NumIdenti, NomUsuario) values(28, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(29, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(30, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(31, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(32, 'Luciano33')
insert Recibe(NumIdenti, NomUsuario) values(33, 'Mati9000')
insert Recibe(NumIdenti, NomUsuario) values(34, 'Romi0000')
insert Recibe(NumIdenti, NomUsuario) values(35, 'Leo33333')
insert Recibe(NumIdenti, NomUsuario) values(36, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(37, 'Andrea90')
insert Recibe(NumIdenti, NomUsuario) values(38, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(39, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(40, 'Gonza2023')
insert Recibe(NumIdenti, NomUsuario) values(41, 'Luana5678')
insert Recibe(NumIdenti, NomUsuario) values(42, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(43, 'Meli_1999')
insert Recibe(NumIdenti, NomUsuario) values(44, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(45, 'MartinaA1')
insert Recibe(NumIdenti, NomUsuario) values(46, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(47, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(48, 'EmaRodri9')
insert Recibe(NumIdenti, NomUsuario) values(49, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(50, 'Meli_1999')
insert Recibe(NumIdenti, NomUsuario) values(51, 'Maxi_001')
insert Recibe(NumIdenti, NomUsuario) values(52, 'Naza0001')
insert Recibe(NumIdenti, NomUsuario) values(53, 'Nico_1987')
insert Recibe(NumIdenti, NomUsuario) values(54, 'Ramiro33')
insert Recibe(NumIdenti, NomUsuario) values(55, 'Seba_199')
insert Recibe(NumIdenti, NomUsuario) values(56, 'Sofi1994')
insert Recibe(NumIdenti, NomUsuario) values(57, 'Thiago89')
insert Recibe(NumIdenti, NomUsuario) values(58, 'Nahuelz7')
insert Recibe(NumIdenti, NomUsuario) values(59, 'Claudia8')
insert Recibe(NumIdenti, NomUsuario) values(60, 'German55')
insert Recibe(NumIdenti, NomUsuario) values(61, 'Luciano33')
insert Recibe(NumIdenti, NomUsuario) values(62, 'Gonza2023')
insert Recibe(NumIdenti, NomUsuario) values(63, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(64, 'EmaRodri9')
insert Recibe(NumIdenti, NomUsuario) values(65, 'Anahi001')
insert Recibe(NumIdenti, NomUsuario) values(66, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(67, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(68, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(69, 'Ivan1992')
insert Recibe(NumIdenti, NomUsuario) values(70, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(71, 'MartinaA1')
insert Recibe(NumIdenti, NomUsuario) values(72, 'Mati9000')
insert Recibe(NumIdenti, NomUsuario) values(73, 'Nico_1987')
insert Recibe(NumIdenti, NomUsuario) values(74, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(75, 'Thiago89')
insert Recibe(NumIdenti, NomUsuario) values(76, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(77, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(78, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(79, 'Belenita')
insert Recibe(NumIdenti, NomUsuario) values(80, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(81, 'Barby000')
insert Recibe(NumIdenti, NomUsuario) values(82, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(83, 'Agus5555')
insert Recibe(NumIdenti, NomUsuario) values(84, 'Andrea90')
insert Recibe(NumIdenti, NomUsuario) values(85, 'Fede_1234')
insert Recibe(NumIdenti, NomUsuario) values(86, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(87, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(88, 'MartinaA1')
insert Recibe(NumIdenti, NomUsuario) values(89, 'Meli_1999')
insert Recibe(NumIdenti, NomUsuario) values(90, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(91, 'Sofi1994')
insert Recibe(NumIdenti, NomUsuario) values(92, 'Roberto123')
insert Recibe(NumIdenti, NomUsuario) values(93, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(94, 'LuciaL88')
insert Recibe(NumIdenti, NomUsuario) values(95, 'Maxi_001')
insert Recibe(NumIdenti, NomUsuario) values(96, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(97, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(98, 'EmaRodri9')
insert Recibe(NumIdenti, NomUsuario) values(99, 'Belenita')
insert Recibe(NumIdenti, NomUsuario) values(100, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(101, 'Fede_1234'),
										   (101, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(102, 'LuciaL88'),
										   (102, 'Pablo333')
insert Recibe(NumIdenti, NomUsuario) values(103, 'Julian22'),
										   (103, 'Gonza2023')
insert Recibe(NumIdenti, NomUsuario) values(104, 'MartinaA1'),
										   (104, 'Fede_1234')
insert Recibe(NumIdenti, NomUsuario) values(105, 'Belenita'),
										   (105, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(106, 'Anahi001'),
										   (106, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(107, 'Barby000'),
										   (107, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(108, 'Belenita'),
										   (108, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(109, 'Agus5555'),
										   (109, 'Ramiro33')
insert Recibe(NumIdenti, NomUsuario) values(110, 'Aldana77'),
										   (110, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(111, 'Barby000'),
										   (111, 'Tomasito1')
insert Recibe(NumIdenti, NomUsuario) values(112, 'Claudia8'),
										   (112, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(113, 'LuciaL88'),
										   (113, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(114, 'MartinaA1'),
										   (114, 'Roberto123')
insert Recibe(NumIdenti, NomUsuario) values(115, 'Naza0001'),
										   (115, 'Luana5678')
insert Recibe(NumIdenti, NomUsuario) values(116, 'JulioM88'),
										   (116, 'Luana5678')
insert Recibe(NumIdenti, NomUsuario) values(117, 'Nico_1987'),
										   (117, 'Fede_1234')
insert Recibe(NumIdenti, NomUsuario) values(118, 'Leo33333'),
										   (118, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(119, 'Maxi_001'),
										   (119, 'Agus5555')
insert Recibe(NumIdenti, NomUsuario) values(120, 'Juancito11'),
										   (120, 'Barby000')
insert Recibe(NomUsuario, NumIdenti) values('Flopi321', 121)
insert Recibe(NomUsuario, NumIdenti) values('Fiorella', 121)
insert Recibe(NomUsuario, NumIdenti) values('Kevin222', 121)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 122)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 122)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 122)
insert Recibe(NomUsuario, NumIdenti) values('Agus5555', 123)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 123)
insert Recibe(NomUsuario, NumIdenti) values('Andrea90', 123)
insert Recibe(NomUsuario, NumIdenti) values('Nico_1987', 124)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 124)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 124)
insert Recibe(NomUsuario, NumIdenti) values('Nahuelz7', 125)
insert Recibe(NomUsuario, NumIdenti) values('Valen2000', 125)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 125)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 126)
insert Recibe(NomUsuario, NumIdenti) values('Seba_199', 126)
insert Recibe(NomUsuario, NumIdenti) values('Roberto123', 126)
insert Recibe(NomUsuario, NumIdenti) values('Pablo333', 127)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 127)
insert Recibe(NomUsuario, NumIdenti) values('EmaRodri9', 127)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 128)
insert Recibe(NomUsuario, NumIdenti) values('EmaRodri9', 128)
insert Recibe(NomUsuario, NumIdenti) values('Fede_1234', 128)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 129)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 129)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 129)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 130)
insert Recibe(NomUsuario, NumIdenti) values('Luana5678', 130)
insert Recibe(NomUsuario, NumIdenti) values('Malena32', 130)
insert Recibe(NomUsuario, NumIdenti) values('Nico_1987', 131)
insert Recibe(NomUsuario, NumIdenti) values('Roberto123', 131)
insert Recibe(NomUsuario, NumIdenti) values('Seba_199', 131)
insert Recibe(NomUsuario, NumIdenti) values('Thiago89', 132)
insert Recibe(NomUsuario, NumIdenti) values('Valen2000', 132)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 132)
insert Recibe(NomUsuario, NumIdenti) values('LuciaL88', 133)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 133)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 133)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 134)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 134)
insert Recibe(NomUsuario, NumIdenti) values('Barby000', 134)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 135)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 135)
insert Recibe(NomUsuario, NumIdenti) values('Leo33333', 135)
insert Recibe(NomUsuario, NumIdenti) values('Tomasito1', 136)
insert Recibe(NomUsuario, NumIdenti) values('Malena32', 136)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 136)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 137)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 137)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 137)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 138)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 138)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 138)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 139)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 139)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 139)
insert Recibe(NomUsuario, NumIdenti) values('Romi0000', 140)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 140)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 140)
insert Recibe(NomUsuario, NumIdenti) values('Sofi1994', 141)
insert Recibe(NomUsuario, NumIdenti) values('Leo33333', 141)
insert Recibe(NomUsuario, NumIdenti) values('Flopi321', 141)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 141)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 142)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 142)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 142)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 142)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 143)
insert Recibe(NomUsuario, NumIdenti) values('Fede_1234', 143)
insert Recibe(NomUsuario, NumIdenti) values('Agus5555', 143)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 143)
insert Recibe(NomUsuario, NumIdenti) values('Ivan1992', 144)
insert Recibe(NomUsuario, NumIdenti) values('Maxi_001', 144)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 144)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 144)
insert Recibe(NomUsuario, NumIdenti) values('Nahuelz7', 145)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 145)
insert Recibe(NomUsuario, NumIdenti) values('Maxi_001', 145)
insert Recibe(NomUsuario, NumIdenti) values('Kevin222', 145)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 146)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 146)
insert Recibe(NomUsuario, NumIdenti) values('EmaRodri9', 146)
insert Recibe(NomUsuario, NumIdenti) values('Andrea90', 146)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 147)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 147)
insert Recibe(NomUsuario, NumIdenti) values('Nico_1987', 147)
insert Recibe(NomUsuario, NumIdenti) values('Pablo333', 147)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 148)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 148)
insert Recibe(NomUsuario, NumIdenti) values('Daniel01', 148)
insert Recibe(NomUsuario, NumIdenti) values('Barby000', 148)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 149)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 149)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 149)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 149)
insert Recibe(NomUsuario, NumIdenti) values('Thiago89', 150)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 150)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 150)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 150)
insert Recibe(NomUsuario, NumIdenti) values('Fede_1234', 151)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 151)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 151)
insert Recibe(NomUsuario, NumIdenti) values('Aldana77', 151)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 152)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 152)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 152)
insert Recibe(NomUsuario, NumIdenti) values('LuciaL88', 152)
insert Recibe(NomUsuario, NumIdenti) values('Naza0001', 153)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 153)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 153)
insert Recibe(NomUsuario, NumIdenti) values('Sofi1994', 153)
insert Recibe(NomUsuario, NumIdenti) values('Valen2000', 154)
insert Recibe(NomUsuario, NumIdenti) values('Kevin222', 154)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 154)
insert Recibe(NomUsuario, NumIdenti) values('LuciaL88', 154)
insert Recibe(NomUsuario, NumIdenti) values('Maxi_001', 155)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 155)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 155)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 155)
insert Recibe(NomUsuario, NumIdenti) values('Anahi001', 156)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 156)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 156)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 156)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 157)
insert Recibe(NomUsuario, NumIdenti) values('Flopi321', 157)
insert Recibe(NomUsuario, NumIdenti) values('Ivan1992', 157)
insert Recibe(NomUsuario, NumIdenti) values('Malena32', 157)
insert Recibe(NomUsuario, NumIdenti) values('MartinaA1', 158)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 158)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 158)
insert Recibe(NomUsuario, NumIdenti) values('Barby000', 158)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 159)
insert Recibe(NomUsuario, NumIdenti) values('Roberto123', 159)
insert Recibe(NomUsuario, NumIdenti) values('Leo33333', 159)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 159)
insert Recibe(NomUsuario, NumIdenti) values('Agus5555', 160)
insert Recibe(NomUsuario, NumIdenti) values('Ivan1992', 160)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 160)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 160)

------------------------------------- PROCEDIMIENTOS ALMACENADOS ---------------------------------------------------
																		

-------------------  SP DE USUARIO  --------------------------

create proc ListadoUsuActivos															
as
begin
	select * from Usuario where ActivoUsu = 1
end
go

--exec ListadoUsuActivos

create proc UsuarioBuscar
@nomUsuario varchar(30)
as
begin
	select * from Usuario where NomUsuario = @nomUsuario
end
go

create proc UsuarioBuscarActivos
@nomUsuario varchar(30)
as
begin
	select * from Usuario where NomUsuario = @nomUsuario and ActivoUsu = 1
end
go

create proc LogueoUsuario
@nomUsuario varchar(30),
@contra varchar(8)
as
begin
		select * from Usuario where NomUsuario = @nomUsuario and Contraseña = @contra and ActivoUsu = 1
end
go



create proc AltaUsuario
@nomUsuario varchar(30),
@contra varchar(8),
@nomCompleto varchar(30),
@fecha datetime,
@mail varchar(60)

as
begin
	if exists (select * from Usuario where NomUsuario = @nomUsuario and ActivoUsu = 1)
	begin
		return -1
	end

	if exists(select * from Usuario where NomUsuario = @nomUsuario and ActivoUsu = 0)
		begin
			update Usuario
			set ActivoUsu = 1, Contraseña = @contra, NomCompleto = @nomCompleto, FechaNacimiento = @fecha, Mail = @mail
				where NomUsuario = @nomUsuario 
				return 1
		end
			insert Usuario(NomUsuario, Contraseña, Mail, NomCompleto, FechaNacimiento) values(@nomUsuario, @contra, @mail, @nomCompleto, @fecha)
				return 1
end
go



create proc BajaUsuario
@nomUsuario varchar(30)
as
begin
	if not exists (select * from Usuario where nomUsuario = @nomUsuario)
		begin		
			return -1
		end
	if exists (select 1 from Mensaje where NomUsuario = @nomUsuario) or exists (select 1 from Recibe where NomUsuario = @nomUsuario)
		begin
			update Usuario
				set ActivoUsu = 0
				where NomUsuario = @nomUsuario
				return 1
		end
	else
		begin
			delete from Usuario where NomUsuario = @nomUsuario
			if (@@ERROR = 0)
				return 2
			else
				return -2
		end
end
go



alter proc ModificarContra
@nomusuario varchar(30),
@contraNueva varchar(8) 

as
begin
	if not exists (select * from Usuario where NomUsuario = @nomUsuario 
						and  ActivoUsu = 1)
		begin
			return -1
		end
	else
		begin
			update Usuario
			set Contraseña = @contraNueva
			where NomUsuario = @nomusuario

		if (@@ERROR = 0)
			return 1
		else
			return -2
		end
end
go
																			
--------------- CATEGORIAS -------------------------------

create proc ListarCategorias
as
begin
	select * from Categoria
end
go

create proc BuscarCategorias
@codCat varchar(3)
as
begin
	select * from Categoria where CodCat = @codCat 
end
go

--------------   MENSAJE COMUN  ----------------------

create proc AltaMComun
@asunto varchar(80) output,
@texto varchar(max) output,
@nomUsuarioEnvia varchar(30),
@codCat varchar(3)
as
begin
	if not exists (select 1 from Categoria where CodCat = @codCat)
		return -1

	if not exists (select 1 from Usuario where nomUsuario = @nomUsuarioEnvia and ActivoUsu = 1)
		return -2

	
		begin try

		insert Mensaje(Asunto, Texto, NomUsuario) values(@asunto, @texto, @nomUsuarioEnvia)

			declare @numIdenti int

				set @numIdenti = scope_identity()

		insert Comun(NumIdenti, CodCat) values(@numIdenti, @codCat)

			return @numIdenti

		end try
			begin catch
			
				return -3
			end catch
end 
go

create proc ListarComun
as
begin
	select * from Mensaje men inner join Comun com on men.NumIdenti = com.NumIdenti 
end
go

create proc ListadoBandejaEntradaCom
@nomUsuario varchar(30)
as
begin
	select * from Mensaje men inner join Comun com on men.NumIdenti = com.NumIdenti
								inner join Recibe re on men.NumIdenti = re.NumIdenti
								where re.NomUsuario = @nomUsuario
end
go

create proc ListadoBandejaSalidaCom
@nomUsuario varchar(30)
as
begin
	select * from Mensaje men inner join Comun com on men.NumIdenti = com.NumIdenti
						where men.NomUsuario = @nomUsuario
end
go

																								
---------------  MENSAJE PRIVADO -------------------------


create proc AltaMPrivado
@asunto varchar(80) output,																					
@texto varchar(max) output,
@nomUsuarioEnvia varchar(30),
@fechaCaduca datetime
as
begin

	if not exists (select 1 from Usuario where nomUsuario = @nomUsuarioEnvia and ActivoUsu = 1)
		return -1

	
		begin try

		insert Mensaje(Asunto, Texto, NomUsuario) values(@asunto, @texto, @nomUsuarioEnvia)

			declare @numIdenti int

				set @numIdenti = scope_identity()

		insert Privado(NumIdenti, FechaCaducidad) values(@numIdenti, @fechaCaduca)

				return @numIdenti

			end try
		begin catch
			
			return -2
		end catch
end 
go

create proc ListarPrivado
as
begin
	select * from Mensaje men inner join Privado pri on men.NumIdenti = pri.NumIdenti 
end
go

create proc ListadoBandejaEntradaPri
@nomUsuario varchar(30)
as
begin
	select * from Mensaje men inner join Privado pri on men.NumIdenti = pri.NumIdenti
								inner join Recibe re on men.NumIdenti = re.NumIdenti
								where re.NomUsuario = @nomUsuario and (pri.FechaCaducidad > getdate())
end
go

create proc ListadoBandejaSalidaPri
@nomUsuario varchar(30)
as
begin
	select * from Mensaje men inner join Privado pri on men.NumIdenti = pri.NumIdenti
						where men.NomUsuario = @nomUsuario
end
go


---------------------   MENSAJE RECORDATORIO  --------------------------


create proc AltaMRecordatorio
@asunto varchar(80) ,
@texto varchar(max) ,
@nomUsuarioEnvia varchar(30),
@tipoRecordatorio varchar(8)
as
begin

	if not exists (select 1 from Usuario where nomUsuario = @nomUsuarioEnvia and ActivoUsu = 1)
		return -1

	
		begin try

		insert Mensaje(Asunto, Texto, NomUsuario) values(@asunto, @texto, @nomUsuarioEnvia)

			declare @numIdenti int

				set @numIdenti = scope_identity()

		insert Recordatorio(NumIdenti, TipoRecordatorio) values(@numIdenti, @tipoRecordatorio)

				 return @numIdenti

		end try
		begin catch
			
			return -2
		end catch
end 
go		

create proc ListarRecordatorio
as
begin
	select * from Mensaje men inner join Recordatorio re on men.NumIdenti = re.NumIdenti 
end
go

create proc ListadoBandejaEntradaRec
@nomUsuario varchar(30)
as
begin
	select * from Mensaje men inner join Recordatorio rec on men.NumIdenti = rec.NumIdenti
								inner join Recibe re on men.NumIdenti = re.NumIdenti
								where re.NomUsuario = @nomUsuario
end
go

create proc ListadoBandejaSalidaRec
@nomUsuario varchar(30)
as
begin
	select * from Mensaje men inner join Recordatorio rec on men.NumIdenti = rec.NumIdenti
						where men.NomUsuario = @nomUsuario
end
go


create proc AltaReciben
@numIdenti int,
@nomUsuario varchar(30)
as
begin
	if not exists(select * from Usuario where NomUsuario = @nomUsuario)
		return -1

	if exists(select * from Recibe where NomUsuario = @nomUsuario and NumIdenti = @numIdenti)
		return -2

	insert Recibe(NomUsuario, NumIdenti) values(@nomUsuario, @numIdenti)

	if @@ERROR = 0
		return 1
	else
		return 0
end
go

create proc ListaDestinatarios
@numIdenti int
as
begin
	select NomUsuario from Recibe where NumIdenti = @numIdenti	
end
go






														