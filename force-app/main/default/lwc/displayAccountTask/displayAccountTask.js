import { LightningElement,wire,track } from 'lwc';
import fetchAccountName from '@salesforce/apex/DisplayAccountTaskController.fetchAccountName';

const COLUMNS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Account Name', fieldName: 'Name'},
    { label: 'Type', fieldName: 'Type'},
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' }
];
export default class DisplayAccountTask extends LightningElement {
columns = COLUMNS;
@track accData = [];
@wire(fetchAccountName)
wiredAccount({data,error}){
if(data){
this.accData = data;
}
else  if(error){
    console.log(error);
}
}

}