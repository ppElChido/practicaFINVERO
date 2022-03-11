Create table Estado1 (
ID_Estado int not null,
  primary key (ID_Estado),
Estado varchar(50) not null
);
create sequence ID_Estado1 minvalue 1 start WITH 1 cache 100;
insert into Estado1 values (1, 'Estado de Mexico');
insert into Estado1 values (2, 'Veracruz');
insert into Estado1 values (3, 'Estado de Mexico');
insert into Estado1 values (4, 'Aguascalientes');
insert into Estado1 values (5, 'Yucatan');
select * from Estado1; 
/*---------------------------*/
Create table Municipio1 (
ID_Mun int not null,
  primary key (ID_Mun),
Municipio varchar(50) not null
);
create sequence Municipio1 minvalue 1 start WITH 1 cache 100;
select * from Municipio1; 
insert into Municipio1 values (033, 'Ecatepec de Morelos');
insert into Municipio1 values (028, 'Boca del Rio');
insert into Municipio1 values (024, 'Cuautitlan');
insert into Municipio1 values (001, 'Jesus Maria');
insert into Municipio1 values (059, 'Progreso');
create sequence Municipio1 minvalue 1 start WITH 1 cache 100;
/*---------------------------*/
Create table Colonia1 (
ID_Colonia int not null,
  primary key (ID_Colonia),
Colonia varchar(50) not null
);
create sequence Colonia1 minvalue 1 start WITH 1 cache 100;
select * from Colonia1; 
insert into Colonia1 values (029, 'San Lorenzo Tetlixtac');
insert into Colonia1 values (002, 'San Angel');
insert into Colonia1 values (098, 'Villas Napoleon');
insert into Colonia1 values (078, 'Huerta Vieja');
insert into Colonia1 values (062, 'Verde');
/*---------------------------*/
Create table Calle1 (
ID_Calle int not null,
  primary key (ID_Calle),
Calle varchar(50) not null,
Num_Int int not null,
Num_Ext int not null
);
create sequence Calle1 minvalue 1 start WITH 1 cache 100;
select * from Calle1;
insert into Calle1 values (122, 'Benito',55,60);
insert into Calle1 values (789, 'Leona ViCario',8,26);
insert into Calle1 values (987, 'San Pablito',26,8);
insert into Calle1 values (365, 'Uruguay',202,10);
insert into Calle1 values (596, 'Salvador',5,5); 
/*---------------------------*/
Create table Telefono1 (
ID_Telefono int not null,
  primary key (ID_Telefono),
Numero int  not null
);
create sequence Telefono1 minvalue 1 start WITH 1 cache 100;
select * from Telefono1; 
insert into Telefono1 values (1, 58079201);
insert into Telefono1 values (2, 53565594);
insert into Telefono1 values (3, 25978563);
insert into Telefono1 values (4, 58987625);
insert into Telefono1 values (5, 98521654);
/*---------------------------*/
Create table Tipo_Cliente (
ID_TCliente int not null,
  primary key (ID_TCliente),
Tipo varchar (50)  not null
);
select * from Tipo_Cliente; 
insert into Tipo_Cliente values (985,'Suprime');
insert into Tipo_Cliente values (896,'VIP');
insert into Tipo_Cliente values (123,'ERT');
insert into Tipo_Cliente values (685,'AQT');
insert into Tipo_Cliente values (741,'AXT');
/*---------------------------*/
Create table Tipo_Servicio (
ID_TServicio int not null,
  primary key (ID_TServicio),
Servicio varchar (50)  not null
);
select * from Tipo_Servicio;
insert into Tipo_Servicio values (111,'Privado'); 
/*---------------------------*/
Create table Bancos (
ID_Bancos int not null,
  primary key (ID_Bancos),
Banco varchar (50)  not null
);
select * from Bancos; 
insert into Bancos values (596,'HSBC');
insert into Bancos values (598,'INBURSA');
insert into Bancos values (536,'BANAMEX');
insert into Bancos values (525,'SCOTIABANK');
insert into Bancos values (519,'BANCOMER'); 

