import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import toastChecker from '@salesforce/apex/LWCAccountController.toastChecker';

export default class ToastCheck extends LightningElement {
    @track accountRecords;
    @track errors;

    showSuccessToast(){
        toastChecker()
            .then(result=>{
                this.accountRecords = result;
                console.log('Debug-Arun result1');
                console.log(this.accountRecords);
                this.dispToast(this.accountRecords);
                console.log('Debug-Arun result1');
                //dispToast();
            })
            .catch(error=>{
                this.errors = error;
            });
            console.log('Debug-Arun start');
            console.log(this.accountRecords);
            console.log(this.errors);
            console.log('Debug-Arun end');

    }

    dispToast(accountRecords){
        console.log('Inside dispToast');
        console.log(this.accountRecords);
        if(this.accountRecords == true){
            console.log('Inside dispToast if');
            const event = new ShowToastEvent({
                title: 'Error Message',
                message: 'For Wadogo IAP channel\nName,\nLegal Entity(to be filled on the Account),\nEmail,Billing Contact(to be filled on the Account),\nPhone(to be filled on the Billing Contact of the Account),\nBilling Country(to be filled on the Account),\nInMobi Account Manager(to be filled on the Account),\nIndustry(to be filled on the Account) \nare mandatory.',
                variant: 'error',
                mode: 'sticky'
            });
            this.dispatchEvent(event);

        }

    }

}