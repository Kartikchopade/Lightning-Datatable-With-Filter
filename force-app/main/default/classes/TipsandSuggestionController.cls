public class TipsandSuggestionController {
    
    public Tips_Suggestion__c pos{get;set;}
    public List<Tips_Suggestion__c> funlist{get;set;}
     
		public TipsandSuggestionController() {
            
            if(System.Label.TipsandSuggestion > '0'){
               pos = [select Id,Daily_Tips__c ,Daily_Suggestion__c ,Daily_Question_Answer__c ,Daily_Intresting_Facts__c,Tips_Suggestion_Name__c   from Tips_Suggestion__c where Name =: System.Label.TipsandSuggestion limit 1];
                
            }else{
               funlist = [select Id,Daily_Tips__c ,Daily_Suggestion__c ,Daily_Question_Answer__c ,Daily_Intresting_Facts__c,Tips_Suggestion_Name__c   from Tips_Suggestion__c where Envorinment__c ='Env 1' order by CreatedDate Asc]; 
            }
            
            
		
		
        }
}
//order by CreatedDate DESC limit 1
//order by CreatedDate Asc