public class AccountValidator {
    public static String ValidateAccount(list<Account> accList){
        for(Account acc:accList){
            if(acc.AccountNumber==null){
                if(trigger.isExecuting){
                acc.AccountNumber.addError(system.label.AccountNumber_Error_Msg);
            }
                else{
                    return system.label.AccountNumber_Error_Msg;
                }
            }
        }
        return null;
    }
    public static void deletethisplese(list<account> accOldList)
{
    map<id,account> accdeletemap=new map<id,account>([select id,(select id from opportunities) from account where id in:accOldList]);
    
    for(Account acc:accOldList){
        if(accdeletemap.get(acc.id).opportunities.size()>0){
            acc.addError('error not able to delete');
        }
    }

}
}