public class CustomControllerEx {
     list <WrapperClass> WrapperList;
    public list <WrapperClass> getConList(){
         WrapperList=new list <WrapperClass>();
        if(WrapperList.isEmpty())
        {
        for(Contact con:[select FirstName,LastName,Phone from Contact])
        {
            WrapperList.add(new WrapperClass(con,false));
        }
           }
        else{
            Integer count=0;
        for(WrapperClass wrap:WrapperList)
        {
           
            if(wrap.isSelected)
            {
                WrapperList.remove(count);
            }
         count++;
        }
        }
         return WrapperList;
    }
    public class WrapperClass{
        public boolean isSelected {get;set;}
        public Contact con {get;set;}
        public WrapperClass(Contact con,Boolean isSelected)
        {
            this.isSelected=isSelected;
            this.con=con;
        }
    }
    public void deleteContacts(){
        list <Contact> conList=new list <Contact>();
        for(WrapperClass wrap:WrapperList)
        {
            if(wrap.isSelected)
            {
                conList.add(wrap.con);
            }
         
        }
           if(!conList.isEmpty())
            {
                delete conList;
            }
    }
}