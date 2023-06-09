public with sharing class AccountHandlerController {
    @AuraEnabled(cacheable = true)
    public static integer getContactCount(String recid){
        //List<Account> acc = new List<Account>();
        Account acc= [select id,(select id from Contacts) from Account where id =:recid];
        return acc.Contacts.size();
    }

    @AuraEnabled(cacheable=true)
    public static List < Account > fetchAccounts(String accountId) {

        //String str = 'arun,jose,deepu';
        Account a = [select id,Description,Industry   from Account where id =:accountId];
        List<String> actids = a.Description.split(',');
        //List<Account> AcntLst = new List<Account>();
        System.debug(actids);
        return [SELECT Id, Name, Industry FROM Account where id in :actids];
        //return AcntLst;
    }

    
}