public class Corrector {/*

    public static void correct(List<Opportunity> newOpps){
        
        List<Placement__c> pcs = new List<Placement__c>();
        List<Setup__c> stps = new List<Setup__c>();
        
        for(Opportunity opp: newOpps){
//bulkify          List<Placement__c> pcsByOpp = [select placement_fee__c from placement__c where opportunity__c =: opp.Id];
            for(Placement__c pc: pcsByOpp){
                pc.Placement_Fee__c = opp.Placement_Fee__c;
                update pc;              //bulkify
                pcs.add(pc);
            }
        }
        
        for(Placement__c pc: pcs){
            List<Setup__c> stpsByPC = [select placement_fee__c from setup__c where placement__c =: pc.id];
            for(Setup__c stp: stpsByPC){
                stp.placement_fee__c = pc.Placement_Fee__c;
                stps.add(stp);
            }
        }
    }
    */
}