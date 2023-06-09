public with sharing class FileUploadController {
    public FileUploadController() {

    }

    @AuraEnabled
    public static String loadData( Id contentDocumentId ) {
        String strMessage='Records loaded successfully';
        if ( contentDocumentId != null ) {
            ContentVersion contentVersionObj = [ SELECT Id, VersionData FROM ContentVersion WHERE ContentDocumentId =:contentDocumentId ];
            List < String > records = contentVersionObj.VersionData.toString().split( '\n' );
            System.debug(records);
			 //Removing the Header
            records.remove( 0 );
            System.debug('ARUN FILE CONTENT STARTS');
            for ( String record : records ) {
                if ( record != null ) {
                    List < String > row = record.split( ',' );
                    System.debug(row);
                }
            }
            System.debug('ARUN FILE CONTENT ENDS');
        }

        return strMessage;
    }

    @AuraEnabled (cacheable=true)
    public static List<Contact> fetchContacts(){
        return [SELECT Id, Name, Email, Phone, LeadSource, AccountId
                FROM Contact
                LIMIT 2000];
    }
}