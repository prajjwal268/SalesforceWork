public class Calculator {
    public Integer input1{get;set;}
    public Integer input2{get;set;}
    public Integer result{get;set;}
    public void add(){
        //system.debug('======'+input1+'======'+input2);
        if(input1!=0&&input2!=0)
        {
        result=input1+input2;
          //  system.debug('======'+input1+'======'+input2);
        }
        else{
            ApexPages.message mes=new ApexPages.message(ApexPages.severity.error,'Please enter numbers');
            ApexPages.addmessage(mes);
        }
    }

}