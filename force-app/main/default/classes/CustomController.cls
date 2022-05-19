/*
    Created by: Mustafa Rasouli
    Last Updated: 13 May 2022
    Decscription: Allow a user to create a record 
*/

public class CustomController {
    public Account account{get; private set;}

    public CustomController() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        
        account = (id ==null) ? new Account() :[SELECT Id, Name, Site FROM Account WHERE id = :id]; 
                   
    }
    public Account getAccount() {
        return account;
    }
    public PageReference save() {
        try{
            upsert(account);
        }catch(System.DMLException e){
            Apexpages.addMessages(e);
            return null;
        }
        Pagereference redirect = new Apexpages.StandardController(account).view();
        return(redirect);
    }
}