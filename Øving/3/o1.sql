
-- ENTITETS-TABELLER
CREATE TABLE Film
(
    FilmID INTEGER NOT NULL PRIMARY KEY,
    Tittel VARCHAR,
    Produksjonsaar INTEGER,
    RegissørID INTEGER
);
CREATE TABLE Sjanger
(
    SjangerID INTEGER NOT NULL PRIMARY KEY,
    Navn VARCHAR,
    Beskrivelse VARCHAR
);
CREATE TABLE Skuespiller
(
    SkuespillerID INTEGER NOT NULL PRIMARY KEY,
    Navn VARCHAR,
    Fødselsaar INTEGER
);
CREATE TABLE Regissør
(
    RegissørID INTEGER NOT NULL PRIMARY KEY,
    Navn VARCHAR
);
-- RELASJONS-TABELLER
CREATE TABLE SjangerForFilm
(
    FOREIGN KEY (FilmID) 
        REFERENCES Film(FilmID)
        ON DELETE CASCADE,
    FOREIGN Key (SjangerID) 
        REFERENCES Sjanger(SjangerID)
        ON DELETE CASCADE
)
CREATE TABLE SkuespillerIFIlm
(
    FOREIGN KEY (FilmID) 
        REFERENCES Film(FilmID)
        ON DELETE CASCADE,
    FOREIGN Key (SkuespillerID) 
        REFERENCES Skuespiller(SkuespillerID)
        ON DELETE CASCADE,
    Rolle VARCHAR
)
-- DEL C
INSERT INTO Regissør
    (RegissørID,Navn)
VALUES
    (1, "Peyton Reed"),
    (2, "Tom Shadyac");
INSERT INTO Film
    (FilmID,Navn,Produksjonsaar, RegissørID)
VALUES
    (1, 'Yes Man', 2008, 1);
INSERT INTO Skuespiller
    (SkuespillerID,Navn,Fødselsaar)
VALUES
    (1, 'Jim Carrey', 1962);
INSERT INTO SkuespillerIFIlm
    (FilmID,SkuespillerID)
VALUES
    (1, 1, "Carl")
-- Del D
UPDATE Skuespiller
SET Navn = "Jim Eugene Carrey"
WHERE SkuespillerID = 1;
-- Skriv en SQL-setning som sletter Tom Shadyac fra databasen.
DELETE Regissør
WHERE RegissørID = 2;
select film.Tittel
from film join skuespillerifilm on skuespillerifilm.FilmID = film.FilmID join skuespiller on skuespiller.SkuespillerID = skuespillerifilm.SkuespillerID join regissør on regissør.RegissørID = film.RegissørID
where regissør.Navn = skuespiller.Navn;
SELECT s.Navn
FROM skuespiller s JOIN skuespillerifilm sif ON sif.SkuespillerID = s.SkuespillerID
WHERE sif.FilmID = 3 AND sif.SkuespillerID NOT IN 
        (SELECT s.skuespillerID
    FROM skuespiller s JOIN skuespillerifilm sif ON sif.SkuespillerID = s.SkuespillerID
    WHERE sif.FilmID = 2);
Select f.tittel, f.filmID, avg(s.fødselsår) as GjennomsnittligFødselsåriFilm
from film f inner join skuespillerifilm sif on sif.filmID = f.filmID inner join skuespiller s on sif.skuespillerID = s.skuespillerID
group by (f.filmID)
having GjennomsnittligFødselsåriFilm > (Select avg(skuespiller.fødselsår)
from skuespiller);