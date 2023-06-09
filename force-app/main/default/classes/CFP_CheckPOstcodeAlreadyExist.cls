/********************************************************************************************************************
Name : CFP_CheckPOstcodeAlreadyExist
Description : 	This class is a invocable class called from screen Flow "MDU_Bulk UPRns" which get the input UPRNs 
separated by delimiter.This class will  return  the duplicate UPRNs from given string 
ClassName  : MDU_CheckPremisesAlreadyExist_Test

Version                 Date                      Author                           Summary Of Change
-------------------------------------------------------------------------------------------------------------------- 
1.0                    07/06/2021                Arun Jose 	                          Class created         
**********************************************************************************************************************/

public class CFP_CheckPOstcodeAlreadyExist {
    @InvocableMethod( label='Check Postcode Exists' description='Checking Postcodes exist' )
  
    public static List < FlowOutput > CheckDuplicatePostcodess( List < FlowInput > inputs ) {
        
        FlowInput objInput = inputs.get( 0 );
        List < FlowOutput > outputs = new List < FlowOutput >();
        FlowOutput objOutput = new FlowOutput();
        String[] POSTCODES= objInput.AllPOSTCODES.split(objInput.Delimiter);
        List<Employee__c> queryPOSTCODES=[Select Employee_postcode__c from  Employee__c where Employee_postcode__c in :POSTCODES];  //querying into Premises LISt
        List<String> StringPOSTCODEList=new List<String>(); 
        String SinglePOSTCODE;
        for(Employee__c LoopPOSTCODE:queryPOSTCODES){
            SinglePOSTCODE=LoopPOSTCODE.Employee_postcode__c;
            StringPOSTCODEList.add(SinglePOSTCODE);      //adding all UPRNs to a string List - this is to show UPRNS in screen flow instead of IDs
        }
        objOutput.count = queryPOSTCODES.size();
        objOutput.OutputPOSTCODEList=StringPOSTCODEList;
        outputs.add ( objOutput );
        return outputs;   
    }

        
   //This class gets inputs from flow 
    public class FlowInput {
        @InvocableVariable
        public String AllPOSTCODES;  
        @InvocableVariable
        public String Delimiter;     
   }
    //This class send outputs to flow
    public class FlowOutput {   
        @InvocableVariable
        public Integer count; 
        @InvocableVariable
        public String[] OutputPOSTCODEList;
        
    }
   
}