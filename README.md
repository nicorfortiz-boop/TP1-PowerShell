# TP1-PowerShell

**Módulo:** Programación para Seguridad Informática
**Docente:** Lic. Carlos Pacheco
**Alumno:** Nicolás Ortiz

## Descripción

Script en PowerShell (`TP1.ps1`) que obtiene:

1. La versión de PowerShell (`$PSVersionTable`).
2. La configuración de permisividad de ejecución de scripts (`Get-ExecutionPolicy -List`).
3. La información de la edición del sistema operativo (`Get-ComputerInfo`).
4. La información completa de la PC con el comando de CMD `systeminfo`.

## Uso

```powershell
powershell -ExecutionPolicy Bypass -File .\TP1.ps1
```

`-ExecutionPolicy Bypass` aplica solo a esa ejecución y no modifica la política del sistema.
