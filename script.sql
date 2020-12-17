/*** --- INICIO DE CREACION BASE DE DATOS --- ***/

-- create database db_Orfanato
	
/*** --- FIN DE CREACION DE BASES DE DATOS --- ***/

-- TABLA ORFANATO
create table ORFANATO(
	idOrfanato smallint primary key not null,
	nomOrfanato varchar(20)
);

-- TABLA SEXO
create table sexo(
	codSex smallint primary key,
	desSex varchar(10)
);

-- TABLA CATEGORIA DE NIÑ@
create table etapaDesarrollo(
	codEtDe smallint primary key,
	desEtDe varchar(15),
	edadEtDe varchar(5)
);

-------------------------------------------------------------------------------------------------

/*** --- INICIO DE TABLAS DE NIÑ@S ---***/-------------------------------------------------------

-- TABLA PERSONA(NIÑO@)
create table persona(
	identPer smallint primary key not null,
	nomPer varchar(20),
	fechaPer timestamp,
	codSex_Per smallint,
	codEtDe_Per smallint,
	
	constraint fk_codSex_Per foreign key (codSex_Per) references sexo(codSex)
		on delete set null on update cascade,
	constraint fk_codEtDe_Per foreign key (codEtDe_Per) references etapaDesarrollo(codEtDe)
		on delete set null on update cascade
);
	
/*** --- FIN DE TABLAS DE NIÑ@S ---***/----------------------------------------------------------

-------------------------------------------------------------------------------------------------

/*** --- INICIO DE TABLAS PERSONAL DE ORFANATO --- ***/------------------------------------------

-- TABLA DE TIPO DE PERSONAL DE ORFANATO
create table tipoPersonalOrfanato(
	codPerOrf smallint primary key not null,
	desPerOrf varchar(20)
);

-- TABLA PERSONAL DE ORFANATO
create table personalOrfanato(
	identPerOrf smallint primary key not null,
	nomPerOrf varchar(40),
	apePerOrf varchar(40),
	dirPerOrf varchar(30),
	telPerOrf int,
	codPerOrf_PerOrf smallint,
	idOrfanato_PerOrf smallint,

	constraint fk_codPerOrf foreign key (codPerOrf_PerOrf) references tipoPersonalOrfanato(codPerOrf)
		on delete set null on update cascade,
	constraint fk_idOrfanato_PerOrf foreign key (idOrfanato_PerOrf) references Orfanato(idOrfanato)
		on delete set null on update cascade
);

/*** --- FIN DE TABLAS DE PERSONAL ORFANATO --- ***/---------------------------------------------

-------------------------------------------------------------------------------------------------

/*** --- INICIO DE TABLAS AYUDAS --- ***/--------------------------------------------------------

-- TABLA TIPO - AYUDA
create table tipoAyuda(
	codTiAy smallint primary key not null,
	desTiAy varchar(20)
);

-- TABLA AYUDA
create table ayuda(
	identAyu smallint primary key not null,
	nomFun varchar(50),
	fechAyu timestamp,
	idOrfanato_Ayu smallint,
	codTiAy_Ayu smallint,
	
	constraint fk_idOrfanato_Ayu foreign key (idOrfanato_Ayu) references Orfanato(idOrfanato)
		on delete set null on update cascade,
	constraint fk_codTiAy_Ayu foreign key (codTiAy_Ayu) references tipoAyuda(codTiAy)
		on delete set null on update cascade
);

/*** --- FIN DE TABLAS DE AYUDAS --- ***/--------------------------------------------------------

-------------------------------------------------------------------------------------------------

/*** --- INICIO DE TABLAS CASAHOGAR --- ***/-----------------------------------------------------

-- TABLA CASAHOGAR
create table casaHogar(
	codCaHo smallint primary key not null,
	desCaHo varchar(50),
	capCaHo smallint,
	idOrfanato_CaHo smallint,

	constraint fk_idOrfanato_CaHo foreign key (idOrfanato_CaHo) references Orfanato(idOrfanato)
		on delete set null on update cascade
);

