global class AccountHandlerWs {
    webservice static String createAccount(String accName,String accNum) {
        Account acc=new Account(Name=accName,AccountNumber=accNum);
        insert acc;
        return 'Successfully created. Account Number is- '+acc.Id;
    }
}