import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {

    constructor(){
        super();
        console.log('Constructor - Child Component');
    }

    connectedCallback(){
        console.log('connectedCall - Child Component');
    }

    renderedCallback(){
        console.log('renderedCallback - Child Component');
    }

    disconnectedCallback(){
        console.log('disconnectedCallback - Child Componet');
    }

    errorCallback(){
        console.log('errorCallback - Child Component');
    }
}