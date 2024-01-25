#@(#) script.ddl

DROP TABLE IF EXISTS TRANSPORTAI;
DROP TABLE IF EXISTS ASMENYS;
DROP TABLE IF EXISTS SPORTO_SALES;
DROP TABLE IF EXISTS TRANSPORTU_DEFEKTAI;
DROP TABLE IF EXISTS SPORTO_SUTARTYS;
DROP TABLE IF EXISTS UZSAKYMAI;
DROP TABLE IF EXISTS DARBUOTOJAI;
DROP TABLE IF EXISTS SAVININKAI;
DROP TABLE IF EXISTS DARBO_SUTARTYS;
DROP TABLE IF EXISTS TRANSPORTO_PRIEMONIU_TIPAI;
DROP TABLE IF EXISTS POZICIJOS_TIPAI;
DROP TABLE IF EXISTS LYTYS;
DROP TABLE IF EXISTS DOKUMENTAI;
DROP TABLE IF EXISTS AR_DIRBA_VISOMIS_PAROMIS;
DROP TABLE IF EXISTS IRANGOS;
DROP TABLE IF EXISTS GAMYKLOS;
CREATE TABLE GAMYKLOS
(
	Salis varchar (255) NOT NULL,
	Miestas varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Darbo_laikas date NOT NULL,
	Irangos_kiekis int NOT NULL,
	id_GAMYKLA integer NOT NULL,
	PRIMARY KEY(id_GAMYKLA)
);

CREATE TABLE IRANGOS
(
	Tipas varchar (255) NOT NULL,
	Pagaminimo_data date NOT NULL,
	Gamintojas varchar (255) NOT NULL,
	Garantijos_laikotarpis int NOT NULL,
	Medziagos_is_kuriu_pagaminta varchar (255) NOT NULL,
	id_IRANGA integer NOT NULL,
	PRIMARY KEY(id_IRANGA)
);

CREATE TABLE AR_DIRBA_VISOMIS_PAROMIS
(
	id_AR_DIRBA_VISA_PARA integer NOT NULL,
	name char (4) NOT NULL,
	PRIMARY KEY(id_AR_DIRBA_VISA_PARA)
);
INSERT INTO AR_DIRBA_VISOMIS_PAROMIS(id_AR_DIRBA_VISA_PARA, name) VALUES(1, 'Taip');
INSERT INTO AR_DIRBA_VISOMIS_PAROMIS(id_AR_DIRBA_VISA_PARA, name) VALUES(2, 'Ne');

CREATE TABLE DOKUMENTAI
(
	id_DOKUMENTAS integer NOT NULL,
	name char (17) NOT NULL,
	PRIMARY KEY(id_DOKUMENTAS)
);
INSERT INTO DOKUMENTAI(id_DOKUMENTAS, name) VALUES(1, 'Pasas');
INSERT INTO DOKUMENTAI(id_DOKUMENTAS, name) VALUES(2, 'Tapatybes_kortele');

CREATE TABLE LYTYS
(
	id_LYTIS integer NOT NULL,
	name char (7) NOT NULL,
	PRIMARY KEY(id_LYTIS)
);
INSERT INTO LYTYS(id_LYTIS, name) VALUES(1, 'Vyras');
INSERT INTO LYTYS(id_LYTIS, name) VALUES(2, 'Moteris');

CREATE TABLE POZICIJOS_TIPAI
(
	id_POZICIJOS_TIPAS integer NOT NULL,
	name char (16) NOT NULL,
	PRIMARY KEY(id_POZICIJOS_TIPAS)
);
INSERT INTO POZICIJOS_TIPAI(id_POZICIJOS_TIPAS, name) VALUES(1, 'Direktorius');
INSERT INTO POZICIJOS_TIPAI(id_POZICIJOS_TIPAS, name) VALUES(2, 'Treneris');
INSERT INTO POZICIJOS_TIPAI(id_POZICIJOS_TIPAS, name) VALUES(3, 'Administratorius');

