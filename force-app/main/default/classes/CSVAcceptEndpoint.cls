@RestResource(urlMapping='/AFileUpload/*')
global with sharing class CSVAcceptEndpoint {
    @HttpPost
    global static void processFile() {
        //String myString;
        Map<String,String> bpIdMap = new Map<String,String>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Blob b = req.requestBody;
        
        String myString = b.toString();
        System.debug('Heeru');
        System.debug(myString);   
        List < String > records = myString.split( '\n' );
        System.debug(records);
        records.remove( 0 );
        for ( String record : records ) {
            if ( record != null ) {
                    List < String > row = record.split( ',' );
                    System.debug(row[0] + ' * '+ row[1]);
                	bpIdMap.put(row[0],row[1]);
                }
        }
        
        System.debug(bpIdMap);
        // Add data processing here based from Blob value
    }

}