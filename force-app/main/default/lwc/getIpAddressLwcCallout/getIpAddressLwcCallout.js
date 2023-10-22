import { LightningElement,track } from 'lwc';
import getIpAddress from '@salesforce/apex/DatatablewithFilterController.getIpAddress';
export default class GetIpAddressLwcCallout extends LightningElement {
		@track myIP;
		@track showSpinner =false;
		@track myIPApex;
		getIP(){
				this.showSpinner = true;
				const calloutURI = 'https://api.ipify.org?format=json';
				fetch(calloutURI,{
						method:"GET"
				}).then((response) => response.json())
						.then(respo =>{
						console.log(respo);
						this.myIP = respo.ip;
						console.log('my Ip: ',this.myIP);
						this.showSpinner = false;
				})
						.catch(error => {
						console.log(error);
				});
		}
		getIPfromApex(){
				this.showSpinner = true;
				getIpAddress().then(result => {
						this.myIPApex = result;
						console.log('My Ip Apex: ',this.myIPApex);
						this.showSpinner = false;
				})
						.catch(error => {
						console.log(error);
				});
		}
}