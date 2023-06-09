trigger tagAccount on Contact (after insert) {
    Account acc = [select id from Account limit 1];
    List<Contact> contactList = new List<Contact>();
    for(Contact con : trigger.Old){
        con.AccountId = acc.Id;
        contactList.add(con);
    }
    
    if(!contactList.isEMpty()){
        update contactList;
    }
}