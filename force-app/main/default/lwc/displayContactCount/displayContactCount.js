import { LightningElement,api, wire,track } from 'lwc';
import getContactCount from '@salesforce/apex/DisplayAccountController.getContactCount';

export default class DisplayContactCount extends LightningElement {

    @track conCount=0;
    @api recordId;

    

    connectedCallback(){
        getContactCount({recid: recordId})
        .then(data=>{
            if(data){
                this.conCount = data;
            }
        })
        .catch(error=>{
            
        })
    }
}