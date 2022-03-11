create database Proy;
use Proy;
-----------------------1
create  table Estado (
ID_Estado int identity primary key not null,
Estado varchar (50) not null 
);

insert into Estado values ('Estado de Mexico');
insert into Estado values ('Veracruz');
insert into Estado values ('Estado de Mexico');
insert into Estado values ('Aguascalientes');
insert into Estado values ('Yucatan');
select * from Estado;
----------------------2
create  table Municipio (
ID_Mun int identity primary key not null,
Municipio varchar (50) not null 
);
insert into Municipio values ( 'Ecatepec de Morelos');
insert into Municipio values ( 'Boca del Rio');
insert into Municipio values ( 'Cuautitlan');
insert into Municipio values ( 'Jesus Maria');
insert into Municipio values ('Progreso');
select * from Municipio;
---------------------3
create  table Calle1 (
ID_Calle int identity primary key not null,
Estado varchar (50) not null,
Num_Int int not null,
Num_Ext int not null,
);
select * from Calle1;
insert into Calle1 values ('Benito',55,60);
insert into Calle1 values ('Leona ViCario',8,26);
insert into Calle1 values ('San Pablito',26,8);
insert into Calle1 values ('Uruguay',202,10);
insert into Calle1 values ('Salvador',5,5);
--------------------4
create table Colonia1 (
ID_Colonia int identity primary key not null,
Colonia varchar (50) not null,
C_P int not null,
);
select * from Colonia1;
insert into Colonia1 values ('San Lorenzo Tetlixtac',54985);
insert into Colonia1 values ('San Angel',26115);
insert into Colonia1 values ('Villas Napoleon',78962);
insert into Colonia1 values ('Huerta Vieja',53217);
insert into Colonia1 values ('Verde',23987);
-------------------5
create table Telefono (
ID_Telefono int identity primary key not null,
Telefono int not null,
);
select * from Telefono;
insert into Telefono values (55580792);
insert into Telefono values (55535655);
insert into Telefono values (55259785);
insert into Telefono values (55589876);
insert into Telefono values (55985216);
----------------------6
create table Tipo_Cliente (
ID_TCliente int identity primary key not null,
Tipo varchar (50) not null
);
select * from Tipo_Cliente;
insert into Tipo_Cliente values ('Suprime');
insert into Tipo_Cliente values ('VIP');
insert into Tipo_Cliente values ('ERT');
insert into Tipo_Cliente values ('AQT');
insert into Tipo_Cliente values ('AXT');
-----------------------7
create table Tipo_Servicio (
ID_TServicio int identity primary key not null,
Servicio varchar (50) not null,
);
select * from Tipo_Servicio;
insert into Tipo_Servicio values ('Privado');
insert into Tipo_Servicio values ('Publico');

------------------8
create table Banco (
ID_Banco int identity primary key not null,
Banco varchar (50) not null,
);
select * from Banco;
insert into Banco values ('HSBC');
insert into Banco values ('INBURSA');
insert into Banco values ('BANAMEX');
insert into Banco values ('SCOTIABANK');
insert into Banco values ('BANCOMER');
------------------9
create table Referencias (
ID_Referencia int identity primary key not null,
Cuenta int not null,
ID_TServicios int foreign key references Tipo_Servicio(ID_TServicio),
ID_Bancos int foreign key  references Banco(ID_Banco)
);
select * from Referencias;
insert into Referencias values(1234,1,1);
insert into Referencias values(3344,2,2);
insert into Referencias values(5789,3,3);
insert into Referencias values(9912,4,4);
insert into Referencias values(7896,5,5);
------------10
create table Tipo_Pago (
ID_TPago int identity primary key not null,
TPago varchar (50) not null,
);
select * from Tipo_Pago;
insert into Tipo_Pago values('Efectivo');
insert into Tipo_Pago values('Tarjeta');
------------11
create table Factura (
ID_Factura int identity primary key not null,
Fecha_Emision date not null,
Total money not null,
Fecha_Vencimiento date not null,
ID_Referencias int foreign key references Referencias(ID_Referencia),
ID_TPago int foreign key references Tipo_Pago(ID_TPago)
);
select * from Factura;
insert into Factura values('2019-10-23',542,'2019-10-30',1,1);
insert into Factura values('2019-10-24',542,'2019-11-01',2,1);
insert into Factura values('2019-10-25',722,'2019-11-02',3,1);
insert into Factura values('2019-10-26',456,'2019-11-03',4,2);
insert into Factura values('2019-10-27',398,'2019-11-04',5,2);
-------------12
create table Paquetes (
ID_Paquete int identity primary key not null,
Nom_Paquete varchar(50) not null,
Tipo_Paquete varchar(50) not null,
Precio money not null
);
select * from Paquetes;
insert into Paquetes values('DirecTV Oro HD','Premium',685);
insert into Paquetes values('Fox+','HD',550);
insert into Paquetes values('HBO MAX HD','HD',650);
insert into Paquetes values('DirecTV','Basico',300);
insert into Paquetes values('DirecTV Plus','Familiar',750);
----------13
create table Cliente (
ID_Cliente int identity primary key not null,
Nombre varchar (50) not null,
Nombre2 varchar (50) not null DEFAULT '--------',
Ap_Paterno varchar (50) not null,
Ap_Materno varchar (50) not null,
Estados int foreign key references Estado(ID_Municipio),
Municipios int foreign key references Municipio (ID_Municipio),
Colonias int foreign key references Colonia1 (ID_Colonia),
Calles int foreign key references Calle1 (ID_Calle),
Telefonos int foreign key references Telefono (ID_Telefono),
TClientes int foreign key references Tipo_Cliente (ID_TCliente),
Paquetes int foreign key references Paquetes (ID_Paquete),
Facturas int foreign key references Factura (ID_Factura),
);
select * from  Cliente;
insert into Cliente values('Jesus','Jair','Ramos','Rodriguez',1,1,1,1,6,1,1,1);
insert into Cliente values('Montserrat','----','Gonzalez','Martines',2,2,2,2,7,2,2,2);
insert into Cliente values('Martin','----','Ramos','Sanchez',3,3,3,3,8,3,3,3);
insert into Cliente values('Diana','----','Rodriguez','Zarate',4,4,4,4,8,4,4,4);
insert into Cliente values('Jose','Manuel','Castillo','Espinoza',5,5,5,5,8,5,5,5);
---------------------------------


alter table Tipo_Servicio ADD CONSTRAINT UQ_Tipo_Servicio_ID_TServicio UNIQUE(ID_TServicio);

create rule RG_Paquete as @Nom_Paquete= 'DirecTV Oro HD' or @Nom_Paquete ='Fox+' or @Nom_Paquete ='HBO MAX HD' or @Nom_Paquete ='DirecTV'or @Nom_Paquete ='DirecTV Plus';
insert into Paquetes values('Sky','Premium',685);
exec sp_bindrule RG_Paquete,'Paquetes.Nom_Paquete';
sp_help RG_Paquete;

select Factura.Fecha_Emision,Factura.Fecha_Vencimiento,Factura.Total,Paquetes.Nom_Paquete,Paquetes.Tipo_Paquete from Factura inner join Paquetes on Factura.ID_Factura=Paquetes.ID_Paquete;
create view Cliente2 with encryption  as select  Factura.Fecha_Emision,Factura.Fecha_Vencimiento,Factura.Total,Paquetes.Nom_Paquete,Paquetes.Tipo_Paquete from Factura inner join Paquetes on Factura.ID_Factura=Paquetes.ID_Paquete;
select * from Cliente2;
begin transaction
delete from Factura;
select * from Factura;
Rollback;

