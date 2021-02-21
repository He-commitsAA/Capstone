trigger placementTrigger on Placement__c (before insert,before delete) {
    if(Trigger.isInsert){
        PlacementTriggerActions.limitPlacementsToOpenPlacements(Trigger.new);
    }
    if(Trigger.isDelete){
        PlacementTriggerActions.updateNumberOfPlacementsOnOpportunity(Trigger.new);
    }
    
}