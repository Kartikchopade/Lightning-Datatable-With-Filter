public class GenerateAndDownloadPDFController1 {
	 public GenerateAndDownloadPDFController1(ApexPages.StandardController sc){
        
    }
     public PageReference generateAndDownloadPDF() {
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
         return null;
      }
    
}