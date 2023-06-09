public class CurrencyConverterClass {
    public static void convertCurrencyToINR(String cur){
        Decimal inr = 0.0;
        
        HTTP h = new HTTP(); //create http request CurrencyConverterClass.convertCurrencyToINR(eur)
        HTTPRequest req = new HTTPRequest();
        String rateurl = 'https://api.exchangerate.host/latest?base='+ cur;
        //req.setEndpoint('https://api.exchangeratesapi.io/latest');
        req.setEndpoint(rateurl);
        req.setMethod('GET');
        
        HTTPResponse res = h.send(req); 
        
        Map<String,Object> jsonBody = (Map<String,Object>)Json.deserializeUntyped(res.getBody());
        
        System.debug(jsonBody);
        
        Map<String,Object> mMap = (Map<String,Object>) jsonBody.get('rates');
        
        //Decimal conversionrate = (Decimal) mMap.get('INR');
        System.debug(mMap);
        
        //inr = eur * conversionrate;
        
        //return inr;
    }
}