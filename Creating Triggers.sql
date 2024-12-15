CREATE TRIGGER Trig_AktualizujOpisGdyBrakProduktow
ON Sprzet_strazacki
AFTER UPDATE
AS
BEGIN
    UPDATE Sprzet_strazacki
    SET opis = 'Produkt niedostêpny w magazynie'
    WHERE ilosc_w_magazynie = 0
      AND id_sprzetu IN (SELECT id_sprzetu FROM inserted);
END;
GO

EXEC DodajProdukt 
    @nazwa = 'Gaœnica ABC 2kg',
    @typ = 'Gaœnica',
    @producent = 'FireEquip',
    @cena = 75.50,
    @ilosc_w_magazynie = 10,
    @opis = 'Ma³a gaœnica proszkowa.';

Select * from Sprzet_strazacki


EXEC AktualizujProdukt 
    @id_sprzetu = 8,
    @nazwa = 'Gaœnica ABC 2kg (Zaktualizowana)',
    @typ = 'Gaœnica',
    @producent = 'FireEquip Plus',
    @cena = 80.00,
    @ilosc_w_magazynie = 0,  
    @opis = 'Ulepszona ma³a gaœnica proszkowa.';



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
    @nazwa = 'Hydrant zewnêtrzny DN80',
    @typ = 'Hydrant',
    @producent = 'HydroFire',
    @cena = 3500.00,
    @ilosc_w_magazynie = 5,
    @opis = 'Hydrant zewnêtrzny DN80 do gaszenia po¿arów w instalacjach przemys³owych. Wykonany z ¿eliwa sferoidalnego, odporny na wysokie ciœnienie.';


SELECT * FROM HistoriaDodawaniaProduktow;