CREATE TABLE TRANSPORTO_PRIEMONIU_TIPAI
(
	id_TRANSPORTO_PRIEMONES_TIPAS integer NOT NULL,
	name char (16) NOT NULL,
	PRIMARY KEY(id_TRANSPORTO_PRIEMONES_TIPAS)
);
INSERT INTO TRANSPORTO_PRIEMONIU_TIPAI(id_TRANSPORTO_PRIEMONES_TIPAS, name) VALUES(1, 'Krovinine_masina');
INSERT INTO TRANSPORTO_PRIEMONIU_TIPAI(id_TRANSPORTO_PRIEMONES_TIPAS, name) VALUES(2, 'Sedanas');
INSERT INTO TRANSPORTO_PRIEMONIU_TIPAI(id_TRANSPORTO_PRIEMONES_TIPAS, name) VALUES(3, 'Universalas');
INSERT INTO TRANSPORTO_PRIEMONIU_TIPAI(id_TRANSPORTO_PRIEMONES_TIPAS, name) VALUES(4, 'Hecbekas');
INSERT INTO TRANSPORTO_PRIEMONIU_TIPAI(id_TRANSPORTO_PRIEMONES_TIPAS, name) VALUES(5, 'Mikro_autobusas');

CREATE TABLE DARBO_SUTARTYS
(
	Sutarties_numeris int NOT NULL,
	Data date NOT NULL,
	Etatas decimal (6,2) NOT NULL,
	Fiksuota_alga decimal (6,2) NOT NULL,
	Dokumentas integer NOT NULL,
	id_DARBO_SUTARTIS integer NOT NULL,
	PRIMARY KEY(id_DARBO_SUTARTIS),
	FOREIGN KEY(Dokumentas) REFERENCES DOKUMENTAI (id_DOKUMENTAS)
);

CREATE TABLE SAVININKAI
(
	Vardas varchar (255) NOT NULL,
	Pavarde varchar (255) NOT NULL,
	Asmens_kodas int NOT NULL,
	Amzius int NOT NULL,
	Banko_saskaita varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Lytis integer NOT NULL,
	PRIMARY KEY(Asmens_kodas),
	FOREIGN KEY(Lytis) REFERENCES LYTYS (id_LYTIS)
);

CREATE TABLE SPORTO_SALES
(
	Salis varchar (255) NOT NULL,
	Miestas varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Darbo_laikas date NOT NULL,
	Vietu_kiekis int NOT NULL,
	Irengimo_data date NOT NULL,
	Darbuotoju_kiekis int NOT NULL,
	Ar_dirba_visa_para integer NOT NULL,
	id_SPORTO_SALE integer NOT NULL,
	fk_SAVININKASAsmens_kodas int NOT NULL,
	fk_ASMUOAsmens_kodas integer NOT NULL,
	PRIMARY KEY(id_SPORTO_SALE),
	FOREIGN KEY(Ar_dirba_visa_para) REFERENCES AR_DIRBA_VISOMIS_PAROMIS (id_AR_DIRBA_VISA_PARA),
	CONSTRAINT valdo FOREIGN KEY(fk_SAVININKASAsmens_kodas) REFERENCES SAVININKAI (Asmens_kodas),
	CONSTRAINT sportuoja FOREIGN KEY(fk_ASMUOAsmens_kodas) REFERENCES ASMENYS (Asmens_kodas)
);


CREATE TABLE DARBUOTOJAI
(
	Vardas varchar (255) NOT NULL,
	Pavarde varchar (255) NOT NULL,
	Asmens_kodas int NOT NULL,
	Banko_saskaita varchar (255) NOT NULL,
	Pozicija integer NOT NULL,
	Lytis integer NOT NULL,
	fk_SPORTO_SALEid_SPORTO_SALE integer NOT NULL,
	fk_DARBO_SUTARTISid_DARBO_SUTARTIS integer NOT NULL,
	PRIMARY KEY(Asmens_kodas),
	FOREIGN KEY(Pozicija) REFERENCES POZICIJOS_TIPAI (id_POZICIJOS_TIPAS),
	FOREIGN KEY(Lytis) REFERENCES LYTYS (id_LYTIS),
	CONSTRAINT dirba FOREIGN KEY(fk_SPORTO_SALEid_SPORTO_SALE) REFERENCES SPORTO_SALES (id_SPORTO_SALE),
	CONSTRAINT pasiraso FOREIGN KEY(fk_DARBO_SUTARTISid_DARBO_SUTARTIS) REFERENCES DARBO_SUTARTYS (id_DARBO_SUTARTIS)
);

