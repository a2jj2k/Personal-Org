import { LightningElement, track, wire } from 'lwc';
import getContactDetails from '@salesforce/apex/ContactHandler.getContactDetails';
import EmailPreferencesStayInTouchReminder from '@salesforce/schema/User.EmailPreferencesStayInTouchReminder';

export default class ContactListView extends LightningElement {
    @track dispData;

    @wire(getContactDetails) contactRecords({error,data}){
        if(data){
            this.dispData = data;
        }else{
            this.dispData = undefined;
        }

    }
}