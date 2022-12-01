Public class AccountTriggerHandler{
	public static void createContact(List<Account> accList){
		List<Contact> ct = new List <Contact>();
		for(Account acc : accList){
            Contact c = new Contact();
<<<<<<< HEAD
	                                                                                               
=======
			c.LastName = acc.Name;
            c.AccountId= acc.Id;                                                 
            c.Fax=acc.Fax;                                               
            c.Phone=acc.Phone;                                               
>>>>>>> 662e8294be04cb418712457e174eaca40f9ea4c6
			ct.add(c);
		}
		insert ct;
	}
}