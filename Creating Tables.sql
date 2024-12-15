CREATE TABLE Sprzet_strazacki (
    id_sprzetu INT PRIMARY KEY IDENTITY(1,1),
    nazwa VARCHAR(100) NOT NULL,
    typ VARCHAR(50),
    producent VARCHAR(100),
    cena DECIMAL(10, 2),
    ilosc_w_magazynie INT,
    opis TEXT
);

CREATE TABLE Klienci (
    id_klienta INT PRIMARY KEY IDENTITY(1,1),
    nazwa_klienta VARCHAR(100),
    adres VARCHAR(255),
    numer_telefonu VARCHAR(20),
    typ_klienta VARCHAR(50)
);

CREATE TABLE Zamowienia (
    id_zamowienia INT PRIMARY KEY IDENTITY(1,1),
    data_zamowienia DATE NOT NULL,
    status VARCHAR(50),
    id_klienta INT,
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta)
);

CREATE TABLE Produkty_w_Zamowieniu (
    id_produktu_w_zamowieniu INT PRIMARY KEY IDENTITY(1,1),
    id_zamowienia INT,
    id_sprzetu INT,
    ilosc INT,
    cena_za_sztuke DECIMAL(10, 2),
    FOREIGN KEY (id_zamowienia) REFERENCES Zamowienia(id_zamowienia),
    FOREIGN KEY (id_sprzetu) REFERENCES Sprzet_strazacki(id_sprzetu)
);

CREATE TABLE Dostawcy (
    id_dostawcy INT PRIMARY KEY IDENTITY(1,1),
    nazwa_dostawcy VARCHAR(100),
    adres VARCHAR(255),
    numer_telefonu VARCHAR(20)
);

CREATE TABLE Dostawy (
    id_dostawy INT PRIMARY KEY IDENTITY(1,1),
    id_dostawcy INT,
    id_sprzetu INT,
    data_dostawy DATE,
    ilosc_dostarczona INT,
    FOREIGN KEY (id_dostawcy) REFERENCES Dostawcy(id_dostawcy),
    FOREIGN KEY (id_sprzetu) REFERENCES Sprzet_strazacki(id_sprzetu)
);


CREATE TABLE HistoriaDodawaniaProduktow (
    id_historia INT PRIMARY KEY IDENTITY(1,1),
    id_sprzetu INT,
    nazwa VARCHAR(100),
    typ VARCHAR(50),
    producent VARCHAR(100),
    cena DECIMAL(10, 2),
    ilosc_w_magazynie INT,
    opis TEXT,
    data_dodania DATETIME DEFAULT GETDATE()
);

ALTER TABLE Sprzet_strazacki
ALTER COLUMN opis VARCHAR(MAX);
