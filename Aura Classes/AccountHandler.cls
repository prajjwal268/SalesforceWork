public class AccountHandler {
    public static list<Account> updateAccount(list<account> accList){
        for(Account ac:accList){
            if(ac.Name.containsIgnoreCase('Tata')){
                ac.AccountNumber='T0001';
            }
        }
        return accList;
    }

}