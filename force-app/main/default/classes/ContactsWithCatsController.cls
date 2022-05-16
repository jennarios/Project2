public class ContactsWithCatsController {

    public List<Contact> Contacts {get; set;}
            
    public ContactsWithCatsController() {
    Contacts = [SELECT Name, Pet__c FROM Contact WHERE Pet__c = 'Cat'];
    }
}