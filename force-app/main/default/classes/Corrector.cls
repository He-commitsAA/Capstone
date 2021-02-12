public class Corrector {

    public static void correct(List<Opportunity> newOpps){
        
        List<Placement_Calculations__c> pcs = new List<Placement_Calculations__c>();
        List<Setup__c> stps = new List<Setup__c>();
        
        for(Opportunity opp: newOpps){
            List<Placement_Calculations__c> pcsByOpp = [select placement_fee__c from placement_calculations__c where opportunity__c =: opp.Id];
            for(Placement_Calculations__c pc: pcsByOpp){
                pc.Placement_Fee__c = opp.Placement_Fee__c;
                update pc;
                pcs.add(pc);
            }
        }
        
        for(Placement_calculations__c pc: pcs){
         	List<Setup__c> stpsByPC = [select placement_fee__c from setup__c where placement_calculations__c =: pc.id];
            for(Setup__c stp: stpsByPC){
                stp.placement_fee__c = pc.Placement_Fee__c;
                stps.add(stp);
            }
        }
    }
}