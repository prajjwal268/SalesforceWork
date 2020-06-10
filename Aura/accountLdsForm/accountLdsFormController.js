({
	handleSubmit : function(component, event, helper) {
		event.preventDefault();//stop the form from submitting
        const fields=event.getParam('fields');
        fields.Name='Hello';
        component.find('myRecordForm').submit(fields);
        
	}
})