/*
Created by Jacob Thompson
*/

public class CommissionSplitHelper {
    public static void checkRecordType(List<Commission_Split__c> splits) {
        Map<String,Schema.RecordTypeInfo> info = Schema.SObjectType.Contact.getRecordTypeInfosByName();
        Id AMid = info.get('Account Manager').getRecordTypeId();
        Id RecruiterId = info.get('Recruiter').getRecordTypeId();
        for (Commission_Split__c split : splits) {
            Id contactID = split.Contact__c;
            Contact contact = [select id,RecordTypeId from Contact where id = :contactID];
            if (split.Role__c == 'Account Manager') {
                if (contact.RecordTypeId != AMid) {
                    split.Contact__c.addError('Contact record type must match Role');
                }
            }
            else {
                if (contact.RecordTypeId != RecruiterId) {
                    split.Contact__c.addError('Contact record type must match Role');
                }
            }
        }
    }

    public static void checkSplitPercent(List<Commission_Split__c> splits) {
        for (Commission_Split__c split : splits) {
            Id oppId = split.Opportunity__c;
            String role = split.Role__c;
            Id splitId = split.Id;
            Decimal splitpercent = split.Split__c;
            List<AggregateResult> results = [select SUM(Split__c) total from Commission_Split__c where Opportunity__c=:oppId and Role__c=:role and Id!=:splitId group by Role__c];
            Decimal totalPercent = results.size()==0 ? 0 : (Decimal) results[0].get('total');
            
            if (totalPercent + splitpercent > 100) {
                split.Split__c.addError('Total percent for ' + role + ' cannot exceed 100. Total before this split is ' + totalPercent);
            }
        }
    }
}