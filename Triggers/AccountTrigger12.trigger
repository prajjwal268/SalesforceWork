trigger AccountTrigger12 on Account (after update) {
    set<Id> accIdSet=new set<Id>();
    if(trigger.isAfter&&trigger.isUpdate)
    {
        for(Account acc:trigger.new)
        {
            if(acc.Phone!=trigger.oldMap.get(acc.Id).Phone){
                accIdSet.add(acc.id);
            }
        }
    }
    list<Contact> conList=[select Id,Phone,AccountId from Contact where AccountId in:accidset];
    for(Contact con:conList){
        con.Phone=trigger.newMap.get(con.AccountId).Phone;
    }
    update conList;

}