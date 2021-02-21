public inherited sharing class PlacementTriggerActions {
    public static void limitPlacementsToOpenPlacements(List<Placement__c> plcms){
        
        for(Placement__c p:plcms){
            Integer opp = (Integer)[Select Total_Placements__c from Opportunity where Id =: p.Opportunity__c].Total_Placements__c;
            Integer count = [Select count() from Placement__c where Opportunity__c =: p.Opportunity__c];
            if (opp - count <=0){
                p.addError('The number of placements can not exceed total placements for an opportunity');
            }
        }
    }
    public static void updateNumberOfPlacementsOnOpportunity(List<Placement__c> plcms){

       for(Placement__c p:plcms){
            Opportunity opp = [Select Total_Placements__c from Opportunity where Id =: p.Opportunity__c]; 
            opp.Total_Placements__c -= 1;
            update opp;

        }
    }
}