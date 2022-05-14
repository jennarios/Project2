public class DeletingAccountHandler {

    public static void preventAccDel(List<Account> Ac) {
        List<Opportunity> opps = [SELECT AccountId FROM Opportunity];
        Set<Id> accounts_to_not_delete = new Set<Id>();
        for (Opportunity opp : opps) {
            // This if statement checks to make sure the account id doesnt already exist in our set
            // if the id does not exist in our set, add it to set
            // if the id does exist in our set, just ignore it and move to the next opportunity
            if (!accounts_to_not_delete.contains(opp.accountId)) {
                accounts_to_not_delete.add(opp.accountId);
            }
        }
        
        for (Account acc : Ac) {
            if (accounts_to_not_delete.contains(acc.Id)) {
                acc.addError('This account has opportunities related to it and cannot be deleted.');
            }
        }
    }
}