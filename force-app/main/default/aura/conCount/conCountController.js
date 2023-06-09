({
	myAction : function(component, event, helper) {
        var recId = component.get("v.recordId");
        console.log("recId");
        console.log(recId);
		var action=component.get("c.getContactCount");
        action.setParams({
                "recid": recId
            });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(component.isValid() && state == "SUCCESS"){
                component.set("v.count", response.getReturnValue());
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
	}
})