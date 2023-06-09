trigger tagAccount on Contact (after insert) {
    Account acc = [select id from Account limit 1];
    List<Contact> contactList = new List<Contact>();
    for(Contact con : trigger.New){
        if(Trigger.isAfter && Trigger.isInsert){
            Contact c = new Contact(Id = con.id);
        c.AccountId = acc.Id;
        contactList.add(c);
        }
        
    }
    
    if(!contactList.isEMpty()){
        update contactList;
    }
}