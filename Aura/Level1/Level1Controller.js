({
	show : function(component, event, helper) {
		component.set("v.childMsg",event.getParams().eventparam);
        console.log('v.childMsg..'+component.get("v.childMsg"));
        //event.stopPropagation();
	}
})