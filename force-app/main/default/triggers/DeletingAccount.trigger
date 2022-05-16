//If the account has related opportunities it will not be deleted
trigger DeletingAccount on Account (before delete) {
	DeletingAccountHandler.preventAccDel(trigger.old);
}