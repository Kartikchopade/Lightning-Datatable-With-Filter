global class UpdateDateYear implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext context) {
        
        String query = 'select id,Event_Date__c,Event_Description__c,Event_Title__c from HomePage__c';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext context, List<HomePage__c> scope) {
        List<HomePage__c> recordsToUpdate = new List<HomePage__c>();
        
        for (HomePage__c record : scope) {
            HomePage__c h = new HomePage__c();
            Integer eventday = (record.Event_Date__c).day();
            Integer eventmonth = (record.Event_Date__c).month();
            //system.debug(eventday);
            //system.debug(eventmonth);
            
            Date todate = system.today();
            Integer yeardate = todate.year()+1;
           // string newdate = eventday+'/'+eventmonth+'/'+yeardate;
            //string newdate = yeardate+'-'+eventmonth+'-'+eventday;
            Date newdate = Date.newInstance(yeardate, eventmonth, eventday);
            h.id = record.id;
            h.Event_Date__c =newdate;
            //system.debug(newdate);
            recordsToUpdate.add(h);            
        }
        if(!recordsToUpdate.isEmpty()){
            update recordsToUpdate;
        }
       
    }
    
    global void finish(Database.BatchableContext context) {
        system.debug('Years Successfully Updated');
    }
    
}