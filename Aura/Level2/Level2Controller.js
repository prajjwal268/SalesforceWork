({
	show : function(component, event, helper) {
		console.log('Hello..');
        component.set('v.childMsg',event.getParams().eventparam);
        console.log('v.childMsg..'+component.get("v.childMsg"));
	}
})