import { api, LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import getAccountRecordsList from '@salesforce/apex/LWCAccountController.getAccountRecordsList';
import getExchangeRates from '@salesforce/apex/CFP_fetchExchangeRates.fetchExchnageRateforBase';
import insertExchangerates from '@salesforce/apex/CFP_fetchExchangeRates.insertExchangerates';


export default class AddExchangeRate extends LightningElement {
    @track exchangerates;
    @track columns;
    @track dispdata;
    @api recordId;
    @track rec;
    @track mapData=[];
    @track columns = [
        { label: 'Against Currency', fieldName: 'againstcur', type: 'text' },        
        { label: 'Rate', fieldName: 'rate', type: 'decimal' },   
    ];

    myconnectedCallback(){
        this.rec=this.recordId;
        console.log('inside call back');
        getExchangeRates({rec:this.rec})
            .then(result=>{
                if(result){
                    console.log('inside data');
                    console.log(result);
                    this.dispdata = result;
                    console.log(this.dispdata);
                    console.log('disp initial');
                    /*for (var i =0; i< this.dispdata.length; i++){
                        console.log(this.dispdata[i]);
                    }*/
                    //console.log(temp);
                    //console.log(temp['CAD']);
                    //for(var mapKey in temp){
                        //this.mapData.push({'againstcur':mapKey,'rate':temp[mapKey]});
                   // }
                    /*for(var i in this.mapData){
                        console.log(mapData[i]);
                    }*/
                    //console.log(mapData);
                }

            })
            .catch(error=>{
                console.log('catch error');
            });
    }

    fetchSelectedRows(){
        console.log('inside fetchSelectedRows');
        var dtable = this.template.querySelector('lightning-datatable');
        console.log(dtable);
        var dtableData = dtable.getSelectedRows();
        console.log(dtableData);
        var temp = JSON.stringify(dtableData);
        console.log('tester');
        console.log('temp  ' + temp);
        this.rec=this.recordId;
        insertExchangerates({rcvdData:temp, recid:this.rec})
            .then(result=>{
                //this.template.querySelector("lightning-datatable").draftValues = [];
                window.location.reload();
                console.log('YESSSSSSSS')
                const evt = new ShowToastEvent({
                    title: 'Toast Success',
                    message: 'Exchange rates Added Successfully',
                    variant: 'success',
                    mode: 'dismissable'
                });
                this.dispatchEvent(evt);
                //this.template.querySelector("lightning-datatable").draftValues = [];
                console.log('DOT');
            })
            .catch(error=>{});
    }
}