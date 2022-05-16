/*
    Created by: Mustafa Rasouli
    Last Updated: 13 May 2022
    Decscription: to create new record
*/

public with sharing class CustomController {
    private final Account account;

    public CustomController() {
        ID id = ApexPages.currentPage().getParameters().get('id');
        account = (id==null)?new account():[SELECT Name, phone From Account WHERE ID =:id];
    }
    public Account getAccount() {
        return account;
    }
    
    public Pagereference save(){
       
        try {
            upsert account;
        } catch (DmlException e){
           return null;
        }
        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return (redirectSuccess);
    }
}