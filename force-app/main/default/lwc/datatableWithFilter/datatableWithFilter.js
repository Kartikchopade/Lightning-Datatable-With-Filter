import { LightningElement,track,api,wire } from 'lwc';
import getTypePicklist from '@salesforce/apex/DatatablewithFilterController.getTypePicklist';
import getAllAccounts from '@salesforce/apex/DatatablewithFilterController.getAllAccounts';
import getFilterAccount from '@salesforce/apex/DatatablewithFilterController.getFilterAccount';
const columns = [
		{ label: 'Account Name', fieldName: 'Name', type: 'text' },
		{ label: 'Phone Number', fieldName: 'Phone', type: 'text' },
		{ label: 'Account Type', fieldName: 'Type', type: 'text' },
		{ label: 'Account Rating', fieldName: 'Rating', type: 'text' },
		{ label: 'Birthdate', fieldName: 'Birthdate__c', type: 'text' },
];
export default class DatatableWithFilter extends LightningElement {
		@track selectedValue = '';
		@track picklistValues = [];
		@track selecteddate;
		columns = columns;
		data = [];
		@track showSpinner = false;

		connectedCallback() {
				this.loadPicklistValues();
				this.loadAccounts();
		}

		loadPicklistValues() {
				getTypePicklist()
						.then(result => {
						console.log('Data: ',result);
					this.picklistValues = result.map(value => ({ label: value, value: value }));
					
				})
						.catch(error => {
						console.log(error);
				});
		}
		loadAccounts() {
				this.showSpinner = true;
				getAllAccounts()
						.then(result => {
						console.log('Accounts: ',result);
					this.data = result;
						this.showSpinner = false;
				})
						.catch(error => {
						console.log(error);
				});
		}
		handleChange(event){
				this.selectedValue = event.detail.value;
				console.log(this.selectedValue);
		}
		handleInputChange(event){
				this.selecteddate = event.target.value;
				console.log('Selected Date: ',this.selecteddate);
		}
		searchRecords(){
				this.showSpinner = true;
				getFilterAccount({type : this.selectedValue,birthdate : this.selecteddate })
				.then(response =>{
						this.data = response;
						this.showSpinner = false;
						console.log('Filter Data: ',this.data);
				}).catch(error => {
				console.log('Error'+ error.body.message);
			});
		}
		
		resetRecords(){
				
				this.selectedValue = '';
				const dateField = this.template.querySelector('lightning-input[data-id="date"]');
				if (dateField) {
						dateField.value = null;
				}
				this.loadAccounts();
				
		}


}