public class OpportunityBeforeTriggerHandler {
    public static Boolean checkForAcceptedQuote(Opportunity opp){
        Boolean acceptCheck=false;
        List<Quote> quoteList = [Select Id from Quote where Status = 'In Review'and Opportunity.Id =: opp.id];
        System.debug('arunquoteList');
        System.debug(quoteList);
        if(quoteList.size() > 0){
            //opp.adderror('There should be atleast one Accepted Quote to change the status to Awaiting For Finance Approvedddd');
        System.debug(quoteList.size());
        acceptCheck=true;
    }
        return acceptCheck;
    }
    

}