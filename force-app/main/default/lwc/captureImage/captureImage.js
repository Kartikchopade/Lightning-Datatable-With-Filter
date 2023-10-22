import {LightningElement,track} from 'lwc';

export default class CameraCapture extends LightningElement {
   @track video;
@track canvas;

capture() {
    this.video = this.template.querySelector( '.videoelement' )

    if ( navigator.mediaDevices )
    {
        // access the web cam
        navigator.mediaDevices.getUserMedia( { video: true } )

            .then( function ( stream ) {

                this.video.srcObject = stream
            } )

            .catch( function ( error ) {
                document.body.textContent = 'Could not access the camera. Error: ' + error.name;
            } );
    }
}
}