public with sharing class olaController {
    @AuraEnabled(cacheable=true)
    public static list<DriverInfo__c> getDriverInfo(String type){
        //
        return [Select Id,Name,Car_Type__c,Car_Name__c,Vehicle_Number__c,Rating__c,Available__c from DriverInfo__c where Car_Type__c =: type];
    }
    @AuraEnabled
    public static void deleteRecord(String driver){
        delete new DriverInfo__c(Id=driver);
    }
    public olaController() {

    }
}