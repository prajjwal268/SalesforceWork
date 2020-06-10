trigger newtrigger on Account (before insert,after insert,before update,after update,before delete) {
    if(RecursionController.runAccountTrigger==true)
    {
        RecursionController.runAccountTrigger=false;
    	AccountTriggerseqHandler.handleSeq(trigger.new,trigger.old,trigger.oldMap,trigger.operationType);
        RecursionController.runAccountTrigger=true;
    }  /* if(trigger.isbefore&&( trigger.isinsert||trigger.isupdate)){
           
        for(Account acc:trigger.new){
            
        if(acc.Industry=='Banking')
            {
                
                acc.Ownership='Public';
            }
        }
    }
    if(trigger.isafter&&trigger.isinsert){
        list<Contact> conList=new list<Contact>();      
        for(Account acc:trigger.new)
        {
           Contact con=new Contact(LastName=acc.Name+'- Contact',AccountId=acc.Id,Phone=acc.Phone);
            conList.add(con);
            
            
        }
        insert conList;
       
    }*/

}