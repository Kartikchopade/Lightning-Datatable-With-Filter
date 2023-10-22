public class ImageCaptureController {
	public ContentVersion cont {get;set;}
    public String recordId { get; set; }

    public ImageCaptureController() {
        cont = new ContentVersion();
        recordId = ApexPages.currentPage().getParameters().get('recordId');
        system.debug('record Id: '+recordId);
    }      

    public PageReference saveFile()
    {
        //PathOnClient is Mandatory
        cont.PathOnClient = cont.title;

        //By default Origin value is "C" that means Content must be enabled in Org, so we need to explicitly set Origin as H
        cont.Origin = 'H';
        insert cont;

        //redirect to path where file is saved
        //new PageReference('/'+cont.id);
        return null;
    }
}