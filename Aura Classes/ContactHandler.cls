public class ContactHandler {
    public static list<Contact> createContact(List<Account> accList,map<id,Account> oldMap){
        Contact con;
        list<Contact> conList=new list<Contact>();
        for(Account acc:accList){
            if(acc.Active__c=='Yes'&&(oldMap==null||acc.Active__c!=oldMap.get(acc.id).Active__c))
            {
            con=new Contact(LastName=acc.Name+'-contact',Phone=acc.Phone,AccountId=acc.Id);
            conList.add(con);
            }
            }
        if(!conList.isEmpty())
        {
           // RecursionController.runAccountTrigger=false;
        insert conList;
        }
        return conList;
        }
    // @future
    // public static void createContactFuture(Set<Id> accIdList){
    //     Contact con;
    //     list<Contact> conList=new list<Contact>();
    //     for(Account acc:[select Id,Active__c, Name, Phone
    //                      from Account 
    //                      where Id in: accIdList]){
    //         if(acc.Active__c=='Yes')
    //         {
    //         con=new Contact(LastName=acc.Name+'-Contact',Phone=acc.Phone,AccountId=acc.Id);
    //         conList.add(con);
    //         }
    //         }
    //     if(!conList.isEmpty())
    //     {
    //        // RecursionController.runAccountTrigger=false;
    //     insert conList;
    //     }
        

    // }
    @future
    public static void createContactFuture(String accJsonStringList){
        Contact con;
        list<Contact> conList=new list<Contact>();
        for(Account acc:(list<Account>)JSON.deserialize(accJsonStringList,list<Account>.class)){
            if(acc.Active__c=='Yes')
            {
            con=new Contact(LastName=acc.Name+'-Contact',Phone=acc.Phone,AccountId=acc.Id);
            conList.add(con);
            }
            }
        if(!conList.isEmpty())
        {
           // RecursionController.runAccountTrigger=false;
        insert conList;
        }
       // futureDemo();
       QueueableExample q=new QueueableExample();
       system.enqueueJob(q);


    }
    @future
    public static void futureDemo(){
        system.debug('Inside the future');
    }
}