/*---------------------------*/
Create table Referencias (
ID_TServicio int not null,
ID_Banco int not null,
ID_Referencias int not null,
  primary key (ID_Referencias),
  Cuenta int not null,
foreign key (ID_TServicio) references Tipo_Servicio (ID_TServicio),
foreign key (ID_Banco) references Bancos (ID_Bancos)
);
select * from Referencias; 
insert into Referencias values (111,519,985,51464);
insert into Referencias values (111,525,986,54168);
insert into Referencias values (111,536,987,564641);
insert into Referencias values (111,596,988,548798);
insert into Referencias values (111,598,989,369784); 
/*---------------------------*/
Create table Tipo_Pago (
ID_TPago int not null,
  primary key (ID_TPago),
TPago varchar (50)  not null
);
select * from Tipo_Pago; 
insert into Tipo_Pago values (11,'Tarjeta Debito');
insert into Tipo_Pago values (12,'Tarjeta Creditp');
insert into Tipo_Pago values (13,'Banco');
insert into Tipo_Pago values (14,'Efectivo');
insert into Tipo_Pago values (15,'Transferencias'); 
/*---------------------------*/
Create table Factura (
ID_Referencias int not null,
ID_TPago int not null,
ID_Factura int not null,
  primary key (ID_Factura),
Fecha_Emision date not null,
Total decimal not null,
Fecha_Vencimiento date not null,
foreign key (ID_Referencias) references Referencias (ID_Referencias),
foreign key (ID_TPago) references Tipo_Pago (ID_TPago)
);
select * from Factura; 
insert into Factura values (985,11,1,'13-03-2016',65,'16-05-2016');
insert into Factura values (986,12,2,'14-03-2016',65,'17-05-2016');
insert into Factura values (987,13,3,'15-03-2016',65,'18-05-2016');
insert into Factura values (988,14,4,'16-03-2016',65,'19-05-2016');
insert into Factura values (989,15,5,'17-03-2016',65,'20-05-2016');

/*---------------------------*/
Create table Paquetes (
ID_Paquetes int not null,
  primary key (ID_Paquetes),
Nom_Paquete varchar(50) not null,
Tipo_Paquete varchar(50) not null,
Precio decimal not null
);
select * from Paquetes; 
insert into Paquetes values (762,'DirectTV oro HD','VIP',555);
insert into Paquetes values (763,'DirectTV deco','suprime',450);
insert into Paquetes values (764,'DirectTV HD','ERT',475);
insert into Paquetes values (765,'DirectTV oro HD','VIP',555);
insert into Paquetes values (766,'DirectTV HD','ERT',450);

/*---------------------------*/
Create table Cliente11 (
ID_Cliente int not null,
  primary key (ID_Cliente),
Nombre varchar (50) not null,
Nombre2 varchar (50) not null ,
Ap_Paterno varchar (50) not null,
Ap_Materno varchar (50) not null,
ID_Estado int not null,
ID_Mun int not null,
ID_Colonia int not null,
ID_Calle int not null,
ID_Telefono int not null,
ID_TCliente int not null,
ID_Paquetes int not null,
ID_Factura int not null,
foreign key (ID_Estado) references Estado1 (ID_Estado),
foreign key (ID_Mun) references Municipio1 (ID_Mun),
foreign key (ID_Colonia) references Colonia1 (ID_Colonia),
foreign key (ID_Calle) references Calle1 (ID_Calle),
foreign key (ID_Telefono) references Telefono1 (ID_Telefono),
foreign key (ID_TCliente) references Tipo_Cliente (ID_TCliente),
foreign key (ID_Paquetes) references Paquetes (ID_Paquetes),
foreign key (ID_Factura) references Factura (ID_Factura)
);
select * from Cliente11; 
INSERT INTO Cliente11 values('8', 'Montserrat', 'Adriana', 'Gonzalez', 'Martinez', '1', '033', '029', '122', '1', '985', '762', '1');
INSERT INTO Cliente11 values('9', 'Juan', 'Jose', 'Perez', 'Montes', '2', '028', '002', '789', '2', '896', '763', '2');
INSERT INTO Cliente11 values('10', 'Jose', 'Carlos', 'Mer', 'Piers', '3', '024', '098', '987', '3', '123', '764', '3');
INSERT INTO Cliente11 values('11', 'Jesus', 'Jair', 'Ramos', 'Rodriguez', '4', '001', '078', '365', '4', '685', '765', '4');
INSERT INTO Cliente11 values('12', 'Norma', '', 'Martinez', 'Perez', '5', '059', '062', '596', '5', '741', '766', '5');
-----------Vista----------------
select Factura.Fecha_Emision,Factura.Fecha_Vencimiento,Factura.Total,Paquetes.Nom_Paquete,Paquetes.Tipo_Paquete from Factura inner join Paquetes on Factura.ID_Factura=Paquetes.ID_Paquetes;
