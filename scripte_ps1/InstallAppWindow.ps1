If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}

Write-Host "Checking Chocolatey..."


# Check if Chocolatey is installed
if (Test-Path C:\ProgramData\chocolatey\choco.exe){
    'Chocolatey Already Installed'
}  
else{
    # Installing Chocolateyet from the Microsoft Store
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}



Add-Type -AssemblyName PresentationFramework



$xaml = @'
<Window         
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Title="My App and windows optimiser" Height="650" Width="560" WindowStartupLocation="CenterScreen" ResizeMode="NoResize">
	<Grid Background="#FF252525" Margin="0,0,0,-49">
		<Grid.ColumnDefinitions>
			<ColumnDefinition Width="47*"/>
			<ColumnDefinition Width="65*"/>
		</Grid.ColumnDefinitions>
		<Label Content="Mead by raad" HorizontalAlignment="Left" Margin="10,5,0,0" VerticalAlignment="Top" Background="Transparent" FontFamily="Bahnschrift Condensed" FontSize="18" Foreground="Red" Height="32" Width="90" Grid.Column="1"/>
		<Label Content="Chose app when you need to Install/Unistall" HorizontalAlignment="Left" Margin="96,26,0,0" VerticalAlignment="Top" FontSize="16" FontFamily="Segoe Print" Background="Transparent" Foreground="#FFE8D977" Height="38" Width="368" Grid.ColumnSpan="2"/>

		<CheckBox x:Name="Chrome_CheckBox" Content="Chrome" HorizontalAlignment="Left" Margin="12,78,0,0" VerticalAlignment="Top" Foreground="White" IsChecked="False" FontSize="14" RenderTransformOrigin="1.041,0.566" Height="18" Width="132"/>
		<CheckBox x:Name="Fierfox_CheckBox" Content="Fierfox" HorizontalAlignment="Left" Margin="12,101,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="132"/>
		<CheckBox x:Name="Breave_CheckBox" Content="Breave" HorizontalAlignment="Left" Margin="12,124,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="132"/>
		<CheckBox x:Name="Discord_CheckBox" Content="Discord" HorizontalAlignment="Left" Margin="12,147,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="132"/>
		<CheckBox x:Name="ONLYOFFICE_CheckBox" Content="ONLYOFFICE" HorizontalAlignment="Left" Margin="12,170,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" RenderTransformOrigin="0.757,0.431" Height="18" Width="132"/>
		<CheckBox x:Name="Everything_CheckBox" Content="Everything" HorizontalAlignment="Left" Margin="12,193,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="132"/>
		<CheckBox x:Name="powershell_CheckBox" Content="Powershell" HorizontalAlignment="Left" Margin="12,216,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="132"/>
		<CheckBox x:Name="Visual_Studio_Community22_CheckBox" Content="Visual Studio Com22" HorizontalAlignment="Left" Margin="12,262,0,0" VerticalAlignment="Top" Foreground="White" Height="18" Width="132" RenderTransformOrigin="0.573,0.978"/>
		<CheckBox x:Name="Visual_Studio_Code_CheckBox" Content="Visual Studio Code" HorizontalAlignment="Left" Margin="12,239,0,0" VerticalAlignment="Top" Foreground="White" Height="18" Width="132"/>
		<CheckBox x:Name="Steam_CheckBox" Content="Steam" HorizontalAlignment="Left" Margin="12,285,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="132"/>
		<CheckBox x:Name="DS4Windows_CheckBox" Content="DS4Windows" HorizontalAlignment="Left" Margin="157,80,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="NET_4_8_CheckBox" Content=".NET 4.8" HorizontalAlignment="Left" Margin="59,80,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="libreoffice_CheckBox" Content="libreoffice" HorizontalAlignment="Left" Margin="186,80,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" RenderTransformOrigin="1.171,-0.547" Height="18" Width="127" Grid.Column="1"/>
		<CheckBox x:Name="NanaZip_CheckBox" Content="NanaZip" HorizontalAlignment="Left" Margin="157,103,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="WinRAR_CheckBox" Content="WinRAR" HorizontalAlignment="Left" Margin="157,126,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="NET_5_0_CheckBox" Content=".NET 5.0" HorizontalAlignment="Left" Margin="60,103,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="Revo_Uninstaller_CheckBox" Content="Revo Uninstaller" HorizontalAlignment="Left" Margin="186,103,0,0" VerticalAlignment="Top" Foreground="White" Height="18" Width="127" Grid.Column="1"/>
		<CheckBox x:Name="NET_6_0_CheckBox" Content=".NET 6.0" HorizontalAlignment="Left" Margin="60,126,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="Geek_Uninstaller_CheckBox" Content="Geek Uninstaller" HorizontalAlignment="Left" Margin="186,126,0,0" VerticalAlignment="Top" Foreground="White" RenderTransformOrigin="1.395,1.672" Height="18" Width="127" Grid.Column="1"/>
		<CheckBox x:Name="Epic_Games_Launcher_CheckBox" Content="Epic Games " HorizontalAlignment="Left" Margin="157,149,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="PDF_XChange_Viewer_CheckBox" Content="PDFXChange Viewer" HorizontalAlignment="Left" Margin="157,172,0,0" VerticalAlignment="Top" Foreground="White" Height="18" Width="130" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="PDF24_CreatorCheckBox" Content="PDF24 Creator" HorizontalAlignment="Left" Margin="157,195,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="PDF_XChange_Editor_CheckBox" Content="PDF-XChange Editor" HorizontalAlignment="Left" Margin="157,218,0,0" VerticalAlignment="Top" Foreground="White" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="VLC_media_player_CheckBox" Content="VLC media player" HorizontalAlignment="Left" Margin="157,241,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="Sublime_Text_2_CheckBox" Content="Sublime Text 2" HorizontalAlignment="Left" Margin="157,287,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" RenderTransformOrigin="0.158,1.726" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<CheckBox x:Name="NET_7_0_CheckBox" Content=".NET 7.0" HorizontalAlignment="Left" Margin="60,149,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="NET_8_0_CheckBox" Content=".NET 8.0" HorizontalAlignment="Left" Margin="60,172,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="VisualC22_CheckBox" Content="Visual C++22" HorizontalAlignment="Left" Margin="60,195,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="Visual_C_15_CheckBox" Content="Visual C++15" HorizontalAlignment="Left" Margin="60,218,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="Python_3_6_CheckBox" Content="Python 3.6" HorizontalAlignment="Left" Margin="60,241,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="FileZilla_CheckBox" Content="FileZilla" HorizontalAlignment="Left" Margin="60,264,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="Google_Drive_CheckBox" Content="Google Drive" HorizontalAlignment="Left" Margin="59,287,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="107" Grid.Column="1"/>
		<CheckBox x:Name="Adobe_Acrobat_Reader_CheckBox" Content="Adobe Reader" HorizontalAlignment="Left" Margin="186,149,0,0" VerticalAlignment="Top" Foreground="White" Height="18" Width="127" Grid.Column="1"/>
		<CheckBox x:Name="rockstar_CheckBox" Content="rockstar luncher" HorizontalAlignment="Left" Margin="186,172,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="127" Grid.Column="1"/>
		<CheckBox x:Name="AutoHotkey_CheckBox" Content="AutoHotkey" HorizontalAlignment="Left" Margin="186,195,0,0" VerticalAlignment="Top" Foreground="White" Height="18" Width="137" FontSize="14" Grid.Column="1"/>
		<CheckBox x:Name="AnyDesk_CheckBox" Content="AnyDesk" HorizontalAlignment="Left" Margin="186,218,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="127" RenderTransformOrigin="0.504,1.044" Grid.Column="1"/>
		<CheckBox x:Name="OBS_Studio_CheckBox" Content="OBS Studio" Margin="186,241,-62,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Grid.Column="1"/>
		<CheckBox x:Name="VirtualBox_CheckBox" Content="VirtualBox" HorizontalAlignment="Left" Margin="186,264,0,0" VerticalAlignment="Top" Foreground="White" FontSize="12" Height="18" Width="137" Grid.Column="1"/>
		<CheckBox x:Name="Rufus_CheckBox" Content="Rufus" HorizontalAlignment="Left" Margin="186,287,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="127" Grid.Column="1"/>
		<CheckBox x:Name="Paint_NET_CheckBox" Content="Paint.NET" HorizontalAlignment="Left" Margin="157,264,0,0" VerticalAlignment="Top" Foreground="White" FontSize="14" Height="18" Width="128" Grid.ColumnSpan="2"/>
		<TextBox x:Name="TextBox1" HorizontalAlignment="Left" Height="122" Margin="91,383,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="370" Grid.ColumnSpan="2"/>
		<Button x:Name="Uninstall_Btn" Content="Uninstall" HorizontalAlignment="Left" Margin="54,547,0,0" VerticalAlignment="Top" Height="40" Width="172" Foreground="White" Background="#FFEA3E3E" FontFamily="Segoe UI Black" FontSize="20" FontWeight="Bold" Grid.Column="1"/>
		<Button x:Name="Install_Btn" Content="Install" HorizontalAlignment="Left" Margin="91,547,0,0" VerticalAlignment="Top" Height="40" Width="172"  FontSize="22" FontFamily="Segoe UI Black" Background="#FF3B2BFF" Foreground="#FFFFEA00" Grid.ColumnSpan="2" />

	</Grid>

