@isTest
public class AccountTriggerTest {
    @testSetup
    public static void createData(){
        Account acc=TestDataFactory.getAccountRecord();
        insert acc;
    }
    @isTest
    public static void testTrigger(){
        Account acc=new Account(Name='TATA Test Acc');
        insert acc;
        acc.Active__c='Yes';
        update acc;
        acc=[select AccountNumber from Account where Id=:acc.Id];
        system.assertEquals('T0001', acc.AccountNumber);
        system.assertEquals(1, [select count() from Contact where AccountId=:acc.Id]);
        delete acc;
    }
    @isTest
    public static void opportunityTriggerTest(){
        Account acc1=new Account(Name='Tata test acc1');
        insert acc1;
        Opportunity op=new Opportunity(Name='Demo Opp1',AccountId=acc1.Id,CloseDate=system.today()+1,StageName='Closed Won');
        insert op;
        Opportunity li=[select CloseDate from Opportunity];
        system.assertEquals(system.today(),li.CloseDate);
    }
    @isTest
    public static void testOppValidation(){
        Account acc=new Account(Name='Tata test acc');
        insert acc;
        Opportunity opp=new Opportunity(Name='Demo Opp',AccountId=acc.Id,CloseDate=system.today(),StageName='Prospect');
        insert opp;
        test.startTest();
        try{
        delete acc;
        }
        catch(DMLException e)
        {
            system.assert(e.getMessage().contains('error not able to delete'));
        }
        test.stopTest();
    }
    
    @isTest
    public static void testValidation()
    {
        try{
            Account acc=TestDataFactory.getAccountRecord();
            insert acc;
            system.assert(acc.Id==null);
        }
        catch(DMLException e)
        {
            system.assert(e.getMessage().contains('AccountNumber number can\'t be null'));
        }
    }
    @isTest
    public static void testAccTriggerBulk(){
        list<Account> accList=new list<Account>();
         accList.addAll(TestDataFactory.getActiveAccountRecord());
         accList.addAll(TestDataFactory.getInactiveAccountRecord());
        
        insert accList;
        list<Contact> conList=[select id from Contact];
        system.assertEquals(100,conList.size());
    }
}