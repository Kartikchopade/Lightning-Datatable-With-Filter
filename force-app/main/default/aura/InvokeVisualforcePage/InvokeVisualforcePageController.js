({
    doInit: function(component, event, helper) {
        var recordId = component.get("v.recordId");
		console.log('Record Id: '+recordId);
        component.set("v.recordId", recordId);
        
    }
})