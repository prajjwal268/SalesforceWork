public class Wrapper{
    @AuraEnabled
    public Contact con{get;set;}
    @AuraEnabled
    public boolean selected{get;set;}
    public Wrapper(boolean selected,Contact con){
        this.con=con;
        this.selected=selected;
    }
        
    }