global class SendEmailThirtyFirstDecemberSchedular implements Schedulable{
	global void execute(SchedulableContext sc) {
        SendEmailThirtyFirstDecember b = new SendEmailThirtyFirstDecember(); 
        database.executebatch(b);
    }
}