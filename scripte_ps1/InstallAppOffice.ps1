If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}



Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

# ✅ XAML minimal compatible
$xaml = @'
<Window         
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
            Title="Install Office Window" Height="700" Width="560" WindowStartupLocation="CenterScreen" ResizeMode="NoResize">

<Grid Background="#FF252525" Margin="0,0,0,-6" HorizontalAlignment="Left" Width="578">

    <!-- Sous-titre -->

    <Label Content="Mead by Raad" HorizontalAlignment="Center" Margin="0,4,0,0" VerticalAlignment="Top"
	   Background="Transparent" FontFamily="Bahnschrift Condensed" FontSize="18" Foreground="Red" Height="32" Width="92"/>

    <Label Content="Chose app when you need to Install" HorizontalAlignment="Center" Margin="0,25,0,0"
	   VerticalAlignment="Top" FontSize="16" FontFamily="Segoe Print" Background="Transparent" Foreground="#FFE8D977" Height="38" Width="298"/>


    <!-- Language Selector -->
    <Canvas Height="NaN" Margin="86,63,133,540" Width="NaN">
        <Label Content="Language:" Foreground="White" Width="129" RenderTransformOrigin="0.686,0.41" HorizontalContentAlignment="Stretch" VerticalContentAlignment="Stretch" FontSize="16" Padding="26,2,5,5" Height="33" HorizontalAlignment="Left" VerticalAlignment="Center" Canvas.Top="5" FontFamily="Arial Black" Canvas.Left="10"/>
        <ComboBox x:Name="LanguageSelector"
    Width="205"
    Height="25"
    FontSize="14"
    Padding="11,0,4,4"
    Background="White"
    Foreground="Black"
    HorizontalContentAlignment="Left"
    MaxDropDownHeight="100" VerticalContentAlignment="Center" Canvas.Left="144" Canvas.Top="5" HorizontalAlignment="Left" VerticalAlignment="Center">
            <ComboBoxItem Tag="fr-fr" Content="French (France)" IsSelected="True"/>
            <ComboBoxItem Tag="en-us" Content="English (United States)"/>
            <ComboBoxItem Tag="es-es" Content="Spanish (Spain)"/>
            <ComboBoxItem Tag="de-de" Content="German (Germany)"/>
            <ComboBoxItem Tag="it-it" Content="Italian (Italy)"/>
            <ComboBoxItem Tag="pt-br" Content="Portuguese (Brazil)"/>
            <ComboBoxItem Tag="zh-cn" Content="Chinese (Simplified)"/>
            <ComboBoxItem Tag="ja-jp" Content="Japanese (Japan)"/>
            <ComboBoxItem Tag="ru-ru" Content="Russian (Russia)"/>
            <ComboBoxItem Tag="ar-sa" Content="Arabic (Saudi Arabia)"/>
            <ComboBoxItem Tag="nl-nl" Content="Dutch (Netherlands)"/>
            <ComboBoxItem Tag="pl-pl" Content="Polish (Poland)"/>
            <ComboBoxItem Tag="tr-tr" Content="Turkish (Turkey)"/>
            <ComboBoxItem Tag="sv-se" Content="Swedish (Sweden)"/>
            <ComboBoxItem Tag="ko-kr" Content="Korean (South Korea)"/>
            <ComboBoxItem Tag="cs-cz" Content="Czech (Czech Republic)"/>
            <ComboBoxItem Tag="ro-ro" Content="Romanian (Romania)"/>
            <ComboBoxItem Tag="hu-hu" Content="Hungarian (Hungary)"/>
            <ComboBoxItem Tag="el-gr" Content="Greek (Greece)"/>
            <ComboBoxItem Tag="he-il" Content="Hebrew (Israel)"/>
        </ComboBox>
    </Canvas>






    <!-- CheckBox Example -->
    <Canvas Margin="24,128,372,336">
        <CheckBox Content="Word" IsChecked="False" Background="White" Foreground="White" Height="33" Width="128" FontFamily="Arial Black" HorizontalAlignment="Right" VerticalAlignment="Center" FontSize="16"/>
        <CheckBox Content="OutlookClassic" IsChecked="False" Background="White" Foreground="White" Height="34" Canvas.Top="44" Width="172" FontFamily="Arial Black" FontSize="16" HorizontalAlignment="Left" VerticalAlignment="Center"/>
        <CheckBox Content="Skype" IsChecked="False" Background="White" Foreground="White" Height="34" Canvas.Top="91" Width="128" FontFamily="Arial Black" FontSize="16"/>
        <CheckBox Content="Access" IsChecked="False" Background="White" Foreground="White" Height="35" Canvas.Top="141" Width="128" HorizontalAlignment="Center" VerticalAlignment="Top" FontFamily="Arial Black" FontSize="16"/>
    </Canvas>





    <Canvas Margin="220,127,205,337">
        <CheckBox Content="Excel" IsChecked="False" Background="White" Foreground="White" Height="33" Width="104" FontFamily="Arial Black" FontSize="16"/>
        <CheckBox Content="OneNote" IsChecked="False" Background="White" Foreground="White" Height="34" Canvas.Top="44" Width="104" FontFamily="Arial Black" FontSize="16"/>
        <CheckBox Content="OutlookNew" IsChecked="False" Background="White" Foreground="White" Height="34" Canvas.Top="91" Width="153" FontFamily="Arial Black" FontSize="16" HorizontalAlignment="Left" VerticalAlignment="Center"/>
        <CheckBox Content="Publisher" IsChecked="False" Background="White" Foreground="White" Height="33" Canvas.Top="141" Width="104" FontFamily="Arial Black" FontSize="16"/>
    </Canvas>




    <Canvas Margin="411,128,23,336">
        <CheckBox Content="PowerPoint" IsChecked="False" Background="White" Foreground="White" Height="33" Width="128" FontFamily="Arial Black" FontSize="16"/>
        <CheckBox Content="Teams" IsChecked="False" Background="White" Foreground="White" Height="34" Canvas.Top="44" Width="128" FontFamily="Arial Black" FontSize="16"/>
        <CheckBox Content="OneDrive" IsChecked="False" Background="White" Foreground="White" Height="34" Canvas.Top="91" Width="128" FontFamily="Arial Black" FontSize="16"/>
        <CheckBox Content="Groove" IsChecked="False" Background="White" Foreground="White" Height="33" Canvas.Top="141" Width="128" FontFamily="Arial Black" FontSize="16" />
    </Canvas>





    <Canvas Margin="121,366,121,33">
        <Button x:Name="InstallOfficeButton" Content="Install Office" 
                FontSize="16"
                FontFamily="Arial Black"
                Background="#FF3B2BFF" 
                BorderBrush="White" 
                BorderThickness="4" 
                Foreground="White" 
                Height="51" Canvas.Left="53" Width="230" Canvas.Top="10" HorizontalAlignment="Center" VerticalAlignment="Center"/>



        <Label Content="Chose app when you need to Unistall" 
                FontSize="16" 
                FontFamily="Segoe Print" 
                Background="Transparent" 
                Foreground="#FFE8D977" 
                FlowDirection="RightToLeft" 
                Padding="30,0,5,12" Height="40" Canvas.Top="67" Width="335" RenderTransformOrigin="0.512,0.943" Canvas.Left="10" HorizontalAlignment="Center" VerticalAlignment="Center"/>



        <Button x:Name="UninstallOfficeButton" Content="Unistall Office" 
                FontSize="16" 
                FontFamily="Arial Black" 
                Background="#FFEA3E3E" 
                BorderBrush="White" 
                BorderThickness="4" 
                Foreground="White" 
                Height="50" Canvas.Left="53" Canvas.Top="107" Width="230" HorizontalAlignment="Center" VerticalAlignment="Center"/>


        <Button x:Name="ActiveOfficeButton" Content="Activate Office" 
            FontSize="16" 
            FontFamily="Arial Black" 
            Background="#FF1F5414" 
            BorderBrush="White" 
            BorderThickness="4" 
            Foreground="White" 
            Height="50" Canvas.Left="53" Canvas.Top="191" Width="230" HorizontalAlignment="Center" VerticalAlignment="Top"/>


    </Canvas>



