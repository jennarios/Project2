trigger PreventContactDuplicate on Contact (before insert) {

    //set that will contain email from contact being added
    Set<String> conEmailSet = new Set<String>();

    //adding email of new contact to conEmailSet
    for(Contact con : Trigger.new) {
        conEmailSet.add(con.email);
    }

    //querying for contacts with same email as email from contact being added and storing it in a list
    List<Contact> conList = [SELECT email FROM Contact WHERE email in: conEmailSet];

    //if list contains same email as contact being added it's size will be greater than 0 and it will display an error
    for(Contact c : Trigger.new) {
        if(conList.size() > 0 ) {
            c.email.addError('A contact with this email already exists '+c.email);
        }
    }
}