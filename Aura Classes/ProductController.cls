public with sharing class ProductController {
    @AuraEnabled
    public static list<Product1__c> getProducts(){
        return [Select 	Name,Price__c,Product_Id__c,Type__c from Product1__c ORDER BY Product_Id__c];
    }
    public ProductController() {

    }
}