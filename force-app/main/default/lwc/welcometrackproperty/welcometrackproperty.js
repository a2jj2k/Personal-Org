import { LightningElement, track } from 'lwc';

export default class Welcometrackproperty extends LightningElement {
      fullName = { firstName : 'Micky', lastName : 'Mouse' };
    
    

    changeSurname(event){
        this.fullName.lastName='Mice';
        
    }
}