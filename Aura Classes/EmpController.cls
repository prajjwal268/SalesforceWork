public with sharing class EmpController {
    public EmpController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<EmployeeData__c> getList() {
        return [SELECT Id, Name, Company__c FROM EmployeeData__c LIMIT 10];
    }
    @AuraEnabled
    public static void deleteRecord(String recId) {
        delete new EmployeeData__c(Id = recId);
    }
}