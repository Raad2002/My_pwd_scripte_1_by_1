



[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')



# ✅ XAML minimal compatible
$input = @'
<Window x:Class="generate_xmal.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:generate_xmal"
        mc:Ignorable="d"
        Title="MainWindow" Height="250" Width="400" WindowStartupLocation="CenterScreen" ResizeMode="NoResize">
    <Grid Background="#FF252525" >
        <StackPanel HorizontalAlignment="Center" Margin="0,30,0,0" Orientation="Vertical" VerticalAlignment="Top" Height="172">

            <Button x:Name="btnInstallApp" Content="Installer App" Width="236"  BorderBrush="White" Height="39" FontSize="20" FontFamily="Cooper Black" Background="#FF494949" Foreground="#FFE6FF00" Padding="1,1,1,1" Margin="0,0,0,25"/>
            <Button x:Name="btnInstallOffice" Content="Installer Office"  Width="236"  Background="#FF494949" BorderBrush="White" Height="40" FontSize="20" FontFamily="Cooper Black" Foreground="#FFE6FF00" Margin="0,0,0,25"/>
            <Button x:Name="btnInstallSpotify" Content="Installer Spotify"  Background="#FF494949" BorderBrush="White" FontSize="20" FontFamily="Cooper Black" Foreground="#FFE6FF00" Height="40" Width="238"/>

        </StackPanel>

    </Grid>

</Window>
'@





# 🧱 Charger le XAML
$input = $input -replace '^<Window.*', '<Window' -replace 'mc:Ignorable="d"','' -replace "x:N",'N' 
[xml]$xaml = $input
$xmlreader=(New-Object System.Xml.XmlNodeReader $xaml)
$xamlForm=[Windows.Markup.XamlReader]::Load( $xmlreader )


$xaml.SelectNodes("//*[@Name]") | ForEach-Object -Process {
    Set-Variable -Name ($_.Name) -Value $xamlForm.FindName($_.Name)
    }






# 🎯 Attacher les événements
$btnInstallApp.Add_Click({
     try {
        Start-Process powershell.exe -Verb RunAs -WindowStyle Hidden -ArgumentList '-ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/Raad2002/clone/main/Run.ps1 | iex"'
    }
    catch {
        [System.Windows.MessageBox]::Show("Erreur lors du lancement du script avec élévation.`n$_")
    }
})


$btnInstallOffice.Add_Click({
    try {
        Start-Process powershell.exe -Verb RunAs -WindowStyle Hidden -ArgumentList '-ExecutionPolicy Bypass -Command ""'
    }
    catch {
        [System.Windows.MessageBox]::Show("Erreur lors du lancement du script avec élévation.`n$_")
    }
})



 $btnInstallSpotify.Add_Click({

        iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on  -new_theme -adsections_off -lyrics_stat spotify"
    
    })






# 🪟 Afficher la fenêtre
$xamlForm.ShowDialog() | out-null
pause