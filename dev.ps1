# Description: Boxstarter Script
# Author: Microsoft
# Common settings for web dev

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
    iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "CommonDevTools.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "Browsers.ps1";

choco install -y visualstudio2017community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
Update-SessionEnvironment #refreshing env due to Git install

choco install -y visualstudio2017-workload-nativedesktop
choco install -y visualstudio2017-workload-nativegame

choco install -y firefox
choco install -y googlechrome
choco install -y vscode
choco install -y cmder
choco install -y 7zip
choco install -y gimp
choco install -y sublimetext3
choco install -y notepadplusplus
choco install -y teracopy
choco install -y mpv
choco install -y tidal
choco install -y telegram
choco install -y whatsapp
choco install -y jre8
choco install -y vcredist140
choco install -y steam
choco install -y git
choco install -y curl
choco install -y dropbox
choco install -y vcredist2013
choco install -y procexp
choco install -y youtube-dl
choco install -y llvm 
choco install -y calibre
choco install -y windirstat
choco install -y slack
choco install -y audacity
choco install -y dotnet4.0
choco install -y dotnetfx
choco install -y qbittorrent
choco install -y ffmpeg
choco install -y imagemagick.app
choco install -y rufus
choco install -y 1password
choco install -y nodejs-lts
choco install -y python
choco install -y gh
choco install -y emacs
choco install -y cmake
choco install -y dnsjumper
choco install -y blender
choco install -y unity-hub
choco install -y soulseek
choco install -y musicbee
choco install -y sumatrapdf
choco install -y sublimetext3
choco install -y golang
choco install -y vim
choco install -y gvim 
choco install -y ninja
choco install -y windirstat



Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
