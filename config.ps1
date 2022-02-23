# Shared tools
winget install git.git --accept-source-agreements
winget install 7zip.7zip --accept-source-agreements
winget install Lexikos.AutoHotkey --accept-source-agreements
winget install voidtools.Everything --accept-source-agreements
winget install Microsoft.VisualStudioCode --accept-source-agreements
winget install Microsoft.WindowsTerminal --accept-source-agreements
winget install SublimeHQ.SublimeText.4 --accept-source-agreements
winget install WinSCP.WinSCP --accept-source-agreements
winget install Google.Chrome --accept-source-agreements

# Personal tools
winget install GitHub.GitHubDesktop --accept-source-agreements

# Games
winget install Valve.Steam --accept-source-agreements
winget install EpicGames.EpicGamesLauncher --accept-source-agreements

# Windows Configration
winget install StartIsBack --accept-source-agreements


###
# Old win10 config to test
##

# Disable Stick keys
Write-Output "Disabling Sticky keys prompt..."
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "506"

# Show all tray icons
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0

# Hide Search button / box
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0

# Hide the Windows 11 chat button
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Type DWord -Value 0
