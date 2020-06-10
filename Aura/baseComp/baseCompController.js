({
	send : function(component, event, helper) {
		var datac=component.get("v.msg");
        var ev=component.getEvent("ce");
        ev.setParams({"eventparam":datac});
        ev.fire();
	}
})