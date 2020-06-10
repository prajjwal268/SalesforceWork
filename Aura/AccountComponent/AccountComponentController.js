({
	callaccount : function(component, event, helper) {
		var req=component.get("c.showAccounts");
        req.setParams({"recCount":component.get("v.recordCount")});
        $A.enqueueAction(req);
        req.setCallback(this,function(res){
            if(res.getState()=="SUCCESS"){
                var resValue=res.getReturnValue();
                component.set("v.accList",resValue);
            }
        });
	},
    navigateToMyComponent:function(component,event,helper){
        var evt=$A.get("e.force:navigateToComponent");
        evt.setParams({componentDef:"c:owner",
                       componentAttributes:{
                           
                       }
                      });
        evt.fire();
        
            
    }
})