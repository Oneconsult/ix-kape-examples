# Beispielszenariodateien für iX 08/2021 KAPE-Einführung, Teil 2: Autoruns-Artefakte auswerten und verstehen
In diesem Git Repository liegen die notwendigen Dateien zur Nachstellung des Beispielszenarios.

## Nutzung
### Voraussetzung
* Windows 10 Installation
* :warning: Das Szenario sollte ausschliesslich auf einem Testsystem nachgestellt werden
* `Remove-Persistence.ps1` _sollte_ die installierten Persistenzen entfernen, es kann aber aus unterschiedlichen Gründen scheitern
* Das Testsystem sollte am Ende zurückgesetzt werden

### Persistenz installieren
1. Windows 10 Testumgebung installieren
2. Snapshot erstellen, falls eine virtuelle Umgebung genutzt wird
3. Inhalt dieses Repository herunterladen und auf dem Testsystem entpacken
4. `Add-Persistence.ps1` als Administrator ausführen

### Persistenz entfernen
1. `Remove-Persistence.ps1` als Administrator ausführen

## Antivirus-Meldungen
Das Verhalten der PowerShell-Skripte und die `bin\EvilService.exe` können zu Antivirus-Warnungen führen. Je nach Einstellung wird die Ausführung blockiert oder die Dateien gelöscht. Zur Nachstellung des Szenarios kann es notwendig sein in der Antivirus-Software die Dateien als vertrauenswürdig einzustufen.

## `EvilService.exe` selber bauen
Die Datei kann durchs Kompillieren mit dem C# Compiler erstellt werden: `csc.exe src\EvilService.cs`

Dies kann zum Beispiel wie folgt erfolgen:
1. Visual Studio Community für die C#-Entwicklung installieren
2. `src\EvilService.cs` mit Visual Studio öffnen
3. In der "Developer Command Prompt" die Datei kompillieren: `csc.exe src\EvilService.cs`
