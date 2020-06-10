public class maxOpportunities {
    public Opportunity value{get;set;}
    public String recordId;
    
public maxOpportunities(ApexPages.StandardController controller)
{
    //value=new Opportunity();
   recordId=controller.getId();
}
    public Opportunity getMaxOpp(){
        list<Opportunity> oppList=[select Amount,Name from Opportunity where AccountId=:recordId and Amount!=null order by Amount desc limit 1];
        
        if(!oppList.isEmpty())
        {
            return oppList[0];
        }
        else{
            return null;
        }
    }
    
}