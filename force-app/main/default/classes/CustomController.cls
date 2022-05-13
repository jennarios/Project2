/*
    Created by: Mustafa Rasouli
    Last Updated: 13 May 2022
    Decscription: to retrieve records 
*/

public with sharing class CustomController {
    public Account account { get; private set; }
    private String sortOrder='LastName';
     public CustomController() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        account = (id == null) ? new Account() : 
            [SELECT Name, Phone, Industry FROM Account WHERE Id = :id];
    }
    public List<Contact> getContacts() {
        //creating a list of SOQL query to find record that are avilable in acsending order
        List<Contact> results = Database.query(
            'SELECT Id, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 20'
        );
        return results;
    }
    public PageReference save() {
        //will throw an error if account name left blank 
        try {
            upsert(account);
        } catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return (redirectSuccess);
    }
}