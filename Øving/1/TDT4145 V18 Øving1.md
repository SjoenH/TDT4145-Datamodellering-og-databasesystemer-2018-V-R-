# TDT4145 - Datamodellering og databasesystemer Øving 1

Læringsmål for denne øvingen er å:

* Forstå formålet og noen egenskaper med databasesystemer.
* Forstå og designe enkle entity-relationship-modeller.

## Oppgave 1: Databasesystemer

a) Forklar kort og overordnet hva en database (DB) og et databasehåndteringssystem
(DBMS) er.

Database: Organisert sett med data. _Layman terms_: Det man lagrer.
Databasehåndteringssystem: Det som håndtere databasen. Gir gjerne tilgang til databasen via et api. Gjerne SQL. Eksempler: mySQL, PostgreSql, MongoDB (NOSQL).

b) En database og et databasehåndteringssystem kan man tenke seg til sammen utgjør et databasesystem . Det er mange fordeler ved å bruke et databasesystem i motsetning til tradisjonelle filsystemer der hver brukergruppe selv tar hånd om egne filer for å behandle lagring av data. Forklar nærmere hva som menes med følgende tre egenskaper og hvilke fordeler det medfører:

### Program-data uavhengighet

![DB, DBMS and API](http://itknowledgeexchange.techtarget.com/overheard/files/2015/01/DBMS-database-management-system.png)

Databasen er ikke avhengig av programmet. Programmet kobles opp til database via et api inn til DBMS. Muligjør for eks. at flere ulike programmer kan bruke samme database.

### Flerbrukersstøtte

Mulig å ha ulike brukere med forskjellig tilgang til databasen. Hensikt? => beskytte og begrense data osv.

### Selvbeskrivende

Databasen bør være strukturert slik at den er intuitiv i forstålse. Altså at man få en ganske god forståelse av miniverden ved å se på databasestrukturen. Navn bør være forståelige osv.

## Oppgave 2: ER-modellen

### a) Forklar

#### Forskjellen på en entitet og en entitetsklasse

Entitetsklasse beskriver en entitet. Entiteten er et objekt av klassen.

#### Forskjellen på en relasjon og en relasjonsklasse

Relasjonsklasse beskriver en relasjon. Relasjonen er et objekt av klassen.

#### Hvorfor alle entiteter må ha et eller flere nøkkelattributt

Slik at vi kan referere til og skille entiteter fra hverandre.

### Betrakt ER-modellen under og avgjør om følgende utsagn kan stemme. For hvert utsagn skal du svare “true”, “false” eller “maybe” og gi en kort begrunnelse for svaret ditt. Fyll svarene dine inn i tabellen

| Påstand                                                                                                          | Svar  | Begrunnelse                               |
| ---------------------------------------------------------------------------------------------------------------- | ----- | ----------------------------------------- |
| Taco er en entitetsklasse og hver enkelt instans av en taco identifiseres ved hjelp av nøkkelattributtet TacoID. | true  |                                           |
| En taco kan inneholde et vilkårlig antall kjøttdeiger, oster, grønnsaker og sauser.                              | true  | (0,n)                                     |
| En ordre gjort av en kunde trenger ikke inneholde noen taco.                                                     | false | (1,n) Minst én.                           |
| En ordre gjort av en kunde kan inneholde en million tacoer.                                                      | true  | n                                         |
| Så fort en ordre er opprettet kan den hentes i en vilkårlig butikk.                                              | false | i den butikken som er bestemt i ordren.   |
| En kunde kan eksistere i systemet uten noensinne å ha bestilt noen tacoer.                                       | true  | (0,n)                                     |
| Hver eneste grønnsak-entitet har en vekt.                                                                        | true  |                                           |
| En ansatt kan jobbe i ulike butikker med ulike stillingstitler.                                                  | true  | stillingstittel i jobber-relasjonsklassen |
| Alle ordre delegeres typisk til denne samme personen som er ansatt.                                              | false | umulig å si?                              |
| En kunde må være registrert med et navn.                                                                         | true  | Entiteten er ikke svak                    |

## Oppgave 3: Svake klasser, forekomstdiagram og nye krav

### Over ser du et eksempel på en svak klasse. Når kan det være hensiktsmessig med svake klasser? Forklar hva i modellen over som er identifiserende entitetsklasse, identifiserende relasjonsklasse og delvis nøkkel

Det kan være hensiktsmessig med svake klasser når man

**identifiserende entitetsklasse**:
**identifiserende relasjonsklasse**:
**delvis nøkkel**:

### Hva skjer hvis kardinaliteten fra Kinosal til Kinosenter er (0,1) eller (1,n)? Kan vi fortsatt modelle Kinosal som svak? Hvorfor eller hvorfor ikke?

### Utvid ER-modellen til å ta høyde for at en sal kan godkjennes for et vilkårlig antall filmer. Det er nemlig ikke alle saler som kan vise alle filmer. For eksempel krever 3D-filmer spesielle skjermer som kun finnes i noen saler. En film har et unikt filmnummer, en tittel og en varighet. En film kan ikke ha noen begrensning i antall saler den kan godkjennes for. Skriv ned eventuelle antagelser du finner det nødvendig å gjøre.

### Anta at vi nå har en database realisert med ER-diagrammet ditt og med følgende data

* To kinosentere (KS1 og KS2).
* KS1 har kun en sal (S1), KS2 har to saler (S2 og S3).
* Vi har to filmer i databasen: Matban Begins (MB) og Yes Summer (YS). MB er
  godkjent for alle de tre salene, YS er kun godkjent for S1. Tegn et forekomstdiagram for denne databasetilstanden.

e) Utvid modellen til å ta høyde for oppsett av filmfremvisninger og tilhørende billetter:
En oppsetning av en film er knyttet til en bestemt kinosal og må ha en dato og et tidspunkt for når filmen starter. Hver oppsatt film skal få et eget serienummer som er unikt blant alle kinosentere i systemet.
Kinosenteret ønsker også å vite hvor mange billetter som selges og hvor mye som tjenes til en bestemt fremvisning. En billett til en oppsatt film trenger et setenummer og har en pris. Det skal også registreres hvilket tidspunkt billetten ble kjøpt.
Skriv ned eventuelle antagelser du finner det nødvendig å gjøre.

