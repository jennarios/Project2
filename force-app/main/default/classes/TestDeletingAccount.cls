@isTest
public class TestDeletingAccount {
    @TestSetup
    public static void SetupTests(){
    }
    
    @isTest
    public static void TestPreventAccDel(){
        //Test for trigger on deleting account
        Account acc=new Account(Name='test acc');
        Insert acc;
	
        Date tempDate = Date.newInstance(2023, 2, 17);
        Opportunity opp=new Opportunity(Name='test opp', accountId=acc.ID, CloseDate=tempDate);
        Insert opp;
        
        try {
            delete acc;
        } catch (DMLexception ex) {
            System.assert(ex.getMessage().contains('This account has opportunities'));
        }
    }

    @isTest
    public static void TestAccDel(){
        //Test for trigger on deleting account
        Account acc=new Account(Name='test acc');
        Insert acc;
        
        try {
            delete acc;
        } catch (DMLexception ex) {
            System.assert(false, 'No exception should be thrown');
        }
        System.assert(true);
    }       
}