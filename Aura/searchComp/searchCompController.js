({
	search : function(component, event, helper) {
        var ev=$A.get("e.c:appEvent");
        ev.setParams({"searchStr":component.find("searchString").get("v.value"),"isSearch":true});
        ev.fire();
		
	}
})