global class SendEmailThirtyFirstDecember implements Database.Batchable<String> {
	global Iterable<String> start(Database.BatchableContext context) {
       return new List<String> {'kartikchopade90@gmail.com'};
    }
    global void execute(Database.BatchableContext context, List<String> scope) {
        String Emailad = scope[0];
        List<String> emailaddress = new List<String>();
        emailaddress.add(Emailad);
        String emailBody = system.Label.Custom_Metadata_link;
        string emailsub = 'Please Update Your Metadata Today Date is 31st December';
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(emailaddress);
        email.setSubject(emailsub);
        email.setPlainTextBody(emailBody);
        email.setHtmlBody(emailBody);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
    global void finish(Database.BatchableContext context) {
        system.debug('Email Send Successfully');
    }
}