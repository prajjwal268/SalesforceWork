@RestResource(urlMapping='/AccountService')
global with sharing class MyRestApi {

    @HttpPost
    global static String createAccount(String accName,String accNum) {
        Account acc=new Account(Name=accName,AccountNumber=accNum);
        insert acc;
        return 'Successfully created. Account Number is- '+acc.Id;
    }
    @HttpGet
    global static Account getAccount(){
        return [select Id,Name from Account limit 1];
    }

}