## Oppgave 4: Fra miniverden til ER-modell

Fjernheim borettslag skal for tiden digitalisere sin virksomhet. Strukturen deres trengs derfor å beskrives med en passende ER-modell.
Ansatte, beboere og boligeiere må registreres i systemet. Disse registreres med personnummer, fullt navn, telefon, e-post og type. Type kan typisk være beboer, boligeier, vaktmester, renholdsarbeider eller lignende.
Borettslaget består av et antall bygg. Hvert bygg har et unikt gårdsnummer, en gateadresse og et byggeår. I hvert bygg er det et antall leiligheter. Disse har en egen ID som er unikt for borettslaget. Hver leilighet har også et leilighetsnummer (som implisitt beskriver etasje og oppgang) og en kvadratmeterstørrelse. Leiligheten eies av en eller flere personer med en eierprosent, og i leiligheten bor det null eller flere personer. For hver leilighet trenger vi å vite hvem som bor i og eier leiligheten.
Hver leilighet kan følge med et antall boder i kjelleren. Bodene har en størrelse og et unikt nummer internt i borettslaget. Noen få boder har i tillegg mulighet for strømuttak.
I borettslaget har man et styre med en unik ID. Styret må minimum bestå av en leder. For hver person i styret trenger vi å registrere den tilhørende oppgaven den personen har ansvaret for. En person kan ikke ha ansvar for flere oppgaver i styret.

Styret behandler saker. En sak har et saksnummer og en beskrivelse. En slik sak kan være knyttet til et bygg, en leilighet eller en person i borettslaget, men trenger ikke nødvendigvis å være det.
Lag et ER-diagram som beskriver dette borettslaget. Skriv ned eventuelle antagelser du finner det nødvendig å gjøre.
