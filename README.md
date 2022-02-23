# Windows 11 Fresh Configuration

Recently installed Windows 11 and gosh do I hate the default setup. Aim of this repo is to take what I've built in the win10_config repo and apply any appropriate Windows 11 specific changes to it.



## Steps 
1. Run in Powershell as admin
```
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force; [System.net.ServicePointManager]::SecurityProtocol = 3072 -bor 768 -bor 192 -bor 48; iwr http://github.com/Francommit/win11_config/raw/master/config.ps1 -UseBasicParsing | iex
```