-- TABLA CASAHOGAR- PERSONA
create table personaCasaHogar(
	codCaHo_perCaHo smallint,
	identPer_perCaHo smallint,
	constraint fk_codCaHo_perCaHo foreign key (codCaHo_perCaHo) references casaHogar(codCaHo)
		on delete restrict on update cascade,
	constraint fk_identPer_perCaHo foreign key (identPer_perCaHo) references persona(identPer)
		on delete restrict on update cascade
);

/*** --- FIN DE TABLAS CASAHOGAR --- ***/-----------------------------------------------------

----------------------------------------------------------------------------------------------

/*** --- INICIO DE TABLAS ADOPTADORES --- ***/------------------------------------------------


-- TABLA ADOPTADORES
create table Adoptadores(
	identAdop smallint primary key not null,
	nomPad varchar(40),
	apePad varchar(40),
	nomMad varchar(40),
	apeMad varchar(40),
	dirAdop varchar(30),
	telAdop integer
);
-- TABLA PERSONAS-ADOPTADORES
create table estadoAdoptado(
	identPerAdop smallint primary key not null,
	nomAdop varchar (30),
	apeAdop varchar(30),
	estadoAdop bool,
	fechaAdop timestamp,
	identAdop_Adop smallint,
	identPer_Adop smallint,
	constraint fk_identPer_Adop foreign key (identPer_Adop) references Persona(identPer)
		on delete set null on update cascade,
	constraint fk_identAdop_dop foreign key (identAdop_Adop) references adoptadores(identAdop)
		on delete set null on update cascade
);
/*** --- FIN DE TABLAS ADOPTADORES --- ***/---------------------------------------------------

----------------------------------------------------------------------------------------------
-- INSERCION TABLA ORFANATO
insert into ORFANATO values(1, 'Orfanato de Manta');

-- INSERCION TABLA SEXO
insert into sexo values(1, 'Femenino');
insert into sexo values(2, 'Masculino');

-- INSERCION TABLA ETAPADESARROLLO
insert into etapaDesarrollo values(1, 'Infante', '0-5');
insert into etapaDesarrollo values(2, 'Niñez', '6-11');
insert into etapaDesarrollo values(3, 'Adolescencia', '12-15');
insert into etapaDesarrollo values(4, 'Juventud', '16-18');

-- INSERCION TABLA NIÑ@S
insert into persona values(1, 'Michael', '05/01/2020', 2, 1);
insert into persona values(2, 'Joel', '05/01/2020', 2, 1);
insert into persona values(3, 'Maicol', '05/01/2020', 2, 1);
insert into persona values(4, 'Juanito', '29/01/2020', 2, 2);
insert into persona values(5, 'Pedrito', '29/01/2020', 2, 2);
insert into persona values(6, 'Maria', '29/02/2020', 1, 2);
insert into persona values(7, 'Maruja', '4/04/2020', 1, 3);
insert into persona values(8, 'Vision', '15/04/2020', 2, 3);
insert into persona values(9, 'Jarvis', '16/04/2020', 2, 3);
insert into persona values(10, 'Videl', '25/04/2020', 1, 4);
insert into persona values(11, 'Pan', '25/05/2020', 1, 4);
insert into persona values(12, 'Gohan', '4/05/2020', 2, 4);
insert into persona values(13, 'Vegeta', '10/05/2020', 2, 4);
insert into persona values(14, 'Bulma', '10/05/2020', 1, 4);
insert into persona values(15, 'Goku', '06/05/2020', 2, 4);
insert into persona values(16, 'Milk', '06/06/2020', 2, 1);
insert into persona values(17, 'Bardock', '10/07/2020', 2, 1);
insert into persona values(18, 'Gamora', '10/07/2020', 1, 3);
insert into persona values(19, 'Carol', '11/07/2020', 1, 2);
insert into persona values(20, 'Peggy', '11/07/2020', 1, 2);
insert into persona values(21, 'Shuri', '15/07/2020', 1, 2);
insert into persona values(22, 'Nebula', '24/07/2020', 1, 2);
insert into persona values(23, 'Peter', '10/08/2020', 2, 2);
insert into persona values(24, 'Drax', '10/08/2020', 2, 2);
insert into persona values(25, 'Ronan', '19/08/2020', 2, 2);
insert into persona values(26, 'Groot', '19/08/2020', 2, 1);
insert into persona values(27, 'Rocket', '20/08/2020', 2, 2);
insert into persona values(28, 'Barry', '20/08/2020', 2, 1);
insert into persona values(29, 'Victor', '23/09/2020', 2, 1);
insert into persona values(30, 'Artur', '23/09/2020', 2, 1);

