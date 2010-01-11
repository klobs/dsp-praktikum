;Rahmenprogramm Start
;Initialisierung

ORG	P:$000;
INCLUDE butterfly.asm;

;Schritt 1: Outputadressen einstellen

MOVEC 	$00C,R2; Frage: wie wird hier der X, bzw Y Speicher angegeben?
MOVEC 	$00F,R5;

;Schritt 2: Input Adressen vorgeben
MOVEC 	$000,R1;
MOVEC 	$006,R4;

;Schritt 3: Twiddlefaktor justieren

MOVEC 	$1,X0;
MOVEC 	$0,Y0;

;Schritt 4: Grundschritt aufrufen

JSR 	GRUNDSCHRITT;

;Schritt 5: Ergebnisse sichern

MOVEC	(R2), $000;
MOVEC	(R5), $006;

;Schritt 6: Neue Input Adressen vorgeben
MOVEC	$003,R1;
MOVEC	$00F,R4;

;Schritt 7: Grundschritt aufrufen

JSR	GRUNDSCHRITT;

;Schritt 8: Ergebnisse sichern

MOVEC 	(R2), $003;
MOVEC 	(R5), $00F;

;Schritt 9: Inputadressen vorgeben

MOVEC	$000, R1;
MOVEC	$003, R4;

;Schritt 10: Grundschritt aufrufen

JSR	GRUNDSCHRITT;

;Schritt 11: Ergebnisse sichern

MOVEC	(R2), $000;
MOVEC	(R5), $003;

;Schritt 12: Twiddlefaktor anpassen

MOVEC	$0, X0;
MOVEC	-1, Y0;

;Schritt 13: Inputadressen Vorgeben

MOVEC	$006,R1;
MOVEC	$009,R4;

;Schritt 14: Grundschritt aufrufen

JSR 	GRUNDSCHRITT;

;Schritt 15: Ergebnisse sichern

MOVEC	(R2), $006;
MOVEC	(R2), $009;

;ENDE
