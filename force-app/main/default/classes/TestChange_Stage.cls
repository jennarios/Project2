@isTest
public class TestChange_Stage {  

 @isTest
    public static void TestOpp() {       

    // Test for trigger on opportunity insert
    Opportunity opp = new Opportunity(Name='test opp', Probability = 200, CloseDate=system.today());
    insert opp;
        
        List <Opportunity> OppStage = [SELECT StageName FROM Opportunity];
        
	System.assertEquals(1, OppStage.size());
    System.assertEquals('Prospecting', OppStage[0].stageName);
  }

}