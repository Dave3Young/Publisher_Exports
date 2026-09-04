# Publisher_Exports
Scripts for exporting Publisher files to PDF format or extracting HTML and the original Images files

PublisherPubToHTMLPNGfilesFinal.ps1 = This PowerShell script will process all .pub files in a folder and extract HTML and Images files into a new subfolder 

    Open a PowerShell session and type
   
        for current folder only
            .\PublisherPubToHTMLPNGfilesFinal.ps1 -Filter "*.pub"
   
    or

        for recursive folder processing
            .\PublisherPubToHTMLPNGfilesFinal.ps1 -Filter "*.pub" -Recurse

  
PublisherPubToPdf.ps1 = This PowerShell script will read all .pub files in a folder and export to a PDF file

      Open a PowerShell session and type

        .\PublisherPubToPdf.ps1 -Filter "*.pub"

    or
    
        .\PublisherPubToPDF.ps1 -Filter "*.pub" -Recurse

Disclaimer: These scripts are provided for educational and informational purposes only and is offered "as is" with no warranty or guarantee of any kind.
    By using these scripts, you accept full responsibility for any consequences, including but not limited to data loss, system instability, or unintended results.
    Use at your own risk.
