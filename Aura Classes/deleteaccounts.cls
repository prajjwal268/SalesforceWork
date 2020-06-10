public class deleteaccounts {
public static void deletethisplese(list<account> accList)
{
    map<id,account> accdeletemap=new map<id,account>([select id,(select id from opportunities) from account where id in:accList]);
    
    for(Account acc:accList){
        if(accdeletemap.get(acc.id).opportunities.size()>0){
            acc.addError('error');
        }
    }

}
}