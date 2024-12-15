CREATE VIEW Widok_Sprzet
AS
SELECT 
    id_sprzetu,
    nazwa,
    typ,
    producent,
    cena,
    ilosc_w_magazynie,
    opis
FROM 
    Sprzet_strazacki;
GO


CREATE VIEW Widok_Produkty_Przypisania
AS
SELECT 
    s.id_sprzetu,
    s.nazwa,
    COALESCE(z.id_zamowienia, NULL) AS id_zamowienia,
    COALESCE(d.id_dostawy, NULL) AS id_dostawy,
    COALESCE(z.ilosc, 0) AS ilosc_w_zamowieniu,
    COALESCE(d.ilosc_dostarczona, 0) AS ilosc_w_dostawie
FROM 
    Sprzet_strazacki s
LEFT JOIN Produkty_w_Zamowieniu z
    ON s.id_sprzetu = z.id_sprzetu
LEFT JOIN Dostawy d
    ON s.id_sprzetu = d.id_sprzetu;
GO


SELECT * 
FROM sys.views;


SELECT * FROM Widok_Sprzet;


SELECT * FROM Widok_Produkty_Przypisania;