</Grid>
</Window>
'@





# 🧱 Charger le XAML
[xml]$xamlXml = $xaml
$reader = New-Object System.Xml.XmlNodeReader $xamlXml
$window = [Windows.Markup.XamlReader]::Load($reader)




















# Récupération des éléments de l'interface
$LanguageSelector = $Window.FindName("LanguageSelector")


$AccessCheck = $Window.FindName("AccessCheck")
$ExcelCheck = $Window.FindName("ExcelCheck")
$GrooveCheck = $Window.FindName("GrooveCheck")
$SkypeCheck = $Window.FindName("SkypeCheck")
$OneDriveCheck = $Window.FindName("OneDriveCheck")
$OneNoteCheck = $Window.FindName("OneNoteCheck")
$OutlookClassicCheck = $Window.FindName("OutlookClassicCheck")
$OutlookNewCheck = $Window.FindName("OutlookNewCheck")
$PowerPointCheck = $Window.FindName("PowerPointCheck")
$PublisherCheck = $Window.FindName("PublisherCheck")
$TeamsCheck = $Window.FindName("TeamsCheck")
$WordCheck = $Window.FindName("WordCheck")
# $VisioCheck = $Window.FindName("VisioCheck")
# $ProjectCheck = $Window.FindName("ProjectCheck")

