public inherited sharing class OpportunityTriggerActions {
    public static void createPlacementsForClosedOppo(List<Opportunity> opps){
        List<Placement__c> plcms = new List<Placement__c>();
        List<Task> tasks = new List<Task>();
        for(Opportunity o:opps){
            if (o.StageName == 'Closed Won'){
                Integer count = [Select count() from Placement__c where Opportunity__c =:o.Id];
                if (o.Total_Placements__c-count > 0){
                    for (Integer i=count;i<o.Total_Placements__c;i++){
                        Placement__c p = new Placement__c(Name='Placement #' + (i +1) + ' for ' + o.Name,Opportunity__c = o.Id);
                        plcms.add(p);
                    }
                    Task t = new Task();
                    t.WhatId = o.Id;
                    t.Subject = 'Assign Resources';
                    t.Description = (o.Total_Placements__c-count) + ' Resources need to be assigned to Placements for ' + o.Name;
                    t.OwnerId = o.Ownerid;
                    tasks.add(t);
                }
                
                
            }      
        }
        insert tasks;
        insert plcms;
    
}
}