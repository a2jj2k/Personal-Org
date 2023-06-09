public with sharing class ContactHandler {
    public ContactHandler() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactDetails(){
        return [select id,Name,Email,Phone from contact limit 20];
    }
}