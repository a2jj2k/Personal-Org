/********************************************************************************************************************
Name : CFP_fetchExchangeRates
Description : 	This class is a invocable class called from screen Flow "MDU_Bulk UPRns" which get the input UPRNs 
separated by delimiter.This class will  return  the duplicate UPRNs from given string 
ClassName  : CFP_fetchExchangeRates

Version                 Date                      Author                           Summary Of Change
-------------------------------------------------------------------------------------------------------------------- 
1.0                    20/06/2021                Arun Jose 	                          Class created         
**********************************************************************************************************************/
public with sharing class CFP_fetchExchangeRates {
    public CFP_fetchExchangeRates() {

    }

    @AuraEnabled(cacheable=true)
    public static List <Pload> fetchExchnageRateforBase(String rec){
    //public static List <Pload> fetchExchnageRateforBase(String rec){
        
        System.debug('Arun ; ' + rec);
        Currency__c cur= [select Name,Id from Currency__c where Id = :rec];
        System.debug(cur.Name);
        List<Account> allsurveys = [select Id,Name from Account];
        //System.debug(allsurveys);
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        String rateurl = 'https://api.exchangerate.host/latest?base='+ cur.Name;
        req.setEndpoint(rateurl);
        req.setMethod('GET');

        HTTPResponse res = h.send(req);

        Map<String,Object> jsonBody = (Map<String,Object>)Json.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
        Map<String,Object> mMap = (Map<String,Object>) jsonBody.get('rates');
        System.debug('ZZZ');
        System.debug(mMap.size());
        List <Pload> returnOutputs = new List <Pload>();
        returnOutputs = payloadMaker(mMap);
        //STring returnOutputs = 'NOT GOOD';
        System.debug('XXX');
        System.debug(returnOutputs);
        System.debug(returnOutputs.size());
        for(integer i=0; i<100; i++){
            System.debug(returnOutputs[i]);
        }
        System.debug('YYY');
        System.debug(returnOutputs.size());
        //JSON.serialize(result)
        return returnOutputs;
    }

    public static List <Pload> payloadMaker(Map<String,Object> mMap){
        List <Pload> outputs = new List <Pload>();
        Set <String> mKeys = new Set <String>();
        mKeys = mMap.keySet();
        for(String str :mKeys){
            Pload p = new Pload();
            p.againstcur = str;
            //String s = (String)mMap.get(str);
            p.rate = (Decimal)mMap.get(str);
            outputs.add(p);
        }
        System.debug('ROYAL');
        System.debug(outputs);
        return outputs;

    }

    @AuraEnabled
    public static void insertExchangerates(String rcvdData, String recid){
        System.debug('Inside DEZ');
        List<ExchangeRateWrapper> varname =  (List<ExchangeRateWrapper>)JSON.deserialize(rcvdData, List<ExchangeRateWrapper>.class);
        System.debug('KEVIN');
        System.debug(varname);
        List<Exchangerate__c> exchangeratelist = new List<Exchangerate__c>();
        for(ExchangeRateWrapper e :varname){
            Exchangerate__c exchange = new Exchangerate__c();
            exchange.Name = e.againstCur;
            exchange.rate__c = e.rate;
            exchange.Base_Currency__c = recid;
            exchangeratelist.add(exchange);
        }
        System.debug('insertdata');
        System.debug(exchangeratelist);
        Database.upsert(exchangeratelist);
        //upsert exchangeratelist;
        System.debug('executed');
    }

    public class Pload{
        @AuraEnabled public String againstcur;
        @AuraEnabled public Decimal rate;
    }

    public class ExchangeRateWrapper{
        public String againstCur;
        public Decimal rate;
    }
}