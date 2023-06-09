public class ActionBtnTry {
    @AuraEnabled
    public static void populateRecordID(string recdid){
        System.debug('Record ID Passed : - ' +  recdid);
    
    }

}