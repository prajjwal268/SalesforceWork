public with sharing class AccountController {
    @AuraEnabled
	public static list<Account> showAccounts(Integer recCount)
    {
        return [select Name,AnnualRevenue,(select Name from contacts) from Account order by Name limit :recCount];
    }
}