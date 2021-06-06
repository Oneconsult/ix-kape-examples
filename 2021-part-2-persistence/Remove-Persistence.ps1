#Requires -RunAsAdministrator

#
# T1547.001 - Registry Run Keys / Startup Folder
#

# T1547.001: Startup Folder
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\startup.bat"
Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\startup.bat"

# T1547.001: Registry Key `Run`
Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name "startup"

#
# T1546.003 - Windows Management Instrumentation Event Subscription
#
$wmiEvilConsumer = Get-WmiObject -Namespace root/subscription -Class CommandLineEventConsumer -Filter "Name = 'EvilWmiConsumer'"
$wmiEvilFilter = Get-WmiObject -Namespace root/subscription -Class __EventFilter -Filter "Name = 'EvilWmiFilter'"

Get-WmiObject -Namespace root/subscription -Query "REFERENCES OF {$($wmiEvilConsumer.__RELPATH)} WHERE ResultClass = __FilterToConsumerBinding" | Remove-WmiObject | Out-Null
$wmiEvilConsumer | Remove-WmiObject | Out-Null
$wmiEvilFilter | Remove-WmiObject | Out-Null

#
# T1053.005 - Scheduled Task
#

# Scheduled task executed after user logon
Get-ScheduledTask -TaskName "EvilScheduledTask" | Unregister-ScheduledTask

#
# T1543.003 - Windows Service
#
Stop-Service -Name "BlTS"
try {
    (Get-WmiObject -Class "Win32_Service" -Filter "name = 'BlTS'").Delete()
} catch {
    Write-Host "Failed to delete 'BlTS' service. Please check by hand if it is gone or not"
}