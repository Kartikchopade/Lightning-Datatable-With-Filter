@RestResource(urlMapping='/Account/*')
global class RestApiForAccount {
	@HttpGet
    global static List<Account> getAccounts() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result = [SELECT Id, Name, Phone, Website,Rating FROM Account];
        return result;
    }
    @HttpPost
     global static String createAccount(List<cls_Account> requestData) {
         List<Account> acclist = new List<Account>();
         system.debug('Body: '+requestData);
         for(cls_Account wrap : requestData){
            Account acc = new Account();
        	acc.name= wrap.Name;
        	acc.phone=wrap.Phone;
        	acclist.add(acc);
         }
         if(!acclist.isEmpty()){
             insert acclist;
             return 'Record Inserted Successfully';
         }
        
        return 'Error';
    }
    global class AccountallList{
        public cls_Account[] getAccountData;
    }
    global class cls_Account{
        public String Name;
        public String Phone;
    }
    

}