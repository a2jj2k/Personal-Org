public with sharing class DisplayAccountController {
    
    @AuraEnabled(cacheable=true)
    public static integer getContactCount(String recid){
        System.debug('recordIdd'+ recid);
        Account acc = [select id,(select id from contacts) from Account where id =: recid];
        return acc.contacts.size();
    }
}
