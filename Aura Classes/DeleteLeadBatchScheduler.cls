public class DeleteLeadBatchScheduler implements system.Schedulable{
    public void execute(SchedulableContext sc){
        DeleteLeadsBatch del=new DeleteLeadsBatch('select Id from Lead where Rating=\'Cold\'');
		Database.executeBatch(del,2);        
    }
}