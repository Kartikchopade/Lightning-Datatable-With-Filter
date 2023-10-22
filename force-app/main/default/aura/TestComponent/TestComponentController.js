({
    selectAction : function( component, event, helper) {
        var actionAPI = component.find("quickActionAPI");
        console.log(actionAPI);
        var quickAction = component.get("v.objectName")+"."+component.get("v.actionName");
        var args = {actionName: quickAction};
        actionAPI.selectAction(args).then(function(result) {
            var fields = result.targetableFields;
            console.log(fields);            
        }).catch(function(e){
            if(e.errors){
                console.log(e);
            }
        });
    },
})