-- INSERCION TIPO PERAONAL-ORFANATO
insert into tipoPersonalOrfanato values(1, 'Director');
insert into tipoPersonalOrfanato values(2, 'Coordinador');
insert into tipoPersonalOrfanato values(3, 'Conserje');
insert into tipoPersonalOrfanato values(4, 'Limpieza');

-- INSERCION PERSONALORFANATO
insert into personalOrfanato values(1, 'Nick', 'Fury', 'Manta', 0912345678, 1, 1);
insert into personalOrfanato values(2, 'Steve', 'Rogers','Manta',  0924681012, 2, 1);
insert into personalOrfanato values(3, 'Clart', 'Kent','Manta', 0913579110, 2, 1);
insert into personalOrfanato values(4, 'Phil', 'Coulson',  'Manta', 0966655599, 3, 1);
insert into personalOrfanato values(5, 'Maria', 'Hill', 'Manta', 0977788844, 4, 1);

-- INSERCION DE TIPO-AYUDA
insert into tipoAyuda values(1, 'Economica');
insert into tipoAyuda values(2, 'Alimentos');
insert into tipoAyuda values(3, 'Vestimentas');

-- INSERCION DE AYUDA
insert into ayuda values(1, 'Anonima S.A', '01/01/2020', 1, 1);
insert into ayuda values(2, 'De Corazon S.A', '01/06/2020', 1, 2);
insert into ayuda values(3, 'Sin pedir nada a cambio', '01/06/2020', 1, 3);

-- INSERCION DE DATOS CASAHOGAR
insert into casaHogar values(1, 'Primera Casa', 30, 1);
insert into casaHogar values(2, 'Segunda Casa', 30, 1);
insert into casaHogar values(3, 'Tercera Casa', 30, 1);
insert into casaHogar values(4, 'Cuarta Casa', 30, 1);

-- INSERCION DE DATOS CASASHOGARES-PERSONAS
insert into personaCasaHogar values(1, 1);
insert into personaCasaHogar values(1, 2);
insert into personaCasaHogar values(1, 3);
insert into personaCasaHogar values(2, 4);
insert into personaCasaHogar values(2, 5);
insert into personaCasaHogar values(2, 6);
insert into personaCasaHogar values(3, 7);
insert into personaCasaHogar values(3, 8);
insert into personaCasaHogar values(3, 9);
insert into personaCasaHogar values(4, 10);
insert into personaCasaHogar values(4, 11);
insert into personaCasaHogar values(4, 12);
insert into personaCasaHogar values(4, 13);
insert into personaCasaHogar values(4, 14);
insert into personaCasaHogar values(4, 15);
insert into personaCasaHogar values(1, 16);
insert into personaCasaHogar values(1, 17);
insert into personaCasaHogar values(1, 18);
insert into personaCasaHogar values(2, 19);
insert into personaCasaHogar values(2, 20);
insert into personaCasaHogar values(2, 21);
insert into personaCasaHogar values(3, 23);
insert into personaCasaHogar values(3, 24);
insert into personaCasaHogar values(3, 25);
insert into personaCasaHogar values(4, 25);
insert into personaCasaHogar values(4, 26);
insert into personaCasaHogar values(4, 27);
insert into personaCasaHogar values(4, 28);
insert into personaCasaHogar values(4, 29);
insert into personaCasaHogar values(4, 30);
				   
-- INSERCION DE DATOS ADOPTADORES
insert into adoptadores values(1, 'Steve', 'Trevol', 'Diana', 'Prince', 'Manta', 1111);
insert into adoptadores values(2, 'Clint', 'Barton', 'Natasha', 'Romanoff', 'Manta', 1111);
insert into adoptadores values(3, 'Hank', 'Pim', 'Janet', 'VanDyne', 'Manta', 1111);

