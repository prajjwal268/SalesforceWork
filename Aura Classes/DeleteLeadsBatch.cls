public with sharing class DeleteLeadsBatch implements Database.Batchable<SObject>,Database.Stateful {
    String query;
    Integer recordCount=0;
    public DeleteLeadsBatch(String query) {
        this.query=query;
    }
    // public List<Lead> start(Database.BatchableContext context){
        public Database.QueryLocator start(Database.BatchableContext context){
        //return [select Id from Lead where Rating='Cold' limit 10];//static query
        //Database.quer('select Id from Lead where Rating='Cold' limit 10');//Dynamic query
        //return Database.getQueryLocator('select Id from Lead where Rating=\'Cold\'');//Query using QueryLocator
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext context,list<Lead> leadToProcessList){
        recordCount=recordCount+leadToProcessList.size();
        delete leadToProcessList;
    }
    public void finish(Database.BatchableContext context){
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        mail.setToAddresses(new list<String>{'268prajjwal@gmail.com'});
        mail.setSenderDisplayName('Delete Lead Batch Processing');
        mail.setReplyTo('noreply@something.com');
        mail.setSubject('lead deletion batch Processing Done');
        mail.setPlainTextBody('Hi prajjwal,lead deletion batch Processing Done,please check in org and see results');
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
    }
}