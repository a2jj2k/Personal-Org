trigger OpportunityBeforeTrigger on Opportunity (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Opportunity opp : Trigger.NewMap.values()){
            if(opp.StageName == 'Needs Analysis'){
                System.debug('Inside Satge check');
               Boolean acceptCheck = OpportunityBeforeTriggerHandler.checkForAcceptedQuote(opp);
                System.debug(acceptCheck);
                if(acceptCheck == false){
                    opp.adderror('There should be atleast one Accepted Quote to change the status to Awaiting For Finance Approve');
                }
            }
        }
    }

}