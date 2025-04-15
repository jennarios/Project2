public class OpportunityApprovalHandler {
    public static void autoSubmitForApproval(Opportunity opp) {
        if (opp.Amount > 100000 && String.isNotBlank(opp.StageName)) {
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setObjectId(opp.Id);
            Approval.process(req);
        }
    }
}

