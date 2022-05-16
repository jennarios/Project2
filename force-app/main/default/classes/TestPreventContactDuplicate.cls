@isTest
public class TestPreventContactDuplicate {
    
    @isTest
    public static void TestPreventContactDuplicate() {
        //creating contact with email 
        Contact con = new Contact(FirstName= 'test', LastName='con', Email='testcon@test.com');
        System.debug('Contact con email is: ' + con.Email);
        Insert con;
	
        //creating duplicate contact
        Contact conDuplicate = new Contact(FirstName= 'test', LastName='con', Email='testcon@test.com');
        System.debug('Contact conDuplicate email is: ' + conDuplicate.Email);
        Insert conDuplicate;

        List<Contact> conList = [SELECT email FROM Contact];
         
        system.assertEquals(1, conList.size());
    }
}