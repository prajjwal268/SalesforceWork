public with sharing class QueueableExample implements Queueable {
    String lname;
    public QueueableExample() {
        

    }
    public QueueableExample(String lname) {
        this.lname=lname;

    }
    public void execute(QueueableContext qContext){
        //Contact con=new Contact(LastName=lname);
        //insert con;
        ContactHandler.futureDemo();
    }
}