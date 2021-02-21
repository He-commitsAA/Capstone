trigger PercentUpdate on Opportunity (before update) {

    if(Trigger.isUpdate){
 //       CorrectionOrGoForward.seeWhich(Trigger.old,Trigger.new);
    }
}