---ALUMNOS---
---LISETH GIRALDO--
---ALEJANDRO MONTOYA---
---LUZ TATIANA ZAPATA---
-- CREACION BASE DE DATOS--
create database farmacia
use farmacia

---tabla cliente
create table cliente(
cod_cliente int unique,
id_cliente bigint,
nombrecliente varchar(50) not null,
telefono bigint not null,
direccion varchar(60) not null,
constraint apdocliente primary key(cod_cliente))

insert into cliente values(1,32101903,'Juan Perez',3005121314, 'Cr 42 # 54-36')
insert into cliente values(2,4310190,'Juanita del Mar',3135121314, 'Cr 67 # 54-36')
insert into cliente values(3,3240190,'Flor Jimenez',314121314, 'Calle 42 # 54-36')
insert into cliente values(4,710434,'Pepe Rodriguez',301234314, 'Avenida 80 # 54-36')
insert into cliente values(5,70019034,'Juan Porras',3155121314, 'Circular 42 # 54-36')

select * from cliente
alter table cliente add fecha_nac date
update cliente set fecha_nac='1990-08-12' where cod_cliente=1
update cliente set fecha_nac='1997-04-02' where cod_cliente=2
update cliente set fecha_nac='1999-11-01' where cod_cliente=3
update cliente set fecha_nac='2005-01-13' where cod_cliente=4
update cliente set fecha_nac='1988-05-12' where cod_cliente=5
alter table cliente add email_cliente varchar(60)
update cliente set email_cliente='juan@hotmail.com' where cod_cliente=1
update cliente set email_cliente='pedrito@hotmail.com' where cod_cliente=2
update cliente set email_cliente='flor@hotmail.com' where cod_cliente=3
update cliente set email_cliente='pepe@hotmail.com' where cod_cliente=4
update cliente set email_cliente='porras@hotmail.com' where cod_cliente=5

---tabla empleado
create table empleado(
cod_empleado int unique,
id_empleado bigint,
nombreempleado varchar(60) not null,
tel_empleado bigint not null,
dir_empleado varchar (80),
email_empleado varchar(40),
constraint apodoempleado primary key (cod_empleado))

drop table empleado
insert into empleado values(1,32101903,'Carlos Perez',3145121314, 'Cr 45 # 54-36', 'carlosperez@hotmail.com')
insert into empleado values(2,43101903,'Pilar Perez',3165121314, 'Cr 45 # 54-36', 'Pilarerez@hotmail.com')
alter table empleado add fecha_nacempl date
update empleado set fecha_nacempl='2000-12-12' where cod_empleado=1
update empleado set fecha_nacempl='1978-01-12' where cod_empleado=2
select * from empleado

---tabla proveedor
create table proveedor(
cod_proveedor int unique,
tipo_idprov varchar(10) not null,
id_prov int not null,
nombreproveedor varchar(60) not null,
contactoproveedor varchar(60) not null,
tel_proveedor bigint not null,
dir_proveedor varchar (80)not null,
email_proveedor varchar(40)not null,
constraint apodoprove primary key (cod_proveedor))
alter table proveedor add ciudad varchar (60)
insert into proveedor values(1,'nit',900081765,'Laboratorios America','Luz Lopez',3123453432,'Avenida 80 #30-50', 'luzlopez@labamerica.com','Medellin')
insert into proveedor values(2,'nit',800043545,'Laboratorios Cruz','Angel Gomez',321453432,'Carrera 56 #30-50', 'angelgomez@labcruz.com','Bogota')
select * from proveedor

