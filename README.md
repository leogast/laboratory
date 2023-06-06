# Laboratory - Assembly
## Final Project - Computer Systems (Assembly)

Laboration 1

Instruktioner

I den här laborationen kommer ni utgå från en till viss del färdig källkodsfil där vissa av instruktionerna ersatts av kommentarer om vilka typ av operation som behöver utföras. Ni ska skriva den assemblerinstruktion som hör till respektive kommentar så att programmet fungerar. De instruktioner som ni behöver finns beskrivna under Nios II direktiv och instruktioner.

Därtill finns hela listan över instruktioner tillgänglig på kurshemsidan. Huvudsaken är att uppgiften blir löst, inte att en specifik mängd instruktioner används.
Programmet som laddas ner på utvecklingskortet ska resultera i att de röda lysdioderna tänds och släcks i tur och ordning enligt följande schema (LEDRi står för den ite röda lysdioden):

[Tänd LEDR0] ⇒ [Paus] ⇒ [Släck LEDR0] ⇒ [Tänd LEDR1] ⇒ [Paus] ⇒ [Släck LEDR1] ⇒ ⋯ ⇒ [Släck LEDR17] ⇒ [Tänd LEDR0] ⇒ ⋯

De filer ni behöver för laborationen finns i en komprimerad fil som ni kan hämta här: lab1_student_DA-VT18.zip

Syfte

Syftet är att skapa en grundläggande förståelse för relationen mellan programkod och hårdvara.

Mål

Målet är att alla studenter ska kunna demonstrera ett fungerande program enligt uppgiftsbeskrivningen och kunna förklara vad de olika instruktionerna gör.

Krav för godkänt

För godkänt krävs
att ett korrekt program, som i tur och ordning tänder och släcker de röda lysdioderna på kortet, har laddats ner och körs på utvecklingskortet
att samtliga studenter i gruppen kan förklara de delar av koden som skrivits (inte nödvändigtvis den kod som redan fanns i källkodsfilen)
att handledaren har bedömt att (1) och (2) är uppfyllda
Genomförande

När ni kommer till laborationstillfället kommer varje grupp tilldelas ett utvecklingskit. Varje kartong innehåller ett utvecklingskort, en strömkabel samt en USB-kabel. Tänk på att det är ömtålig elektronik, så hantera dem varsamt. Skriv klart koden, kompilera och ladda ner programmet på kortet för att testa att den verkligen fungerar. Meddela handledaren genom att skriva namn på tavlan på anvisad plats. Genomförandet bedöms på plats och betygen förs in i iLearn under det aktuella laborationstillfället.

