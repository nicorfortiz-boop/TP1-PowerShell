# TP1 - Programacion para Seguridad Informatica (PowerShell)
# Muestra: version de PowerShell, Execution Policy, edicion del SO
# y systeminfo (comando de CMD). Guarda todo en informe_TP1.txt

$informe = Join-Path $PSScriptRoot "informe_TP1.txt"
Start-Transcript -Path $informe -Force | Out-Null

function Mostrar-Titulo {
    param([string]$Texto)
    Write-Host ""
    Write-Host ("=" * 70) -ForegroundColor Cyan
    Write-Host " $Texto" -ForegroundColor Cyan
    Write-Host ("=" * 70) -ForegroundColor Cyan
}

# 1) Version de PowerShell
Mostrar-Titulo "1) VERSION DE POWERSHELL"
$PSVersionTable | Out-Host
Write-Host "Version resumida: $($PSVersionTable.PSVersion)" -ForegroundColor Green

# 2) Configuracion de permisividad (Execution Policy)
Mostrar-Titulo "2) CONFIGURACION DE PERMISIVIDAD (EXECUTION POLICY)"
Write-Host "Politica efectiva actual: $(Get-ExecutionPolicy)" -ForegroundColor Green
Write-Host ""
Write-Host "Politicas por ambito:"
Get-ExecutionPolicy -List | Format-Table -AutoSize | Out-Host

# 3) Edicion del sistema operativo
Mostrar-Titulo "3) INFORMACION DE LA EDICION DEL SISTEMA OPERATIVO"
try {
    Get-ComputerInfo -Property `
        WindowsProductName, WindowsEditionId, WindowsVersion, `
        OsName, OsVersion, OsBuildNumber, OsArchitecture, `
        OsInstallDate, OsLastBootUpTime, OsRegisteredUser |
        Format-List | Out-Host
}
catch {
    Write-Warning "Get-ComputerInfo no disponible, se usa CIM como alternativa."
    Get-CimInstance -ClassName Win32_OperatingSystem |
        Select-Object Caption, Version, BuildNumber, OSArchitecture, InstallDate |
        Format-List | Out-Host
}

# 4) Informacion completa de la PC con un comando de CMD
Mostrar-Titulo "4) INFORMACION COMPLETA DE LA PC (CMD: systeminfo)"
cmd.exe /c systeminfo | Out-Host

Write-Host ""
Write-Host "Informe guardado en: $informe" -ForegroundColor Yellow
Stop-Transcript | Out-Null