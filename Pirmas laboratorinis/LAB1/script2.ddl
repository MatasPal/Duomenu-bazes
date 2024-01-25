#@(#) script.ddl

DROP TABLE IF EXISTS Mokejimai;
DROP TABLE IF EXISTS Uzsakymo_prekes;
DROP TABLE IF EXISTS Saskaitos;
DROP TABLE IF EXISTS Pristatymo_mokesciai;
DROP TABLE IF EXISTS Pirkimo_sutartys;
DROP TABLE IF EXISTS Vadybininkai;
DROP TABLE IF EXISTS Pristatymai;
DROP TABLE IF EXISTS Prekes;
DROP TABLE IF EXISTS Pirkejai;
DROP TABLE IF EXISTS Uzsakymo_busenos;
DROP TABLE IF EXISTS Pristatymo_tarnybos;
DROP TABLE IF EXISTS Pristatymo_laikai;
DROP TABLE IF EXISTS Pristatymo_budai;
DROP TABLE IF EXISTS Prekiu_tipai;
DROP TABLE IF EXISTS Mokejimo_budai;
DROP TABLE IF EXISTS Tiekejai;
DROP TABLE IF EXISTS Parduotuves;
DROP TABLE IF EXISTS Garantiniai_aptarnavimai;
CREATE TABLE Garantiniai_aptarnavimai
(
	Taisyklos_telefono_numeris varchar (255) NOT NULL,
	Taisyklos_adresas varchar (255) NOT NULL,
	PRIMARY KEY(Taisyklos_telefono_numeris)
);

CREATE TABLE Parduotuves
(
	Elektroninio_pasto_adresas varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Telefono_numeris varchar (255) NOT NULL,
	Darbo_laikas varchar (255) NOT NULL,
	PRIMARY KEY(Elektroninio_pasto_adresas)
);

CREATE TABLE Tiekejai
(
	Telefono_numeris varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Prekes_kiekis int NOT NULL,
	PRIMARY KEY(Telefono_numeris)
);

CREATE TABLE Mokejimo_budai
(
	id_Mokejimo_budas integer NOT NULL,
	name char (18) NOT NULL,
	PRIMARY KEY(id_Mokejimo_budas)
);
INSERT INTO Mokejimo_budai(id_Mokejimo_budas, name) VALUES(1, 'Grynieji_pinigai');
INSERT INTO Mokejimo_budai(id_Mokejimo_budas, name) VALUES(2, 'Bankine_kortele');
INSERT INTO Mokejimo_budai(id_Mokejimo_budas, name) VALUES(3, 'Bankinis_pavedimas');

CREATE TABLE Prekiu_tipai
(
	id_Prekes_tipas integer NOT NULL,
	name char (22) NOT NULL,
	PRIMARY KEY(id_Prekes_tipas)
);
INSERT INTO Prekiu_tipai(id_Prekes_tipas, name) VALUES(1, 'Ismanusis_telefonas');
INSERT INTO Prekiu_tipai(id_Prekes_tipas, name) VALUES(2, 'Ismanusis_laikrodis');
INSERT INTO Prekiu_tipai(id_Prekes_tipas, name) VALUES(3, 'Ismanusis_televizorius');

CREATE TABLE Pristatymo_budai
(
	id_Pristatymo_budas integer NOT NULL,
	name char (24) NOT NULL,
	PRIMARY KEY(id_Pristatymo_budas)
);
INSERT INTO Pristatymo_budai(id_Pristatymo_budas, name) VALUES(1, 'Atsiemimas_parduotuveje');
INSERT INTO Pristatymo_budai(id_Pristatymo_budas, name) VALUES(2, 'Pristatymas_pagal_adresa');

CREATE TABLE Pristatymo_laikai
(
	id_Pristatymo_laikas integer NOT NULL,
	name char (20) NOT NULL,
	PRIMARY KEY(id_Pristatymo_laikas)
);
INSERT INTO Pristatymo_laikai(id_Pristatymo_laikas, name) VALUES(1, 'Greitas_1-2_d.d.');
INSERT INTO Pristatymo_laikai(id_Pristatymo_laikas, name) VALUES(2, 'Ilgas_2-4_d.d.');
INSERT INTO Pristatymo_laikai(id_Pristatymo_laikas, name) VALUES(3, 'Labai_ilgas_4-6_d.d.');

CREATE TABLE Pristatymo_tarnybos
(
	id_Pristatymo_tarnyba integer NOT NULL,
	name char (15) NOT NULL,
	PRIMARY KEY(id_Pristatymo_tarnyba)
);
INSERT INTO Pristatymo_tarnybos(id_Pristatymo_tarnyba, name) VALUES(1, 'DPD');
INSERT INTO Pristatymo_tarnybos(id_Pristatymo_tarnyba, name) VALUES(2, 'Lietuvos_pastas');
INSERT INTO Pristatymo_tarnybos(id_Pristatymo_tarnyba, name) VALUES(3, 'Omniva');

