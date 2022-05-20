@isTest
public class TestPreventContactDuplicate {
    
    @isTest
    public static void TestPreventContactDuplicate() {
		//creating contact with email 
		Contact con = new Contact(FirstName= 'test', LastName='con', Email='testcon@test.com');
		System.debug('Contact con email is: ' + con.Email);
		Insert con;
		
		try {
			//creating duplicate contact
			Contact conDuplicate = new Contact(FirstName= 'test', LastName='con', Email='testcon@test.com');
			System.debug('Contact conDuplicate email is: ' + conDuplicate.Email);
			Insert conDuplicate;
			System.assert(false, 'Duplicate insert was allowed');
		} catch(DmlException e) {
			System.assert(true, 'Duplicate insert causes exception');
		}

        List<Contact> conList = [SELECT email FROM Contact];
        system.assertEquals(1, conList.size());
    }
}