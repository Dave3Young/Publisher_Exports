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
