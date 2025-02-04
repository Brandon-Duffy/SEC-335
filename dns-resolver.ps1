param (
    [string]$network_prefix,
    [string]$dns_server
)


for ($i = 1; $i -le 254; $i++) {
    $ip = "$network_prefix.$i"
    $hostResult = nslookup $ip $dns_server 2>$null | Select-String "Name:" | ForEach-Object { $_.ToString() -replace "Name:\s+", "" }

    if ($hostResult) { 
        Write-Host "$ip -> $hostResult"
    }
}
