/*
    Created by: Norman Breuer
    Last Updated: May 15 2022
    Description: Custom controller for VF page
*/

public class ContactsWithCatsController {

    public List<Contact> Contacts {get; set;}
            
    public ContactsWithCatsController() {
    Contacts = [SELECT Name, Contact.Pet__c FROM Contact WHERE Contact.Pet__c = 'Cat'];
    }
}