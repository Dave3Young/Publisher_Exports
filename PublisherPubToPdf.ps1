<# 
Disclaimer: This script is provided for educational and informational purposes only and is offered "as is" with no warranty or guarantee of any kind.
    By using this script, you accept full responsibility for any consequences, including but not limited to data loss, system instability, or unintended results.
    Use at your own risk.

  Description:  For each .pub file in the current folder or subfolders, call Publisher to export to pdf format.

  Before running:  Create a folder and subfolders on your local drive and download the .pub files from SharePoint or OneDrive
      
                   Copy this script to that folder and run one of the command formats below:
   To run:
      Open a PowerShell session and type

        .\PublisherPubToPdf.ps1 -Filter "*.pub"

    or
    
        .\PublisherPubToPDF.ps1 -Filter "*.pub" -Recurse

#>
param
(
    [ValidateNotNullOrEmpty()]
    [string]
    $Filter,

    [switch]
    $Recurse
)

if (-not $PSBoundParameters.ContainsKey('Filter')) {
    Write-Error "The -Filter parameter is required."
    exit 1
}

if (-not ($Filter -like "*.pub")) {
    Write-Error "The filter must specify .pub files (e.g., '*.pub' or 'file.pub')."
    exit 1
}

try {

    $files = Get-ChildItem $Filter -File -Recurse:$Recurse

    if (-not $files) {
        Write-Error "No Publisher files found for the filter: $Filter"
        exit 1
    }

    Write-Output "Running..."

    try {
        $app = New-Object -ComObject Publisher.Application
    }
    catch {
        Write-Error "Microsoft Publisher is not installed or accessible."
        exit 1
    }

    $successCount = 0
    $failCount = 0

    # PDF output format
    $PDF_FORMAT = 2

    foreach ($file in $files) {

        if ($file.Extension -ieq ".pub") {

            $fileFullName = $file.FullName
            $pdfFilePath = [System.IO.Path]::ChangeExtension($fileFullName, ".pdf")

            if (Test-Path $pdfFilePath) {
                Write-Error "PDF file already exists: $pdfFilePath"
                $failCount++
                continue
            }

            try {
                $doc = $app.Open($fileFullName)
            }
            catch {
                $failCount++
                Write-Error "Error opening file: $fileFullName"
                Write-Error $_
                continue
            }

            if (-not $doc) {
                $failCount++
                Write-Error "Failed to open file: $fileFullName"
                continue
            }

            try {

                Write-Output "Converting: $fileFullName"

                $doc.ExportAsFixedFormat(
                    $PDF_FORMAT,
                    $pdfFilePath
                )

                if (Test-Path $pdfFilePath) {
                    Write-Output "Exported: $pdfFilePath"
                    $successCount++
                }
                else {
                    Write-Error "Failed to export file: $fileFullName"
                    $failCount++
                }

            }
            catch {
                $failCount++
                Write-Error "Error during export of $fileFullName"
                Write-Error $_
            }
            finally {

                try {
                    if ($doc) {
                        $doc.Close()
                    }
                }
                catch {
                }

            }
        }
    }

    Write-Output ""
    Write-Output "================================="
    Write-Output "Conversion Complete"
    Write-Output "Successful: $successCount"
    Write-Output "Failed:     $failCount"
    Write-Output "================================="

}
catch {
    Write-Error $_
}
finally {

    try {
        if ($app) {
            $app.Quit()
        }
    }
    catch {
    }

    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
}