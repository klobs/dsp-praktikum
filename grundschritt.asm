;Start Grundschritt
;1. Schritt: Skalierung
GRUNDSCHRITT	MOVE	X:(R1),X1 Y:(R1),Y1;
				MPY 	0.5,X1, A; Skalierung, speichern in A
				MPY 	0.5,Y1, B; Skalierung, speichern in B
				MOVE	A,X:(R1) B,Y:(R1);

				MOVE	X:(R4),X1 Y:(R4),Y1; (Ggf unnoetig)
				MPY		0.5,X1, A; Skalierung, speichern in A
				MPY		0.5,Y1, B; Skalierung, speichern in B
				MOVE	A,X:(R4) B:Y(R4);

;2. Schritt: Twiddlefaktor applizieren
				MOVE	A, X1; Sollte sich seit letztem Move nicht veraendert haben
				MOVE 	B, Y1; sonst nochmal aus dem X-Speicher kopieren

				; (a+jb)*(c+jd) = (ac - bd)+j(bc+ad)

				MPY		X0,X1, A; Realer Teil
				MAC		-Y0,Y1,A; (Hinzuadieren)

				MPY		Y0,X1, B; Imaginaerer Teil
				MAC		X,Y1,  B; (Hinzuadieren)

				MOVE	A,X:(R4) B,Y:(R4); Wegsichern

;3. Schritt: Berechnung
				ADD		X:(R1), A;
				ADD		Y:(R1), B;
				MOVE	A,X:(R2) B,Y:(R2); Wegsichern

				MOVE	X:(R1), A; Alte Ergebnisse fuer neue Berechnung zurueck holen
				MOVE	Y:(R1), B;
	
				SUB		X:(R4),A;
				SUB		Y:(R4),B;

				MOVE	A,X:(R5) B,Y:(R5);

;ENDE Grundschritt
				
				RTS
