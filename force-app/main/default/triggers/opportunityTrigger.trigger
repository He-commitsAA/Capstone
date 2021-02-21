trigger opportunityTrigger on Opportunity (after update) {
    if(Trigger.isUpdate) {
        OpportunityTriggerActions.createPlacementsForClosedOppo(Trigger.new);
    }
    
}