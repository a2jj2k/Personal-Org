import { LightningElement,api, wire,track } from 'lwc';
import getContactCount from '@salesforce/apex/AccountHandlerController.getContactCount';

export default class ContactCount extends LightningElement {
    @api recordId;
    @track data=0;
    @track error;
    connectedCallback(){
        
    }

    @wire (getContactCount,{recid: '$recordId'})ContactCount({data,error}){
        if(data){
            this.data = data;
        }else{
            this.error = error;
        }
    }
}