CREATE TABLE Uzsakymo_busenos
(
	id_Uzsakymo_busena integer NOT NULL,
	name char (9) NOT NULL,
	PRIMARY KEY(id_Uzsakymo_busena)
);
INSERT INTO Uzsakymo_busenos(id_Uzsakymo_busena, name) VALUES(1, 'Pateiktas');
INSERT INTO Uzsakymo_busenos(id_Uzsakymo_busena, name) VALUES(2, 'Vykdomas');
INSERT INTO Uzsakymo_busenos(id_Uzsakymo_busena, name) VALUES(3, 'Ivykdytas');
INSERT INTO Uzsakymo_busenos(id_Uzsakymo_busena, name) VALUES(4, 'Atsauktas');

CREATE TABLE Pirkejai
(
	Telefono_numeris varchar (255) NOT NULL,
	Vardas varchar (255) NOT NULL,
	Pavarde varchar (255) NOT NULL,
	Elektroninio_pasto_adresas varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Mokejimo_budas integer NOT NULL,
	PRIMARY KEY(Telefono_numeris),
	FOREIGN KEY(Mokejimo_budas) REFERENCES Mokejimo_budai (id_Mokejimo_budas)
);

CREATE TABLE Prekes
(
	Kodas varchar (255) NOT NULL,
	Pilnas_pavadinimas varchar (255) NOT NULL,
	Pagaminimo_metai int NOT NULL,
	Garantinis_laikotarpis varchar (255) NOT NULL,
	Kiekis int NOT NULL,
	fk_TiekejasTelefono_numeris varchar (255) NOT NULL,
	fk_Garantinis_aptarnavimasTaisyklos_telefono_numeris varchar (255) NOT NULL,
	PRIMARY KEY(Kodas),
	CONSTRAINT uzsakoma FOREIGN KEY(fk_TiekejasTelefono_numeris) REFERENCES Tiekejai (Telefono_numeris),
	CONSTRAINT gauna FOREIGN KEY(fk_Garantinis_aptarnavimasTaisyklos_telefono_numeris) REFERENCES Garantiniai_aptarnavimai (Taisyklos_telefono_numeris)
);

CREATE TABLE Pristatymai
(
	Telefono_numeris varchar (255) NOT NULL,
	Adresas varchar (255) NOT NULL,
	Pristatymo_mokestis double precision NOT NULL,
	Elektroninio_pasto_adresas varchar (255) NOT NULL,
	Pristatymo_tarnyba integer NOT NULL,
	Pristatymo_laikas integer NOT NULL,
	PRIMARY KEY(Telefono_numeris),
	FOREIGN KEY(Pristatymo_tarnyba) REFERENCES Pristatymo_tarnybos (id_Pristatymo_tarnyba),
	FOREIGN KEY(Pristatymo_laikas) REFERENCES Pristatymo_laikai (id_Pristatymo_laikas)
);

CREATE TABLE Vadybininkai
(
	Telefono_numeris varchar (255) NOT NULL,
	Vardas varchar (255) NOT NULL,
	Pavarde varchar (255) NOT NULL,
	Elektroninio_pasto_adresas varchar (255) NOT NULL,
	fk_ParduotuveElektroninio_pasto_adresas varchar (255) NOT NULL,
	fk_TiekejasTelefono_numeris varchar (255) NOT NULL,
	fk_ParduotuveElektroninio_pasto_adresas1 varchar (255) NOT NULL,
	PRIMARY KEY(Telefono_numeris),
	UNIQUE(fk_ParduotuveElektroninio_pasto_adresas),
	FOREIGN KEY(fk_ParduotuveElektroninio_pasto_adresas) REFERENCES Parduotuves (Elektroninio_pasto_adresas),
	CONSTRAINT kontaktuoja FOREIGN KEY(fk_TiekejasTelefono_numeris) REFERENCES Tiekejai (Telefono_numeris),
	CONSTRAINT atstovauja FOREIGN KEY(fk_ParduotuveElektroninio_pasto_adresas1) REFERENCES Parduotuves (Elektroninio_pasto_adresas)
);

