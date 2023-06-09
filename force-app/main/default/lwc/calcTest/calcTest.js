import { LightningElement, track } from 'lwc';

export default class CalcTest extends LightningElement {
    firstNumber = 0;
    secondNumber = 0;
    @track result = 0;

    handleChanges(event){
        if(event.target.name == 'fnumber'){
            
                this.firstNumber = event.target.value;
            //this.firstNumber = event.target.value;

        }
        if(event.target.name == 'snumber'){
            
                this.secondNumber = event.target.value;
            console.log(this.secondNumber);
        }

        if(!this.firstNumber){
            this.firstNumber = 0;
        }
        if(!this.secondNumber){
            this.secondNumber = 0;
        }
        console.log('this.firstNumber2222'+this.firstNumber);
        console.log('this.secondNumber'+this.secondNumber);
        this.result = parseInt(this.firstNumber) + parseInt(this.secondNumber);
    }
}