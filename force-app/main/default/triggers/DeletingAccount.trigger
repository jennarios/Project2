//If the account has related opportunities it will not be deleted
trigger DeletingAccount on Account (before delete) {
	for (Account acc : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity)
                        AND Id IN :Trigger.old]){
        Trigger.oldMap.get(acc.Id).addError
            ('This account has opportunities related to it and cannot be deleted.');
    }
}