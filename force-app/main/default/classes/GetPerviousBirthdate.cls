public class GetPerviousBirthdate {
@InvocableMethod(label='Get previous Birthdate')
    public static List<Date> getPreviousBirthdate(List<Date> PrevBirthdate)
    {
        //List<Contact> con = [select Id,Lastname,Birthdate,Previous_Birthdate__c from contact where Id =: ContactId];
        
       // system.debug('Contact: '+con[0].Birthdate);
        system.debug('previous Birthdate: '+PrevBirthdate);
        return PrevBirthdate;
    }
}