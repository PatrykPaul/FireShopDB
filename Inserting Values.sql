INSERT INTO Sprzet_strazacki (nazwa, typ, producent, cena, ilosc_w_magazynie, opis)
VALUES
('Pompa po�arnicza', 'Pompa', 'WaterMaster', 5000.00, 5, 'Pompa do t�oczenia du�ych ilo�ci wody podczas akcji'),
('Drabina teleskopowa', 'Drabina', 'LadderTech', 1200.00, 10, 'Drabina teleskopowa o d�ugo�ci 15m'),
('Aparat oddechowy', 'Aparat', 'AirSafe', 2000.00, 15, 'Aparat oddechowy dla stra�ak�w w strefach zagro�enia'),
('R�kawice ochronne', 'R�kawice', 'FireGear', 150.00, 50, 'R�kawice odporne na wysokie temperatury'),
('Buty stra�ackie', 'Buty', 'SafetyStep', 600.00, 30, 'Specjalistyczne buty stra�ackie o wysokiej odporno�ci na ogie�'),
('Ga�nica wodna', 'Ga�nica', 'FireMaster', 180.00, 40, 'Ga�nica wodna do u�ytku wewn�trznego'),
('W�� stra�acki 30m', 'W��', 'HoseMaster', 300.00, 20, 'W�� stra�acki o d�ugo�ci 30m');


--SELECT * FROM Sprzet_strazacki

INSERT INTO Klienci (nazwa_klienta, adres, numer_telefonu, typ_klienta)
VALUES
('OSP Giedlarowa', 'ul. Stra�acka 10, Giedlarowa', '172237001', 'Jednostka OSP'),
('OSP Brz�za Kr�lewska', 'ul. G��wna 25, Brz�za Kr�lewska', '172237002', 'Jednostka OSP'),
('OSP Grodzisko Dolne', 'ul. Centralna 8, Grodzisko Dolne', '172237003', 'Jednostka OSP'),
('PSP Le�ajsk', 'ul. Kwiatowa 15, Le�ajsk', '172237004', 'Jednostka PSP'),
('OSP Biedacz�w', 'ul. Stra�acka 5, Biedacz�w', '172237005', 'Jednostka OSP');



INSERT INTO Zamowienia (data_zamowienia, status, id_klienta)
VALUES
('2022-11-15', 'W trakcie', 1),
('2022-10-19', 'Zrealizowane', 2),
('2021-11-22', 'Nowe', 3),
('2021-10-21', 'W trakcie', 4),
('2020-11-02', 'Anulowane', 5);



INSERT INTO Produkty_w_Zamowieniu (id_zamowienia, id_sprzetu, ilosc, cena_za_sztuke)
VALUES
(1, 1, 2, 5000.00),
(1, 2, 1, 1200.00),
(2, 3, 3, 2000.00),
(3, 4, 10, 150.00),
(4, 5, 5, 600.00),
(5, 6, 4, 180.00),
(5, 7, 2, 300.00);



INSERT INTO Dostawcy (nazwa_dostawcy, adres, numer_telefonu)
VALUES
('FireTech Solutions', 'ul. Techniczna 8, Warszawa', '987123654'),
('ProFire Supplies', 'ul. Zaopatrzeniowa 22, Szczecin', '654321987'),
('MegaSafety Equipments', 'ul. Bezpieczna 42, Pozna�', '321789654'),
('SafetyPlus Distributors', 'ul. Dostawcza 5, Krak�w', '789456123');



INSERT INTO Dostawy (id_dostawcy, id_sprzetu, data_dostawy, ilosc_dostarczona)
VALUES
(1, 1, '2024-11-27', 20),
(2, 2, '2024-11-28', 10),
(3, 3, '2024-11-29', 5),
(4, 4, '2024-12-01', 15),
(1, 5, '2024-12-02', 25),
(2, 6, '2024-12-03', 30),
(3, 7, '2024-12-04', 10);


