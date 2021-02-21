global class ScheduleOpportunityRun implements Schedulable {
    global void execute(SchedulableContext ctx) {
        Date sevenDaysAgo = Date.today();
        List<Opportunity> opptys = [SELECT Id FROM Opportunity WHERE LastModifiedDate > :sevenDaysAgo];
        for (Opportunity o: opptys) {
            o.probability = 5;
        }
    }
}