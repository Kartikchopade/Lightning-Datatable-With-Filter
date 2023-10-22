public class SendSmsVonage {
	public static void sendSMS() {
        String apiKey = '67d06461';
        String apiSecret = 'bfFsyuybbpY9poN4';
        String fromNumber = 'Vonage APIs';
        String toNumber = '+919067145519';
        String message = 'Hii This Message From Apex';
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://rest.nexmo.com/sms/json');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');

        String body = 'api_key=' + apiKey +
                      '&api_secret=' + apiSecret +
                      '&from=' + EncodingUtil.urlEncode(fromNumber, 'UTF-8') +
                      '&to=' + EncodingUtil.urlEncode(toNumber, 'UTF-8') +
                      '&text=' + EncodingUtil.urlEncode(message, 'UTF-8');

        req.setBody(body);

        HttpResponse res = new Http().send(req);
        if (res.getStatusCode() == 200) {
            System.debug('SMS sent successfully.');
        } else {
            System.debug('Failed to send SMS. Response: ' + res.getBody());
        }
    }
}