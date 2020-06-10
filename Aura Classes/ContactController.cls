public with sharing class ContactController {
	@AuraEnabled
    public static list <Contact> showTechnicianBySearch(String searchly){
        list<Contact> conList=[select FirstName,LastName,Email,MailingState from Contact where Name like:'%'+searchly+'%'];
        return conList;
    }
    @AuraEnabled
    public static list<Contact> showTechnicianByState(String searchly){
        list<Contact> conList=[select FirstName,LastName,Email,MailingState from Contact where MailingState like:'%'+searchly+'%'];
        return conList;
    }
    @AuraEnabled(cacheable=true)
    public static list<Contact> getContactList(){
        return [select Id,FirstName,LastName,Email,MailingState from Contact];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey)
    {
        String key='%'+searchKey+'%';
        return [select Id,Name from Contact where Name like: key];
    }
    @AuraEnabled(cacheable=true)
    public static list<Wrapper> getWrapperList(){
         boolean selected;
        list<Wrapper> wrapperList=new List<Wrapper>();
        selected=false;
        for(Contact con:[SELECT id,Name,Title,Phone,Email FROM Contact where Email!=null])
        {
            Wrapper obj=new Wrapper(selected,con);
            wrapperList.add(obj);
        }
        return wrapperList;
    }
}