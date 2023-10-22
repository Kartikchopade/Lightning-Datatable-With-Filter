public class GenerateAndDownloadPDFController {
    private ApexPages.StandardController stdController;
     public Boolean showData { get; set; }
    public GenerateAndDownloadPDFController(ApexPages.StandardController sc){
        this.stdController = sc;
        showData = false;
    }
    // Method to generate and download the PDF
    public void generateAndDownloadPDF() {
        
        String quoteId = ApexPages.CurrentPage().getParameters().get('id');
        PageReference pdfPage = Page.GenerateAndDownloadPDFPage; // Replace with your Visualforce page name.
        pdfPage.getParameters().put('id', quoteId); // Replace with the record's ID.
        Blob pdfBlob;
        
        try {
            system.debug('try');
            pdfBlob = pdfPage.getContentAsPDF();
        } catch (Exception e) {
            system.debug('catch');
            pdfBlob = Blob.valueOf('Error generating PDF: ' + e.getMessage());
        }
        
         ContentVersion cont = new ContentVersion();
        cont.Title = 'Quote PDF';
        cont.PathOnClient = 'GeneratedPDF.pdf';
        cont.VersionData = pdfBlob;
        cont.Origin = 'H';
        cont.ContentLocation = 'S';
        insert cont;
        ContentVersion contv = [select id,ContentDocumentId from ContentVersion where Id =:cont.Id];
        
       	ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = contv.ContentDocumentId; 
        cdl.LinkedEntityId = quoteId;
        cdl.ShareType = 'V'; 
        cdl.Visibility = 'AllUsers'; 
        insert cdl;
        
    }
     public List<Contact> getAccountContacts() {
        List<Contact> accountContacts = new List<Contact>();

        // Get the current Account record from the standard controller
        Account currentAccount = (Account)stdController.getRecord();

        // Check if the Account record is not null
        if (currentAccount != null) {
            // Query for related Contact records
            accountContacts = [SELECT Id, Name, Email
                              FROM Contact
                              WHERE AccountId = :currentAccount.Id];
        }

        return accountContacts;
    }
}