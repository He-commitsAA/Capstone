trigger SetSplitWeeklyProfitTrigger on Weekly_Commission_Splitter__c (before insert, before update) {
    if(Trigger.isInsert){
        WeeklyCommissionSplitterCalculator.calculate(Trigger.new);
    }
    if(Trigger.isUpdate){
        WeeklyCommissionSplitterCalculator.calculate(Trigger.new);
    }
}