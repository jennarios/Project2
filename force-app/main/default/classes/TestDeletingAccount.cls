@isTest
public class TestDeletingAccount {
    @TestSetup
    public static void SetupTests(){
       Account acc=new Account(Name='test acc');
        insert acc;
        Opportunity opp=new Opportunity(Name='test opp',accountId=acc.Id);
        insert opp;  
    }
    @isTest
    public static void TestAcc(){
        //Test for trigger on deleting account
        List<Account> DeletAcc=[SELECT Id FROM Account WHERE Name='test acc'];
     DeletingAccountHandler.preventAccDel(DeletAcc);  
     List<Account>AccDel =[SELECT Id FROM Account WHERE Name='test acc'];
        system.debug(AccDel.size());
        System.assertEquals(1,AccDel.size());
    }    
}