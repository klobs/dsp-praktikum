;Rahmenprogramm Start
;Initialisierung

ORG	P:$100;
INCLUDE butterfly.asm; Problem: das Programm laeuft 
					 ; noch ab der falschen stelle los!!

;Schritt 1: Outputadressen einstellen

MOVE 	#$00C,R2; Frage: wie wird hier der X, bzw Y Speicher angegeben?
MOVE 	#$00F,R5;

;Schritt 2: Input Adressen vorgeben
MOVE 	#$000,R1;
MOVE 	#$006,R4;

;Schritt 3: Twiddlefaktor justieren

MOVE 	$1,X0;
MOVE 	$0,Y0;

;Schritt 4: Grundschritt aufrufen

JSR 	GRUNDSCHRITT;

;Schritt 5: Ergebnisse sichern

MOVE	(R2), X:$000;
MOVE	(R2), Y:$000;
MOVE	(R5), X:$006;
MOVE	(R5), Y:$006;

;Schritt 6: Neue Input Adressen vorgeben
MOVE	#$003,R1;
MOVE	#$00F,R4;

;Schritt 7: Grundschritt aufrufen

JSR	GRUNDSCHRITT;

;Schritt 8: Ergebnisse sichern

MOVE 	(R2), X:$003;
MOVE 	(R2), Y:$003;
MOVE 	(R5), X:$00F;
MOVE 	(R5), Y:$00F;

;Schritt 9: Inputadressen vorgeben

MOVE	#$000, R1;
MOVE	#$003, R4;

;Schritt 10: Grundschritt aufrufen

JSR	GRUNDSCHRITT;

;Schritt 11: Ergebnisse sichern

MOVE	(R2), X:$000;
MOVE	(R2), Y:$000;
MOVE	(R5), X:$003;
MOVE	(R5), Y:$003;

;Schritt 12: Twiddlefaktor anpassen

MOVE	$0, X0;
MOVE	-1, Y0;

;Schritt 13: Inputadressen Vorgeben

MOVE	#$006,R1;
MOVE	#$009,R4;

;Schritt 14: Grundschritt aufrufen

JSR 	GRUNDSCHRITT;

;Schritt 15: Ergebnisse sichern

MOVE	(R2), X:$006;
MOVE	(R2), Y:$006;
MOVE	(R2), X:$009;
MOVE	(R2), Y:$009;

;ENDE
