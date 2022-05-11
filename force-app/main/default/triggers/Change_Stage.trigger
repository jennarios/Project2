trigger Change_Stage on Opportunity (before insert) {

    for ( Opportunity Opp :Trigger.New) {
    
	// Update the Stage to 'Prospecting'    
    Opp.StageName = 'Prospecting';

    }
}