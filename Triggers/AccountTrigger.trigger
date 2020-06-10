trigger AccountTrigger on Account (before insert,after insert,before update,after update) {
    if(Trigger.isBefore && (trigger.isInsert || trigger.isUpdate))
    {
        for(Account acc:trigger.new){
            if(acc.Name.containsIgnoreCase('Fun'))
            {
                //acc.addError('Phone number can\'t be empty rey');
                acc.AccountNumber='T0001';
            }
            if(acc.AccountNumber==null)
            {
                acc.AccountNumber.addError('Account Number can not be null');
            }
            
          
        }
        //trigger.new[0].AccountNumber='DummyAccount1';
    }
    if(Trigger.isAfter&&Trigger.isInsert)
    {
    system.debug('hello amazing peeps');

    }}