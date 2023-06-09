public with sharing class AccountHandlerController {
    @AuraEnabled(cacheable = true)
    public static integer getContactCount(String recid){
        System.debug('ArunRecid' + recid);
        Account acc= [select id,(select id from Contacts) from Account where id =:recid];
        return acc.Contacts.size();
    }

    
}