</Window>
'@





# Charger le XAML
$reader = [System.Xml.XmlTextReader]::new([System.IO.StringReader]$xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Récupérer les éléments
$TextBox1 = $window.FindName("TextBox1")
$Install_Btn = $window.FindName("Install_Btn")
$Uninstall_Btn = $window.FindName("Uninstall_Btn")






# Fonction pour récupérer tous les CheckBox nommés
function Get-AllCheckBoxes {
    param ([System.Windows.Window]$window)
    $checkboxes = @{}

    function FindCheckBoxes($parent) {
        if ($parent -is [System.Windows.Controls.CheckBox] -and $parent.Name) {
            $checkboxes[$parent.Name] = $parent
        }
        if ($parent -is [System.Windows.DependencyObject]) {
            $count = [System.Windows.Media.VisualTreeHelper]::GetChildrenCount($parent)
            for ($i = 0; $i -lt $count; $i++) {
                $child = [System.Windows.Media.VisualTreeHelper]::GetChild($parent, $i)
                FindCheckBoxes $child
            }
        }
    }

    FindCheckBoxes $window
    return $checkboxes
}

# Dictionnaire des commandes d'installation
$installCommands = @{
    "Chrome_CheckBox" = "choco install googlechrome --version 122.0.6261.39 -y --force"
    "Fierfox_CheckBox" = "choco install firefox --version 122.0.1 -y --force"
    "Breave_CheckBox" = "choco install brave --version 1.62.165 -y --force"
    "Discord_CheckBox" = "choco install discord --version 1.0.9005 -y --force"
    "ONLYOFFICE_CheckBox" = "choco install onlyoffice --version 8.0.0 -y --force"
    "Everything_CheckBox" = "choco install everything --version 1.4.11024 -y --force"
    "powershell_CheckBox" = "choco install powershell.portable --version 7.1.3 -y --force"
    "Visual_Studio_Code_CheckBox" = "choco install vscode -y --force"
    "Visual_Studio_Community22_CheckBox" = "choco install visualstudio2022community --version 117.9.0.0 -y --force"
    "Steam_CheckBox" = "choco install steam --version 2.10.91.91221129 -y --force"
    "DS4Windows_CheckBox" = "choco install ds4windows --version 3.3.3 -y --force"
    "NanaZip_CheckBox" = "choco install nanazip --version 2.0.450.0 -y --force"
    "WinRAR_CheckBox" = "choco install winrar --version 6.24 -y --force"
    "Epic_Games_Launcher_CheckBox" = "choco install epicgameslauncher --version 1.3.93 -y --force"
    "PDF_XChange_Viewer_CheckBox" = "choco install pdfxchangeviewer --version 2.5.317.20161116 -y --force"
    "PDF24_CreatorCheckBox" = "choco install pdf24 --version 11.15.2 -y --force"
    "PDF_XChange_Editor_CheckBox" = "choco install pdfxchangeeditor --version 10.2.1.385 -y --force"
    "VLC_media_player_CheckBox" = "choco install vlc --version 3.0.20 -y --force"
    "Paint_NET_CheckBox" = "choco install paint.net -y --force"
    "Sublime_Text_2_CheckBox" = "choco install sublimetext2 --version 2.0.2.2224 -y --force"
    "NET_4_8_CheckBox" = "choco install netfx-4.8-devpack --version 4.8.0.20190930 -y --force"
    "NET_5_0_CheckBox" = "choco install dotnet-5.0-desktopruntime --version 5.0.17 -y --force"
    "NET_6_0_CheckBox" = "choco install dotnet-6.0-desktopruntime --version 6.0.27 -y --force"
    "NET_7_0_CheckBox" = "choco install dotnet-7.0-desktopruntime --version 7.0.16 -y --force"
    "NET_8_0_CheckBox" = "choco install dotnet-8.0-desktopruntime --version 8.0.2 -y --force"
    "VisualC22_CheckBox" = "choco install vcredist140 -y --force"
    "Visual_C_15_CheckBox" = "choco install vcredist2015 -y --force"
    "Python_3_6_CheckBox" = "choco install python36 --version 3.6.8 -y --force"
    "FileZilla_CheckBox" = "choco install filezilla --version 3.66.5 -y --force"
    "Google_Drive_CheckBox" = "choco install google-drive-file-stream --version 56.0.11.2022 -y --force"
    "libreoffice_CheckBox" = "choco install libreoffice-sdk --version 7.5.2 -y --force"
    "Revo_Uninstaller_CheckBox" = "choco install revo-uninstaller --version 2.4.5 -y --force"
    "Geek_Uninstaller_CheckBox" = "choco install geekuninstaller --version 1.5.2.165 -y --force"
    "Adobe_Acrobat_Reader_CheckBox" = "choco install adobereader --version 2023.8.20533 -y --force"
    "rockstar_CheckBox" = "choco install rockstar-launcher -y --force"
    "AutoHotkey_CheckBox" = "choco install autohotkey --version 1.1.37.1 -y --force"
    "AnyDesk_CheckBox" = "choco install anydesk.install --version 8.0.8 -y --force"
    "OBS_Studio_CheckBox" = "choco install obs-studio --version 30.0.2 -y --force"
    "VirtualBox_CheckBox" = "choco install virtualbox --version 7.0.14 -y --force"
    "Rufus_CheckBox" = "choco install rufus.portable --version 4.4.0 -y --force"
}







$uninstallCommands = @{
    "Chrome_CheckBox" = "choco uninstall googlechrome -y --force"
    "Fierfox_CheckBox" = "choco uninstall firefox -y --force"
    "Breave_CheckBox" = "choco uninstall brave -y --force"
    "Discord_CheckBox" = "choco uninstall discord -y --force"
    "ONLYOFFICE_CheckBox" = "choco uninstall onlyoffice -y --force"
    "Everything_CheckBox" = "choco uninstall everything -y --force"
    "powershell_CheckBox" = "choco uninstall powershell.portable -y --force"
    "Visual_Studio_Code_CheckBox" = "choco uninstall vscode -y --force"
    "Visual_Studio_Community22_CheckBox" = "choco uninstall visualstudio2022community -y --force"
    "Steam_CheckBox" = "choco uninstall steam -y --force"
    "DS4Windows_CheckBox" = "choco uninstall ds4windows -y --force"
    "NanaZip_CheckBox" = "choco uninstall nanazip -y --force"
    "WinRAR_CheckBox" = "choco uninstall winrar -y --force"
    "Epic_Games_Launcher_CheckBox" = "choco uninstall epicgameslauncher -y --force"
    "PDF_XChange_Viewer_CheckBox" = "choco uninstall pdfxchangeviewer -y --force"
    "PDF24_CreatorCheckBox" = "choco uninstall pdf24 -y --force"
    "PDF_XChange_Editor_CheckBox" = "choco uninstall pdfxchangeeditor -y --force"
    "VLC_media_player_CheckBox" = "choco uninstall vlc -y --force"
    "Paint_NET_CheckBox" = "choco uninstall paint.net -y --force"
    "Sublime_Text_2_CheckBox" = "choco uninstall sublimetext2 -y --force"
    "NET_4_8_CheckBox" = "choco uninstall netfx-4.8-devpack -y --force"
    "NET_5_0_CheckBox" = "choco uninstall dotnet-5.0-desktopruntime -y --force"
    "NET_6_0_CheckBox" = "choco uninstall dotnet-6.0-desktopruntime -y --force"
    "NET_7_0_CheckBox" = "choco uninstall dotnet-7.0-desktopruntime -y --force"
    "NET_8_0_CheckBox" = "choco uninstall dotnet-8.0-desktopruntime -y --force"
    "VisualC22_CheckBox" = "choco uninstall vcredist140 -y --force"
    "Visual_C_15_CheckBox" = "choco uninstall vcredist2015 -y --force"
    "Python_3_6_CheckBox" = "choco uninstall python36 -y --force"
    "FileZilla_CheckBox" = "choco uninstall filezilla -y --force"
    "Google_Drive_CheckBox" = "choco uninstall google-drive-file-stream -y --force"
    "libreoffice_CheckBox" = "choco uninstall libreoffice-sdk -y --force"
    "Revo_Uninstaller_CheckBox" = "choco uninstall revo-uninstaller -y --force"
    "Geek_Uninstaller_CheckBox" = "choco uninstall geekuninstaller -y --force"
    "Adobe_Acrobat_Reader_CheckBox" = "choco uninstall adobereader -y --force"
    "rockstar_CheckBox" = "choco uninstall rockstar-launcher -y --force"
    "AutoHotkey_CheckBox" = "choco uninstall autohotkey -y --force"
    "AnyDesk_CheckBox" = "choco uninstall anydesk.install -y --force"
    "OBS_Studio_CheckBox" = "choco uninstall obs-studio -y --force"
    "VirtualBox_CheckBox" = "choco uninstall virtualbox -y --force"
    "Rufus_CheckBox" = "choco uninstall rufus.portable -y --force"
}











# Attacher l'événement au bouton Install
$Install_Btn.Add_Click({
    [System.Windows.MessageBox]::Show("Please note: the window may temporarily freeze while installations run in the background. You will see apps being installed step by step.")
    $allCheckBoxes = Get-AllCheckBoxes -window $window
    foreach ($cbName in $installCommands.Keys) {
        $cb = $allCheckBoxes[$cbName]
        if ($cb -and $cb.IsChecked -eq $true) {
            $command = $installCommands[$cbName]
            Start-Process -Wait -NoNewWindow -FilePath "powershell.exe" -ArgumentList "-Command", $command
            $TextBox1.Text += "$($cb.Content) installation completed.`r`n"
        }
    }
})

# Attacher l'événement au bouton Uninstall
$Uninstall_Btn.Add_Click({
    [System.Windows.MessageBox]::Show("Please note: the window may temporarily freeze while uninstallations run in the background. You will see apps being removed step by step.")
    $allCheckBoxes = Get-AllCheckBoxes -window $window
    foreach ($cbName in $uninstallCommands.Keys) {
        $cb = $allCheckBoxes[$cbName]
        if ($cb -and $cb.IsChecked -eq $true) {
            $command = $uninstallCommands[$cbName]
            Start-Process -Wait -NoNewWindow -FilePath "powershell.exe" -ArgumentList "-Command", $command
            $TextBox1.Text += "$($cb.Content) uninstallation completed.`r`n"
        }
    }
})







# 🪟 Afficher la fenêtre
$window.ShowDialog()
