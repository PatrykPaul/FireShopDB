CREATE PROCEDURE DodajProdukt
    @nazwa VARCHAR(100),
    @typ VARCHAR(50),
    @producent VARCHAR(100),
    @cena DECIMAL(10, 2),
    @ilosc_w_magazynie INT,
    @opis TEXT
AS
BEGIN
    INSERT INTO Sprzet_strazacki (nazwa, typ, producent, cena, ilosc_w_magazynie, opis)
    VALUES (@nazwa, @typ, @producent, @cena, @ilosc_w_magazynie, @opis);
END;
GO


CREATE PROCEDURE AktualizujProdukt
    @id_sprzetu INT,
    @nazwa VARCHAR(100),
    @typ VARCHAR(50),
    @producent VARCHAR(100),
    @cena DECIMAL(10, 2),
    @ilosc_w_magazynie INT,
    @opis TEXT
AS
BEGIN
    UPDATE Sprzet_strazacki
    SET 
        nazwa = @nazwa,
        typ = @typ,
        producent = @producent,
        cena = @cena,
        ilosc_w_magazynie = @ilosc_w_magazynie,
        opis = @opis
    WHERE id_sprzetu = @id_sprzetu;
END;
GO


CREATE PROCEDURE UsunProdukt
    @id_sprzetu INT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Produkty_w_Zamowieniu 
        WHERE id_sprzetu = @id_sprzetu
    )
    BEGIN
        PRINT 'Nie mo¿na usun¹æ produktu, poniewa¿ jest przypisany do zamówieñ.';
        RETURN;
    END;

    IF EXISTS (
        SELECT 1 
        FROM Dostawy 
        WHERE id_sprzetu = @id_sprzetu
    )
    BEGIN
        PRINT 'Nie mo¿na usun¹æ produktu, poniewa¿ jest przypisany do dostaw.';
        RETURN;
    END;

    DELETE FROM Sprzet_strazacki
    WHERE id_sprzetu = @id_sprzetu;

    PRINT 'Produkt zosta³ usuniêty.';
END;
GO

SELECT name AS NazwaProcedury
FROM sys.objects
WHERE type = 'P';



EXEC DodajProdukt 
    @nazwa = 'Gaœnica ABC 6kg',
    @typ = 'Gaœnica',
    @producent = 'FireEquip',
    @cena = 120.50,
    @ilosc_w_magazynie = 50,
    @opis = 'Gaœnica proszkowa przeznaczona do gaszenia po¿arów klasy A, B i C.';



EXEC AktualizujProdukt 
    @id_sprzetu = 1,
    @nazwa = 'Gaœnica ABC 6kg (Nowa wersja)',
    @typ = 'Gaœnica',
    @producent = 'FireEquip Plus',
    @cena = 130.00,
    @ilosc_w_magazynie = 45,
    @opis = 'Ulepszona gaœnica proszkowa z lepsz¹ wydajnoœci¹.';



EXEC UsunProdukt 
    @id_sprzetu = 11;

