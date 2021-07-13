Backend:
Requirements:
- Java 11 oder höher
- Maven

Datebankverbindung:
Unter impfservice/src/main//resources/application.properties
den connection string an die eigene DB anpassen mit username und password.

Starten:
Im Directory impfservice folgenden Maven-Befehl ausführen:
./mvnw spring-boot:run

GUI:
Im Ordner app index.html öffnen.
Die Datenbank erlaubt nur das hinzufügen von Impfungen, wenn as ausgwählte Impfpaket auch im entsprechenden Impfzentrum vorrätig ist.
Dies kann getestet werden z.B. mit der Kombination:
Impfzentrum Austria Centre
Impfpacket 6