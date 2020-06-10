@isTest
public class TestDataFactory {
    
    public static Account getAccountRecord(){
        return new Account(Name='TATA Test Acc');
    }
     public static list<Account> getActiveAccountRecord(){
        list<Account> accList=new List<account>();
        
          for(Integer i=0;i<100;i++)
        {
            accList.add(new Account(Name='TATA Test Acc'+i,Active__c='Yes'));
        }
         return accList;
    }
    public static list<Account> getInactiveAccountRecord(){
        list<Account> accList=new List<account>();
        
          for(Integer i=0;i<100;i++)
        {
            accList.add(new Account(Name='TATA Test Acc'+i,Active__c='No'));
        }
         return accList;
    }



}