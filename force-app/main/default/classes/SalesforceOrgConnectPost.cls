public class SalesforceOrgConnectPost {
	public static void SalesoforceA_PostMethod(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
       	req.setEndpoint('callout:SalesforceAccount/services/apexrest/api/Account/');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        req.setBody('{"Name":"savage crocodile","Phone":"7350721353","Description":"My POST RestApi"}');
        HttpResponse res = http.send(req);
        system.debug('Response: '+res.getStatusCode()+ ' ' + res.getBody());
        if(res.getStatusCode() == 200){
            system.debug(res.getBody());
        }
        else{
             System.debug('The status code returned was not expected: '+res.getStatusCode()+ ' ' + res.getStatus());
        }
    }
    public static void SalesforceA_DeleteMethod(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('DELETE');
       	req.setEndpoint('callout:SalesforceAccount/services/apexrest/api/Account/0015i00000fv3MkAAI');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            system.debug('Successfully Deleted...'+res.getBody());
        }
        else{
             System.debug('The status code returned was not expected: '+res.getStatusCode()+ ' ' + res.getStatus());
        }
    }
    public static void SalesforceA_PutMehtod(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('PUT');
       	req.setEndpoint('callout:SalesforceAccount/services/apexrest/api/Account/0015i00000fv3oUAAQ');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setBody('{"Name":"Sanika Yeole","Phone":"9167001640"}');
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            system.debug('Successfully Updated...'+res.getBody());
        }
        else{
             System.debug('The status code returned was not expected: '+res.getStatusCode()+ ' ' + res.getStatus());
        }
    }
    public static void SalesforceA_PatchMethod(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('PATCH');
        req.setEndpoint('callout:SalesforceAccount/services/apexrest/api/Account/0015i00000fv3oUAAQ');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setBody('{"Name":"Mantesh Sharma"}');
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            system.debug('Single Name Field Updated Successfully...'+res.getBody());
        }
        else{
             System.debug('The status code returned was not expected: '+res.getStatusCode()+ ' ' + res.getStatus());
        }
    }
}