# Fonction pour récupérer la langue sélectionnée
function Get-SelectedLanguage {
    return $LanguageSelector.SelectedItem.Tag
}

# Génération du fichier Configuration.xml
# Récupération des éléments de l'interface
$LanguageSelector = $Window.FindName("LanguageSelector")







$InstallOfficeButton = $Window.FindName("InstallOfficeButton")
$InstallOfficeButton.Add_Click({
    $setupPath = "$env:TEMP\\setup.exe"
    $tempXml = "$env:TEMP\\Configuration.xml"
    $language = Get-SelectedLanguage

    # Dictionnaire des apps avec leurs vrais IDs
    $allApps = @{
        Access = "Access"
        Excel = "Excel"
        Groove = "Groove"
        Skype = "Lync"
        OneDrive = "OneDrive"
        OneNote = "OneNote"
        OutlookClassic = "Outlook"
        OutlookNew = "OutlookNew"
        PowerPoint = "PowerPoint"
        Publisher = "Publisher"
        Teams = "Teams"
        Word = "Word"
    }

    # Récupère les apps cochées
    $includedApps = @()
    if ($AccessCheck.IsChecked) { $includedApps += $allApps.Access }
    if ($ExcelCheck.IsChecked) { $includedApps += $allApps.Excel }
    if ($GrooveCheck.IsChecked) { $includedApps += $allApps.Groove }
    if ($SkypeCheck.IsChecked) { $includedApps += $allApps.Skype }
    if ($OneDriveCheck.IsChecked) { $includedApps += $allApps.OneDrive }
    if ($OneNoteCheck.IsChecked) { $includedApps += $allApps.OneNote }
    if ($OutlookClassicCheck.IsChecked) { $includedApps += $allApps.OutlookClassic }
    if ($OutlookNewCheck.IsChecked) { $includedApps += $allApps.OutlookNew }
    if ($PowerPointCheck.IsChecked) { $includedApps += $allApps.PowerPoint }
    if ($PublisherCheck.IsChecked) { $includedApps += $allApps.Publisher }
    if ($TeamsCheck.IsChecked) { $includedApps += $allApps.Teams }
    if ($WordCheck.IsChecked) { $includedApps += $allApps.Word }

    # ✅ Vérifie qu’au moins une case est cochée (apps ou Visio/Project)
    if ($includedApps.Count -eq 0 -and !$VisioCheck.IsChecked -and !$ProjectCheck.IsChecked) {
        [System.Windows.Forms.MessageBox]::Show("Veuillez sélectionner au moins une application à installer.")
        return
    }

    # Calcul des apps à exclure
    $excludedApps = $allApps.Values | Where-Object { $includedApps -notcontains $_ }
    $excludeXml = $excludedApps | ForEach-Object { "      <ExcludeApp ID=`"$_`"/>" }

#     # Visio et Project
#     $visioXml = ""
#     $projectXml = ""
#     if ($VisioCheck.IsChecked) {
#         $visioXml = @"
#     <Product ID="VisioPro2024Volume" PIDKEY="B7TN8-FJ8V3-7QYCP-HQPMV-YY89G">
#       <Language ID="$language"/>
#     </Product>
# "@
#     }
#     if ($ProjectCheck.IsChecked) {
#         $projectXml = @"
#     <Product ID="ProjectPro2024Volume" PIDKEY="FQQ23-N4YCY-73HQ3-FM9WC-76HF4">
#       <Language ID="$language"/>
#     </Product>
# "@
#     }


#     # Génère le XML complet
#     $xml = @"
# <Configuration ID="a982351e-c99a-456e-82ec-8a6c38d4864f">
#   <Add OfficeClientEdition="64" Channel="Current">
#     <Product ID="O365ProPlusRetail">
#       <Language ID="$language"/>
# $excludeXml
#     </Product>
#  $visioXml
#  $projectXml
#   </Add>
#   <Property Name="SharedComputerLicensing" Value="0"/>
#   <Property Name="FORCEAPPSHUTDOWN" Value="FALSE"/>
#   <Property Name="DeviceBasedLicensing" Value="0"/>
#   <Property Name="SCLCacheOverride" Value="0"/>
#   <Property Name="AUTOACTIVATE" Value="1"/>
#   <Updates Enabled="TRUE"/>
#   <RemoveMSI/>
# </Configuration>
# "@





#     # Génère le XML complet
    $xml = @"
<Configuration ID="a982351e-c99a-456e-82ec-8a6c38d4864f">
  <Add OfficeClientEdition="64" Channel="Current">
    <Product ID="O365ProPlusRetail">
      <Language ID="$language"/>
$excludeXml
    </Product>

  </Add>
  <Property Name="SharedComputerLicensing" Value="0"/>
  <Property Name="FORCEAPPSHUTDOWN" Value="FALSE"/>
  <Property Name="DeviceBasedLicensing" Value="0"/>
  <Property Name="SCLCacheOverride" Value="0"/>
  <Property Name="AUTOACTIVATE" Value="1"/>
  <Updates Enabled="TRUE"/>
  <RemoveMSI/>
</Configuration>
"@












    # Écrit le fichier temporaire
    $xml | Out-File -Encoding UTF8 -FilePath $tempXml

    # Vérifie si setup.exe est présent
    if (!(Test-Path $setupPath)) {
        try {
            $url = "https://raw.githubusercontent.com/Raad2002/My_pwd_scripte_1_by_1/main/setup/setup.exe"

            
            Invoke-WebRequest -Uri $url -OutFile $setupPath
            Start-Sleep -Seconds 2
            Unblock-File -Path $setupPath
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Échec du téléchargement de setup.exe.")
            return
        }

        if ((Get-Item $setupPath).Length -lt 500000) {
            [System.Windows.Forms.MessageBox]::Show("Le fichier téléchargé semble invalide ou corrompu.")
            return
        }
    }

    # Lance l’installation
    Start-Process -FilePath $setupPath -WorkingDirectory (Split-Path $setupPath) -ArgumentList "/configure `"$tempXml`"" -Verb RunAs
})



$UninstallOfficeButton = $Window.FindName("UninstallOfficeButton")
$UninstallOfficeButton.Add_Click({
    $setupPath = "$env:TEMP\setup.exe"
    $tempXml = [System.IO.Path]::Combine($env:TEMP, "UninstallConfig.xml")
    $selectedLang = $LanguageSelector.SelectedItem.Tag

    # Vérifie si setup.exe est présent, sinon le télécharge depuis GitHub
    if (!(Test-Path $setupPath)) {
        try {
            $url = "https://raw.githubusercontent.com/Raad2002/My_pwd_scripte_1_by_1/main/setup/setup.exe"
            Invoke-WebRequest -Uri $url -OutFile $setupPath
            Start-Sleep -Seconds 2
            Unblock-File -Path $setupPath
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Échec du téléchargement de setup.exe.")
            return
        }

        if ((Get-Item $setupPath).Length -lt 500000) {
            [System.Windows.Forms.MessageBox]::Show("Le fichier téléchargé semble invalide ou corrompu.")
            return
        }
    }


    # Dictionnaire des Product IDs
    $productMap = @{
    Access = "AccessRetail"
    AccessRuntime = "AccessRuntimeRetail"  
    Excel = "O365ProPlusRetail"
    Groove = "O365ProPlusRetail"
    Skype = "LyncRetail"
    OneDrive = "O365ProPlusRetail"
    OneNote = "O365ProPlusRetail"
    OutlookClassic = "O365ProPlusRetail"
    OutlookNew = "O365ProPlusRetail"
    PowerPoint = "O365ProPlusRetail"
    Publisher = "O365ProPlusRetail"
    Teams = "TeamsRetail"
    Word = "O365ProPlusRetail"
    Visio = "VisioPro2024Volume"
    Project = "ProjectPro2024Volume"
}

    # Récupère les apps cochées
    $appsToRemove = @()
    if ($AccessCheck.IsChecked) { $appsToRemove += "Access" }
    if ($ExcelCheck.IsChecked) { $appsToRemove += "Excel" }
    if ($GrooveCheck.IsChecked) { $appsToRemove += "Groove" }
    if ($SkypeCheck.IsChecked) { $appsToRemove += "Skype" }
    if ($OneDriveCheck.IsChecked) { $appsToRemove += "OneDrive" }
    if ($OneNoteCheck.IsChecked) { $appsToRemove += "OneNote" }
    if ($OutlookClassicCheck.IsChecked) { $appsToRemove += "OutlookClassic" }
    if ($OutlookNewCheck.IsChecked) { $appsToRemove += "OutlookNew" }
    if ($PowerPointCheck.IsChecked) { $appsToRemove += "PowerPoint" }
    if ($PublisherCheck.IsChecked) { $appsToRemove += "Publisher" }
    if ($TeamsCheck.IsChecked) { $appsToRemove += "Teams" }
    if ($WordCheck.IsChecked) { $appsToRemove += "Word" }
    # if ($VisioCheck.IsChecked) { $appsToRemove += "Visio" }
    # if ($ProjectCheck.IsChecked) { $appsToRemove += "Project" }

    if ($appsToRemove.Count -eq 0) {
        [System.Windows.Forms.MessageBox]::Show("Aucune application sélectionnée pour la désinstallation.")
        return
    }

    # Génère les blocs <Product>
    $removeXml = $appsToRemove | ForEach-Object {
        $id = $productMap[$_]
        @"
    <Product ID="$id">
      <Language ID="$selectedLang"/>
    </Product>
"@
    }

    # Assemble le XML complet
    $xmlContent = @"
<Configuration>
  <Remove>
$removeXml
  </Remove>
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
"@

    # Écrit le fichier temporaire
    $xmlContent | Out-File -Encoding UTF8 $tempXml
    

    # Lance setup.exe avec le fichier temporaire
    Start-Process -FilePath $setupPath -WorkingDirectory (Split-Path $setupPath) -ArgumentList "/configure `"$tempXml`"" -Verb RunAs
    [System.Windows.Forms.MessageBox]::Show("désinstallation en cour.")
})









$ActiveOfficeButton = $Window.FindName("ActiveOfficeButton")
$ActiveOfficeButton.Add_Click({

    # ✅ Notification non bloquante dans la barre des tâches
    $notify = New-Object System.Windows.Forms.NotifyIcon
    $notify.Icon = [System.Drawing.SystemIcons]::Information
    $notify.BalloonTipTitle = "Activation"
    $notify.BalloonTipText = "Activation en cours..."
    $notify.Visible = $true
    $notify.ShowBalloonTip(3000)  # Affiche pendant 3 secondes

    # 📥 Téléchargement et correction des scripts
    $tempPath = [System.IO.Path]::GetTempPath()
    $repoBase = "https://raw.githubusercontent.com/Raad2002/My_pwd_scripte_1_by_1/main/scripte_cmd"
    $scripts = @("MAS_AIO.cmd", "SetupComplete.cmd")

    foreach ($script in $scripts) {
        $url = "$repoBase/$script"
        $dest = Join-Path $tempPath $script
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing

        # 🔧 Corriger les fins de ligne et ajouter une ligne vide
        $content = Get-Content $dest -Raw
        $fixedContent = ($content -replace "`n", "`r`n") + "`r`n"
        Set-Content -Path $dest -Value $fixedContent -Encoding ASCII
    }

    # 🚀 Exécuter SetupComplete.cmd avec élévation
    $setupScript = Join-Path $tempPath "SetupComplete.cmd"
    Start-Process -FilePath $setupScript -Verb RunAs
})





# 🪟 Afficher la fenêtre
$window.ShowDialog()
