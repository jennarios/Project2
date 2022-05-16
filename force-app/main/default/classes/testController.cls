public class testController {
    private final Account account;

    public testController() {
        account = [SELECT Id, Name, Site FROM Account 
                   WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }
    public Account getAccount() {
        return account;
    }
    public PageReference save() {
        update account;
        return null;
    }

}