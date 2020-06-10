public class AccountTriggerseqHandler {
    //system.triggerOperation enum
    public static void handleSeq(list<Account>accList,list<account>accOldlist,map<id,Account> oldMap,System.TriggerOperation eventType){
        switch on eventType{
            when Before_Insert{
				AccountHandler.updateAccount(accList);            
                AccountValidator.ValidateAccount(accList);
            
            }
            when Before_update{
                AccountHandler.updateAccount(accList);
                 AccountValidator.ValidateAccount(accList);
            }
            when Before_Delete{
                AccountValidator.deletethisplese(accOldList);
            }
            when after_insert{
                ContactHandler.createContactFuture(JSON.serialize(accList));
            }
            when after_update{
                 ContactHandler.createContact(accList,oldMap);    
            }
            when after_delete{
                
            }
             when after_undelete{
                
            }
        }
      /*  if(trigger.isbefore&&(trigger.isinsert)){
            AccountValidator.ValidateAccount(accList);
            AccountHandler.updateAccount(accList);
        }
         if(trigger.isbefore&&(trigger.isupdate)){
         
            AccountHandler.updateAccount(accList);
        }*/
        
    }
}