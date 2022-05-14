public class PreventDuplicateContactHandler {
    public PreventDuplicateContactHandler() {
        for(Contact con:Trigger.new) {
            List<Contact> myContact = [SELECT Name FROM Account WHERE Name= :con.Name];
            
            if(myContact.size() > 0) {
                con.Name.addError('A contact with the same name already exists');
            }
        }
    }
}
