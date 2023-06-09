import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {
    constructor(){
        super();
        console.log('Constructor - Parent Component');
    }

    connectedCallback(){
        console.log('connectedCall - Parent Component');
    }

    renderedCallback(){
        console.log('renderedCallback - Parent Component');
    }

    disconnectedCallback(){
        console.log('disconnectedCallback - Parent Componet');
    }

    errorCallback(){
        console.log('errorCallback - Parent Component');
    }
}