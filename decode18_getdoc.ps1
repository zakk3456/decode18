#ダウンロード先を指定してね
$saveDirectory = "d:\decode2018_doc\"

$client = New-Object System.Net.WebClient
$downloadUrl = "https://eventmarketing.blob.core.windows.net/decode2018-after/"

# 存在するセッション(サイトからぶっこ抜いたやつ）
$tracks = (
"AI01", "AI02", "AI03", "AI04", "AI05", "AI06", "AI07", "AI08", "AI09", "AI10", "AI11", "AI12", "AI13", "AI14", "AI15", "AI16", "AI17", "AI18", "AI19", "AI51", "AI52", "AI53", "AI54", "AI55", "AI61", 
"AC01", "AC02", "AC03", "AC04", "AC05", "AC06", "AC07", "AC08", "AC09", "AC10", "AC11", "AC12", "AC13", "AC14", "AC15", "AC16", "AC17", "AC18", "AC19", "AC20", "AC51", "AC52", "AC53", "AC61", "AC62", 
"AD01", "AD02", "AD03", "AD04", "AD05", "AD06", "AD07", "AD08", "AD09", "AD10", "AD11", "AD12", "AD13", "AD14", "AD15", "AD16", "AD17", "AD18", "AD19", "AD20", "AD21", "AD22", "AD23", "AD24", "AD25", "AD26", "AD27", "AD28", "AD29", "AD30", "AD31", "AD32", "AD33", "AD34", "AD35", "AD36", "AD37", "AD38", "AD39", "AD40", "AD41", "AD42", "AD43", "AD44", "AD45", "AD46", "AD47", "AD51", "AD52", "AD53", "AD61", "AD62", "AD63", 
"CI01", "CI02", "CI03", "CI04", "CI05", "CI06", "CI07", "CI08", "CI09", "CI10", "CI11", "CI12", "CI13", "CI14", "CI15", "CI16", "CI17", "CI18", "CI19", "CI20", "CI21", "CI22", "CI23", "CI24", "CI25", "CI26", "CI27", "CI28", "CI29", "CI51", "CI52", "CI53", "CI54", 
"DA01", "DA02", "DA03", "DA04", "DA05", "DA06", "DA07", "DA08", "DA09", "DA10", "DA11", "DA12", "DA13", "DA14", "DA15", "DA16", "DA17", "DA18", "DA19", "DA20", "DA21", "DA22", "DA51", "DA52", "DA53", "DA54", "DA55", "DA56", "DA61", 
"SP01", "SP02", "SP03", "SP04", "SP05", "SP06", "SP07", "SP08", "SP61", "SP62"
)

#資料の拡張子
$exts = (".pptx", ".pdf")

[System.Console]::WriteLine("▼START")

foreach ($track in $tracks) 
{
    $compCount = 0
    foreach ($ext in $exts) 
    {
        $pref = ""
        if($ext -eq ".pptx")
        {
            $pref = "PPT"
        }
        else
        {
            $pref = "PDF"
        }
        $fileName = [string]::Format("decode2018_{0}_{1}{2}", $pref, $track, $ext)

        try 
        {
            $client.DownloadFile([System.IO.Path]::Combine($downloadUrl, $fileName), [System.IO.Path]::Combine($saveDirectory, $fileName))
            $compCount++
            [System.Console]::WriteLine("○: " + $fileName)
            break
        }
        catch
        {
        }
    }
    if($compCount -eq 0)
    {
        [System.Console]::WriteLine("×: " + $track)
    }
}
[System.Console]::WriteLine("▲END")
