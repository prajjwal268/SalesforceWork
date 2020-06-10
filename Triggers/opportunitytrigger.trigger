trigger opportunitytrigger on Opportunity (before insert,after insert,before update,after update) {
    if(trigger.isbefore&&(trigger.isinsert||trigger.isupdate)) {
        for(Opportunity oc:trigger.new)
        {
            if(oc.StageName.containsIgnoreCase('Closed')&&(trigger.isInsert||trigger.oldMap.get(oc.id).StageName!=oc.StageName))
            {
                oc.CloseDate=system.today();
            }
            else if(!oc.StageName.containsIgnoreCase('Closed'))
            {
                oc.CloseDate=system.today()+15;
            }
        }
    }

}