CREATE TABLE Pirkimo_sutartys
(
	Sutarties_data date NOT NULL,
	Uzsakymo_numeris int NOT NULL,
	Krepselio_suma decimal NOT NULL,
	Uzsakymo_busena integer NOT NULL,
	Preke integer NOT NULL,
	Mokejimo_budas integer NOT NULL,
	Prekes_pristatymo_budas integer NOT NULL,
	fk_PirkejasTelefono_numeris varchar (255) NOT NULL,
	fk_VadybininkasTelefono_numeris varchar (255) NOT NULL,
	fk_PrekeKodas varchar (255) NOT NULL,
	fk_PristatymasTelefono_numeris varchar (255) NOT NULL,
	fk_VadybininkasTelefono_numeris1 varchar (255) NOT NULL,
	fk_PirkejasTelefono_numeris1 varchar (255) NOT NULL,
	UNIQUE(fk_PirkejasTelefono_numeris),
	UNIQUE(fk_VadybininkasTelefono_numeris),
	UNIQUE(fk_PrekeKodas),
	PRIMARY KEY(Sutarties_data, Uzsakymo_numeris),
	FOREIGN KEY(Uzsakymo_busena) REFERENCES Uzsakymo_busenos (id_Uzsakymo_busena),
	FOREIGN KEY(Preke) REFERENCES Prekiu_tipai (id_Prekes_tipas),
	FOREIGN KEY(Mokejimo_budas) REFERENCES Mokejimo_budai (id_Mokejimo_budas),
	FOREIGN KEY(Prekes_pristatymo_budas) REFERENCES Pristatymo_budai (id_Pristatymo_budas),
	FOREIGN KEY(fk_PirkejasTelefono_numeris) REFERENCES Pirkejai (Telefono_numeris),
	FOREIGN KEY(fk_VadybininkasTelefono_numeris) REFERENCES Vadybininkai (Telefono_numeris),
	FOREIGN KEY(fk_PrekeKodas) REFERENCES Prekes (Kodas),
	CONSTRAINT priskiria FOREIGN KEY(fk_PristatymasTelefono_numeris) REFERENCES Pristatymai (Telefono_numeris),
	CONSTRAINT patvirtina FOREIGN KEY(fk_VadybininkasTelefono_numeris1) REFERENCES Vadybininkai (Telefono_numeris),
	CONSTRAINT sukuria FOREIGN KEY(fk_PirkejasTelefono_numeris1) REFERENCES Pirkejai (Telefono_numeris)
);

CREATE TABLE Pristatymo_mokesciai
(
	id_Pristatymo_mokestis integer NOT NULL,
	Kaina decimal NOT NULL,
	fk_PristatymasTelefono_numeris varchar (255) NOT NULL,
	PRIMARY KEY(id_Pristatymo_mokestis),
	CONSTRAINT skiriama_uz FOREIGN KEY(fk_PristatymasTelefono_numeris) REFERENCES Pristatymai (Telefono_numeris)
);

CREATE TABLE Saskaitos
(
	id_Saskaita integer NOT NULL,
	Data date NOT NULL,
	Suma decimal NOT NULL,
	fk_Pirkimo_sutartisSutarties_data date NOT NULL,
	fk_Pirkimo_sutartisUzsakymo_numeris int NOT NULL,
	PRIMARY KEY(id_Saskaita),
	CONSTRAINT israso FOREIGN KEY(fk_Pirkimo_sutartisSutarties_data, fk_Pirkimo_sutartisUzsakymo_numeris) REFERENCES Pirkimo_sutartys (Sutarties_data, Uzsakymo_numeris)
);

CREATE TABLE Uzsakymo_prekes
(
	id_Uzsakymo_preke integer NOT NULL,
	Kiekis int NOT NULL,
	fk_Pirkimo_sutartisSutarties_data date NOT NULL,
	fk_Pirkimo_sutartisUzsakymo_numeris int NOT NULL,
	fk_PrekeKodas varchar (255) NOT NULL,
	PRIMARY KEY(id_Uzsakymo_preke),
	CONSTRAINT Itraukia FOREIGN KEY(fk_Pirkimo_sutartisSutarties_data, fk_Pirkimo_sutartisUzsakymo_numeris) REFERENCES Pirkimo_sutartys (Sutarties_data, Uzsakymo_numeris),
	CONSTRAINT apibudina FOREIGN KEY(fk_PrekeKodas) REFERENCES Prekes (Kodas)
);

CREATE TABLE Mokejimai
(
	id_Mokejimas integer NOT NULL,
	Data date NOT NULL,
	Suma decimal NOT NULL,
	fk_PirkejasTelefono_numeris varchar (255) NOT NULL,
	fk_Saskaitaid_Saskaita integer NOT NULL,
	PRIMARY KEY(id_Mokejimas),
	CONSTRAINT atlieka FOREIGN KEY(fk_PirkejasTelefono_numeris) REFERENCES Pirkejai (Telefono_numeris),
	CONSTRAINT formuoja FOREIGN KEY(fk_Saskaitaid_Saskaita) REFERENCES Saskaitos (id_Saskaita)
);
