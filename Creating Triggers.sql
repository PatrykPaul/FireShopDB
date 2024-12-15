CREATE TRIGGER Trig_AktualizujOpisGdyBrakProduktow
ON Sprzet_strazacki
AFTER UPDATE
AS
BEGIN
    UPDATE Sprzet_strazacki
    SET opis = 'Produkt niedost�pny w magazynie'
    WHERE ilosc_w_magazynie = 0
      AND id_sprzetu IN (SELECT id_sprzetu FROM inserted);
END;
GO

EXEC DodajProdukt 
    @nazwa = 'Ga�nica ABC 2kg',
    @typ = 'Ga�nica',
    @producent = 'FireEquip',
    @cena = 75.50,
    @ilosc_w_magazynie = 10,
    @opis = 'Ma�a ga�nica proszkowa.';

Select * from Sprzet_strazacki


EXEC AktualizujProdukt 
    @id_sprzetu = 8,
    @nazwa = 'Ga�nica ABC 2kg (Zaktualizowana)',
    @typ = 'Ga�nica',
    @producent = 'FireEquip Plus',
    @cena = 80.00,
    @ilosc_w_magazynie = 0,  
    @opis = 'Ulepszona ma�a ga�nica proszkowa.';



SELECT * FROM Sprzet_strazacki;



CREATE TRIGGER Trig_ZapiszHistoriaDodawania
ON Sprzet_strazacki
AFTER INSERT
AS
BEGIN
    INSERT INTO HistoriaDodawaniaProduktow (id_sprzetu, nazwa, typ, producent, cena, ilosc_w_magazynie, opis)
    SELECT id_sprzetu, nazwa, typ, producent, cena, ilosc_w_magazynie, opis
    FROM inserted;
END;
GO

EXEC DodajProdukt 
    @nazwa = 'Hydrant zewn�trzny DN80',
    @typ = 'Hydrant',
    @producent = 'HydroFire',
    @cena = 3500.00,
    @ilosc_w_magazynie = 5,
    @opis = 'Hydrant zewn�trzny DN80 do gaszenia po�ar�w w instalacjach przemys�owych. Wykonany z �eliwa sferoidalnego, odporny na wysokie ci�nienie.';


SELECT * FROM HistoriaDodawaniaProduktow;





