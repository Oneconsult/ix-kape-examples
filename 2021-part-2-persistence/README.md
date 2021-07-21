# Dateien für Beispielszenario zu iX 08/2021 KAPE-Einführung, Teil 2: Autoruns-Artefakte auswerten und verstehen
In diesem Git Repository liegen die notwendigen Dateien zum Nachstellen des im oben genannten Artikel beschriebenen Beispielszenarios.

## Nutzung
### Voraussetzung
* Windows-10-Installation
* :warning: Das Szenario sollte ausschließlich auf einem Testsystem nachgestellt werden.
* `Remove-Persistence.ps1` _sollte_ die installierten Persistenzen entfernen, dies kann aber aus unterschiedlichen Gründen scheitern.
* Das Testsystem sollte am Ende zurückgesetzt werden.

### Persistenz installieren
1. Windows-10-Testumgebung installieren.
2. Snapshot erstellen, falls eine virtuelle Umgebung genutzt wird.
3. Inhalt dieses Repositorys herunterladen und auf dem Testsystem entpacken.
4. `Add-Persistence.ps1` als Administrator ausführen.

### Persistenz entfernen
1. `Remove-Persistence.ps1` als Administrator ausführen.

## Antivirus-Meldungen
Das Verhalten der PowerShell-Skripte und `bin\EvilService.exe` können zu Warnungen der Antivirensoftware führen. Je nach Einstellung wird die Ausführung blockiert oder die Dateien werden gelöscht. Zur Nachstellung des Szenarios kann es notwendig sein, die Dateien in der Antivirensoftware als vertrauenswürdig einzustufen.

## `EvilService.exe` selber bauen
Die Datei kann durch Kompilieren mit dem C# Compiler erstellt werden: `csc.exe src\EvilService.cs`

Dies ist zum Beispiel wie folgt möglich:
1. Visual Studio Community für die C#-Entwicklung installieren.
2. `src\EvilService.cs` mit Visual Studio öffnen.
3. In der "Developer Command Prompt" die Datei kompilieren: `csc.exe src\EvilService.cs`
