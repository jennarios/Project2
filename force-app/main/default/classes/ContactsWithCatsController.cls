public class ContactsWithCatsController {

    public List<Contact> Contacts {get; set;}
            
    public ContactsWithCatsController() {
    Contacts = [SELECT Name FROM Contact WHERE Pet__c = 'Cat'];
    }
}