# Publisher_Exports
**Converting to PowerPoint or Canva?** Use the stage 1 script at [PublisherToPPTX](https://github.com/Dave3Young/PublisherToPPTX) instead.
It writes the same HTML and image files, plus the page size and text layout files that its stage 2 needs to build a .pptx.

These Scripts export Publisher files to PDF format or extract HTML and the original Image files

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

Disclaimer: These scripts are provided "as is" with no warranty or guarantee of any kind.
    By using these scripts, you accept full responsibility for any consequences, including but not limited to data loss, system instability, or unintended results.
    Use at your own risk.

See https://david-e-young.com/microsoft-publisher-retirement/ blog post for more information.
