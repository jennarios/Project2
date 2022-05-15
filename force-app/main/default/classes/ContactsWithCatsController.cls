public class ContactsWithCatsController {

    public List<Contact> Contacts {get; set;}
            
    public ContactsWithCatsController() {
    Contacts = [SELECT Name, Pet FROM Contact WHERE Pet = 'Cat'];
    }
}