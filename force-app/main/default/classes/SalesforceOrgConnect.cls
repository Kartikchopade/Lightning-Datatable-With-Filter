public class SalesforceOrgConnect {
	public static void connectSlaesforceOrgA(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        //req.setEndpoint('https://playful-impala-l4gvn2-dev-ed.trailblaze.my.salesforce.com/services/apexrest/api/Account ');
        req.setMethod('GET');
       	req.setEndpoint('callout:SalesforceAccount/services/apexrest/api/Account/');
        //req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //req.setHeader('Authorization','Bearer !AQEAQFwjf4t2bAbhI2pb6h68qx2W_mgNoTUA8GsWwslsC2Kr5KskVJWyWf9WiO43AJJGL3CSFWZh0CtqDdUp0xjuw8NT8rYW');
         HttpResponse res = http.send(req);
        system.debug('Response: '+res.getStatusCode()+ ' ' + res.getBody());
         if(res.getStatusCode() == 200){
             List<Account> acclist = new List<Account>();
             /*List<object> results = (List<object>)JSON.deserializeUntyped(res.getBody());
             for(object result : results){
                 
                 //acclist.add(result);
                 system.debug(result);
             }*/
             string jsonBody = res.getBody();
             List<Account_Wrapper> Wrapper = (List<Account_Wrapper>)JSON.deserialize(jsonBody,List<Account_Wrapper>.class);
             for(Account_Wrapper w : Wrapper){
                 Account ac = new Account();
                 ac.Name = w.name;
                 ac.Phone =w.phone;
                 ac.Website = w.website;
                 acclist.add(ac);
                 system.debug(w);
             }
             if(!acclist.isEmpty()){
                 insert acclist;
             }
             //return res.getBody();
         }
         //return '';
    }
    public class Account_Wrapper{
        public String name;
        public String phone;
        public String website;
    }
}