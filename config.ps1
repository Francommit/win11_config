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

# Unpin all Start Menu tiles
If ([System.Environment]::OSVersion.Version.Build -ge 15063 -And [System.Environment]::OSVersion.Version.Build -le 16299) {
	Get-ChildItem -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" -Include "*.group" -Recurse | ForEach-Object {
		$data = (Get-ItemProperty -Path "$($_.PsPath)\Current" -Name "Data").Data -Join ","
		$data = $data.Substring(0, $data.IndexOf(",0,202,30") + 9) + ",0,202,80,0,0"
		Set-ItemProperty -Path "$($_.PsPath)\Current" -Name "Data" -Type Binary -Value $data.Split(",")
	}
} ElseIf ([System.Environment]::OSVersion.Version.Build -eq 17133) {
	$key = Get-ChildItem -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" -Recurse | Where-Object { $_ -like "*start.tilegrid`$windows.data.curatedtilecollection.tilecollection\Current" }
	$data = (Get-ItemProperty -Path $key.PSPath -Name "Data").Data[0..25] + ([byte[]](202,50,0,226,44,1,1,0,0))
	Set-ItemProperty -Path $key.PSPath -Name "Data" -Type Binary -Value $data
}
