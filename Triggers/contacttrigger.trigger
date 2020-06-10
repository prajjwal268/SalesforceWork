trigger contacttrigger on Contact (before insert,after insert) {
//new contact's phone number will populate automatically
    list<Id> accList=new list<Id>();
    if(trigger.isInsert&&(trigger.isBefore)){
        for(Contact con:trigger.new){
            accList.add(con.AccountId);
        }
        map<id,account> m=new map<id,account>([select id,Phone from account where id in:accList]);
        for(Contact con1:trigger.new){
            con1.Phone=m.get(con1.AccountId).Phone;
        }
    }
    //recursion
    if(trigger.isAfter&&trigger.isInsert){
        insert new Account(Name='New Contact Account',Active__c='Yes');
    }

}