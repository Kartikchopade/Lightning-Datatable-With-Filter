public with sharing class DatatablewithFilterController {
    @AuraEnabled
    public Static List<String> getTypePicklist(){
        List<String> picklistValues = new List<String>();
        try {
            
            Schema.DescribeFieldResult fieldResult = 
                Schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap().get('Type').getDescribe();
            
            List<Schema.PicklistEntry> entries = fieldResult.getPicklistValues();
            
            for (Schema.PicklistEntry entry : entries) {
                picklistValues.add(entry.getLabel());
            }
        } catch (Exception e) {
            System.debug(e);
        }
        return picklistValues;
    }
    @AuraEnabled
    public Static List<Account> getAllAccounts(){
        List<Account> acclist = [select Id,Name,Phone,Type,Rating,Birthdate__c from Account];
        return acclist;
    }
    @AuraEnabled
    public static List<Account> getFilterAccount(String type,Date birthdate){
        system.debug('Type: '+type);
        system.debug('Birthdate: '+birthdate);
        String query = 'select Id,Name,Phone,Type,Rating,Birthdate__c from Account';
        if(type != ''){
            query +=' where Type =: type';
        }
        else if(birthdate != null){
            query +=' where Birthdate__c =: birthdate';
        }
        return Database.query(query);
    }
    @AuraEnabled
    public Static String getIpAddress(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.ipify.org?format=json');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200 && res.getStatus() == 'OK'){
            string jsonBody = res.getBody();
            getIpAddress wrapper = (getIpAddress)JSON.deserialize(jsonBody, getIpAddress.class);
            system.debug('Response: '+wrapper.ip);
            String ipAddress = wrapper.ip;
            return ipAddress;
        }
        return null;
    }
     @AuraEnabled
    public Static List<User> searchUsers(String keyword){
        String searchKey = '%' + keyword + '%';
        return [SELECT Id, LastName,FirstName FROM User WHERE LastName LIKE :searchKey];
    }
    
    public class getIpAddress{
        public String ip;	//101.53.172.8
    }
}