-- INSERCION DE DATOS ESTADOADOPTADO
insert into estadoAdoptado values(131, 'Michael', 'Trevol', '1', '26/09/2020', 1, 1);
insert into estadoAdoptado values(132, 'Joel', 'Trevol', '1', '26/09/2020', 1, 2);
insert into estadoAdoptado values(133, 'Maicol', 'Trevol', '1', '26/09/2020', 1, 3);
insert into estadoAdoptado values(134, 'Vison', 'Barton', '1', '9/10/2020', 2, 8);
insert into estadoAdoptado values(135, 'Jarvis', 'Barton', '1', '9/10/2020', 2, 9);
insert into estadoAdoptado values(136, 'Pan', 'Pym', '1','4/11/2020', 3, 11);
insert into estadoAdoptado values(137, 'Rocket', 'Trevol', '1', '26/09/2020', 3, 27);
insert into estadoAdoptado values(138, 'Groot', 'Trevol', '1', '27/09/2020', 3, 28);

/* -- CONSULTA LA CANTIDAD TOTAL DE NIÑOS QUE ALBERGA EN UNA CASA, 
	  INDICANDO SU ETAPA DE DESARROLLO Y NOMBRE--*/	
select
	persona.nomPer as nombre,
	to_char(persona.fechaper, 'dd - mm - yyyy') as mes_del_año,
	casaHogar.desCaHo as nombre_de_la_casa,
	etapaDesarrollo.desEtDe as etapa_de_desarrollo,
	sexo.desSex as sexo
	from personaCasaHogar inner join persona on identper = personaCasaHogar.identPer_perCaHo
						  inner join casaHogar on codCaHo = personaCasaHogar.codCaHo_perCaHo
						  inner join etapadesarrollo on codEtDe = persona.codEtDe_per
						  inner join sexo on codSex = persona.codSex_Per
	where persona.identPer = 1

/*** --- CONSULTA EL NUMERO DE NIÑOS SEGUN FECHA QUE FUERON ACOGIDOS POR EL ORFANATO --- ****/
select 
	to_char(persona.fechaper, 'mm - yyyy') as mes_del_año,
	etapaDesarrollo.desEtDe as categoria,
	count(*) as total
	from persona inner join etapadesarrollo on codEtDe = persona.codEtDe_per 
	where etapadesarrollo.desEtDe = 'Infante'
	group by categoria, 1 order by 1

/*** --- CONSULTA DATOS GENERALES DE PERSONAS ADOPTADAS --- ***/
select
	estadoadoptado.nomAdop as nombre,
	estadoadoptado.apeAdop as apellido,
	etapaDesarrollo.desEtDe as etapa_De_Desarrollo,
	sexo.desSex as sexo,
	adoptadores.nompad ||'  '|| adoptadores.apepad as nombres_del_padre,
	adoptadores.nommad ||'  '|| adoptadores.apemad as nombre_de_la_madre,
	estadoadoptado.fechaAdop as fecha_de_adopcion
	from persona inner join estadoadoptado on identper = estadoadoptado.identper_Adop
				 inner join etapadesarrollo on codEtDe = persona.codEtDe_Per
				 inner join sexo on codSex = persona.codSex_Per
				 inner join adoptadores on identAdop = estadoadoptado.identAdop_Adop
	where adoptadores.identAdop = 3
	
/*** --- CONSULTA DATOS DE LAS CASAS-HOGARES --- ***/
select
	casaHogar.desCaHo as nombre_de_la_casa,
	casaHogar.capCaHo as capacidad_maxima,
	count(personaCasaHogar.identPer_perCaHo) as espacio_ocupado,
	casaHogar.capCaHo - count(personaCasaHogar.identPer_perCaHo) as espacio_disponible
	from casaHogar inner join personaCasaHogar on casaHogar.codCaHo = personaCasaHogar.codCaHo_perCaHo	
				   inner join persona on persona.identPer = personaCasaHogar.identPer_perCaHo
	group by casaHogar.capCaHo, casaHogar.desCaHo 
	
/*** --- CONSULTA EL NUMERO DE NIÑOS SEGUN SU ETAPA DENTRO DEL ORFANATO --- ****/	
select 
	count(persona.codEtDe_Per) as total_de_niños,
	etapadesarrollo.desEtDe as etapa_de_creciemiento
	from etapadesarrollo inner join persona on codEtDe = persona.codEtDe_Per
	group by etapadesarrollo.desEtDe
	
							   