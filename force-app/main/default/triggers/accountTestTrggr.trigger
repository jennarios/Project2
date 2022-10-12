trigger accountTestTrggr on Account (before insert, before update) {
 
   for(Account a: Trigger.new){
 
      List<Contact> contacts = [select id, salutation, firstname, lastname, email
      from Contact where accountId = :a.Id];
 
      for(Contact c: contacts){
 
         c.Description=c.salutation + ' ' + c.firstName + ' ' + c.lastname;
 
         update c;
      }
   }
}