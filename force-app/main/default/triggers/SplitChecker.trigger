/*
Created by Jacob Thompson
*/

trigger SplitChecker on Commission_Split__c (before insert, before update) {
    CommissionSplitHelper.checkRecordType(Trigger.new);
    CommissionSplitHelper.checkSplitPercent(Trigger.new);
}