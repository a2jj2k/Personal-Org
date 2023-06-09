import { LightningElement,track,wire } from 'lwc';

import { CurrentPageReference } from 'lightning/navigation';
import { registerListener, unregisterAllListeners, fireEvent } from 'c/pubsub';

export default class ContactDetailView extends LightningElement {

    @track receivedData;

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){

        registerListener('messagesend', this.handlemessagesend, this);
    }

    handlemessagesend(publisherMessage) {
        this.receivedData = publisherMessage;
    }

    disconnectedCallback() {
        unregisterAllListeners(this);
    }

}