CREATE TABLE UZSAKYMAI
(
	Uzsakymo_id varchar (255) NOT NULL,
	Kiekis int NOT NULL,
	Data date NOT NULL,
	id_UZSAKYMAS integer NOT NULL,
	fk_SPORTO_SALEid_SPORTO_SALE integer NOT NULL,
	fk_IRANGAid_IRANGA integer NOT NULL,
	fk_GAMYKLAid_GAMYKLA integer NOT NULL,
	PRIMARY KEY(id_UZSAKYMAS),
	CONSTRAINT daro FOREIGN KEY(fk_SPORTO_SALEid_SPORTO_SALE) REFERENCES SPORTO_SALES (id_SPORTO_SALE),
	CONSTRAINT itraukia FOREIGN KEY(fk_IRANGAid_IRANGA) REFERENCES IRANGOS (id_IRANGA),
	CONSTRAINT siunciamas FOREIGN KEY(fk_GAMYKLAid_GAMYKLA) REFERENCES GAMYKLOS (id_GAMYKLA)
);

CREATE TABLE SPORTO_SUTARTYS
(
	Ar_galioja boolean NOT NULL,
	Trukme date NOT NULL,
	Kada_pasirasyta date NOT NULL,
	Ar_taikoma_nuolaida boolean NOT NULL,
	id_SPORTO_SUTARTIS integer NOT NULL,
	fk_SPORTO_SALEid_SPORTO_SALE integer NOT NULL,
	PRIMARY KEY(id_SPORTO_SUTARTIS),
	CONSTRAINT sudaro FOREIGN KEY(fk_SPORTO_SALEid_SPORTO_SALE) REFERENCES SPORTO_SALES (id_SPORTO_SALE)
);

CREATE TABLE TRANSPORTU_DEFEKTAI
(
	Defektas varchar (255) NOT NULL,
	Defekto_data varchar (255) NOT NULL,
	Sutvarkymo_data date NOT NULL,
	id_TRANSPORTO_DEFEKTAI integer NOT NULL,
	fk_TRANSPORTASid_TRANSPORTAS integer NOT NULL,
	PRIMARY KEY(id_TRANSPORTO_DEFEKTAI),
	CONSTRAINT turi FOREIGN KEY(fk_TRANSPORTASid_TRANSPORTAS) REFERENCES TRANSPORTAI (id_TRANSPORTAS)
);

CREATE TABLE ASMENYS
(
	Vardas varchar (255) NOT NULL,
	Pavarde varchar (255) NOT NULL,
	Asmens_kodas int NOT NULL,
	Banko_saskaita varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Telefono_numeris int NOT NULL,
	Lytis integer NOT NULL,
	fk_DARBUOTOJASAsmens_kodas int NOT NULL,
	fk_SPORTO_SUTARTISid_SPORTO_SUTARTIS integer NOT NULL,
	PRIMARY KEY(Asmens_kodas),
	FOREIGN KEY(Lytis) REFERENCES LYTYS (id_LYTIS),
	CONSTRAINT priima FOREIGN KEY(fk_DARBUOTOJASAsmens_kodas) REFERENCES DARBUOTOJAI (Asmens_kodas),
	CONSTRAINT rasosi FOREIGN KEY(fk_SPORTO_SUTARTISid_SPORTO_SUTARTIS) REFERENCES SPORTO_SUTARTYS (id_SPORTO_SUTARTIS),
	FOREIGN KEY(id_SPORTO_SALE) REFERENCES SPORTO_SALES (id_SPORTO_SALE)
);

CREATE TABLE TRANSPORTAI
(
	Marke varchar (255) NOT NULL,
	Modelis varchar (255) NOT NULL,
	Numeriai varchar (255) NOT NULL,
	Pagaminimo_data date NOT NULL,
	Tipas integer NOT NULL,
	id_TRANSPORTAS integer NOT NULL,
	fk_DARBUOTOJASAsmens_kodas int NOT NULL,
	PRIMARY KEY(id_TRANSPORTAS),
	FOREIGN KEY(Tipas) REFERENCES TRANSPORTO_PRIEMONIU_TIPAI (id_TRANSPORTO_PRIEMONES_TIPAS),
	CONSTRAINT vairuoja FOREIGN KEY(fk_DARBUOTOJASAsmens_kodas) REFERENCES DARBUOTOJAI (Asmens_kodas)
);
