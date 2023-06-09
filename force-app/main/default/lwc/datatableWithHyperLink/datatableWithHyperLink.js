import { LightningElement,wire,api } from 'lwc';
import fetchAccounts from '@salesforce/apex/AccountHandlerController.fetchAccounts';
import { RecordFieldDataType } from 'lightning/uiRecordApi';

const columns = [   
    { label: 'Name', fieldName: 'AccountName', type: 'url', typeAttributes: { label: { fieldName: 'Name' }, target: '_blank'} },
    { label: 'Industry', fieldName: 'Industry' }
];

export default class DatatableWithHyperLink extends LightningElement {
    @api recordId;
    availableAccounts;
    error;
    columns = columns;

    @wire( fetchAccounts,{accountId:'$recordId'} )  
    wiredAccount( { error, data } ) {
        if ( data ) {
            let tempRecs = [];
            data.forEach( ( record ) => {
                let tempRec = Object.assign( {}, record );  
                tempRec.AccountName = '/' + tempRec.Id;
                tempRecs.push( tempRec );
                
            });
            this.availableAccounts = tempRecs;
            this.error = undefined;

        } else if ( error ) {
            this.error = error;
            this.availableAccounts = undefined;
        }

    }
}