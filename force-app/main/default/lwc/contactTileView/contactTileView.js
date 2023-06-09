import { api, LightningElement,wire } from 'lwc';

import { CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';


export default class ContactTileView extends LightningElement {
    @api showContactInfo=false;
    @api contactInfo;

    @wire(CurrentPageReference) pageRef;

    handleTileClick(){

        console.log("inside handleTileCLick - pubsub");
        console.log("---contact info started-------");
        console.log(this.contactInfo);
        console.log("---contact info ended-------");

        fireEvent(this.pageRef,'messagesend', this.contactInfo);
    }
}