---tabla producto
create table producto(
cod_producto int unique,
nombre_producto varchar(60) not null,
precio_compra bigint not null,
precio_venta bigint not null,
reg_invima varchar(60) null,
lote varchar (20) null,
fecha_venci date null,
cod_proveedor1 int not null,
cod_pres1 int null,
cod_lab1 int null,
constraint apodoproducto primary key (cod_producto),
constraint apodoprov foreign key(cod_proveedor1) references proveedor(cod_proveedor),
constraint apodopresenta foreign key(cod_pres1) references presentacion(cod_pres),
constraint apodolabora foreign key (cod_lab1) references laboratorio(cod_lab)

drop table producto
select * from producto
insert into producto values(1,'Acetaminofen',500,1000,'2009M-0009447','L02869','2022-04-01',1,1,1)
insert into producto values(2,'Acetaminofen',5000,10000,'2009M-0009447','L02869','2022-04-01',1,2,1)
insert into producto values(3,'Noraver Garganta Menta',10000,12000,'2007M-006195 R1','8R9019A','2020-12-01',1,5,2)
insert into producto values(4,'Beclometasona Dipropionato Nasal',20000,25000,'2010M-0010923','801321','2021-04-01',1,5,1)

---tabla presentacion
create table presentacion(
cod_pres int unique,
nombre_prese varchar(60) not null,
constraint apodoprese primary key (cod_pres))

insert into presentacion values(1,'Tabletas x 10')
insert into presentacion values(2,'Tabletas x 100')
insert into presentacion values(3,'Jarabe x 500 ML')
insert into presentacion values(4,'Jarabe x 120ML')
insert into presentacion values(5,'Spray 120ML')

select * from presentacion

---tabla laboratorio
create table laboratorio(
cod_lab int unique,
nombre_lab varchar(60) not null,
constraint apodolab primary key (cod_lab))

insert into laboratorio values (1, 'Genfar')
insert into laboratorio values (2,'Tecnofar')
insert into laboratorio values (3,'Coaspharma')

select * from laboratorio

---tabla forma de pago
create table forma_pago(
cod_formapago int unique,
nombre_formapago varchar(60) not null,
constraint apodoformapago primary key (cod_formapago))
drop table forma_pago
insert into forma_pago values (1,'efectivo')
insert into forma_pago values (2,'credito')
insert into forma_pago values (3,'Tarjetas')
select * from forma_pago

---tabla pedido compra
create table pedido_compra(
id_transaccion int unique,
nro_pedido int not null,
fecha_pedido date not null,
cod_formapago1 int not null,
cod_empleado1 int not null,
cod_proveedor2 int not null,
cod_producto1 int not null,
cant int not null,
precio_compra1 bigint not null,
total_pedido bigint not null,
dto_pedido bigint not null,
impuesto bigint null,
constraint apodopedido primary key (id_transaccion),
constraint apodoformapagocompra foreign key(cod_formapago1) references forma_pago(cod_formapago),
constraint apodoemp foreign key(cod_empleado1) references empleado(cod_empleado),
constraint apodopr foreign key(cod_proveedor2) references proveedor(cod_proveedor),
constraint apodoprod foreign key(cod_producto1) references producto(cod_producto))
drop table pedido_compra
insert into pedido_compra values (1,1,'2020-11-09',1,1,1,1,100,500,50000,0,0)
insert into pedido_compra values (2,1,'2020-11-09',2,1,1,1,100,500,50000,0,0)
select * from pedido_compra
update pedido_compra set cod_formapago1=1 where id_transaccion=2
update pedido_compra set cod_producto1=2 where id_transaccion=2
update pedido_compra set precio_compra1=5000 where id_transaccion=2
update pedido_compra set total_pedido=50000 where id_transaccion=2

--tabla factura
create table factura_venta(
id_transaccionventa int unique,
nro_factura int not null,
fecha_factura date not null,
cod_formapago2 int not null,
cod_empleado2 int not null,
cod_cliente2 int not null,
cod_producto3 int not null,
cantventa int not null,
precio_venta1 bigint not null,
total_venta bigint not null,
dto_venta bigint not null,
impuestoventa bigint null,
constraint apodofactura primary key (id_transaccionventa),
constraint apodoformapagoventa foreign key(cod_formapago2) references forma_pago(cod_formapago),
constraint apodoempventa foreign key(cod_empleado2) references empleado(cod_empleado),
constraint apodoclienteve foreign key(cod_cliente2) references cliente(cod_cliente),
constraint apodoprodventa foreign key(cod_producto3) references producto(cod_producto))
drop table factura_venta
insert into factura_venta values (1,1,'2020-11-09',1,1,1,1,2,1000,2000,0,0)

select * from factura_venta

--.tabla intermedia producto proveedor
create table producto_proveedor(
cod_producto1 int,
cod_proveedor2 int,
constraint apodoprodprov foreign key (cod_producto1) references producto(cod_producto),
constraint apodoprovprod foreign key (cod_proveedor2) references proveedor(cod_proveedor))

insert into producto_proveedor values(1,1)
insert into producto_proveedor values(2,1)
insert into producto_proveedor values(3,1)

select * from producto_proveedor

--- tabla intermedia producto cliente
create table producto_cliente(
cod_producto2 int,
cod_cliente1 int,
constraint apodoprodcliente foreign key (cod_producto2) references producto(cod_producto),
constraint apodoclienteprod foreign key (cod_cliente1) references cliente(cod_cliente))

insert into producto_cliente values(1,1)
insert into producto_cliente values(2,1)
insert into producto_cliente values(3,1)

---a que proveedor se le compra noraver
select cod_proveedor2 from producto_proveedor where cod_producto1=1

---a que proveedor pertenece el codigo 1
select nombreproveedor from proveedor where cod_proveedor=1

---hacer factura
select nombre_producto, cod_cliente2, cantventa, precio_venta from producto, factura_venta where cod_producto=1

--- cual es el nombre del cliente de la factura 1
select nombrecliente from factura_venta, cliente where id_transaccionventa=1