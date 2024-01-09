#Deployment script for agent status checking and re-linking to Tenable IO
$out = "& 'C:\Program Files\Tenable\Nessus Agent\nessuscli.exe'  agent status" | findstr "Link status: Connected to cloud.tenable.com:443"

if($out){
    #Write-Host "Link confirmed. Exit"
    break
}else{
    #Write-Host "Agent Unlinked"
    "& 'C:\Program Files\Tenable\Nessus Agent\nessuscli.exe' agent unlink"
    "& 'C:\Program Files\Tenable\Nessus Agent\nessuscli.exe' agent link --key=(key) --host=cloud.tenable.com:443"
}
