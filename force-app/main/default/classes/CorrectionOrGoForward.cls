public class CorrectionOrGoForward {

    public static void seeWhich(List<Opportunity> oldOpps, List<Opportunity> newOpps){
        
        for(integer i = 0; i < newOpps.size(); i++){
                Corrector.correct(newOpps);
        }
        
    }
}