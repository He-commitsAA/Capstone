/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly External Referral Cost
into the Weekly External Referral Cost as Number field for calculating roll-up summaries
*/
public class SetExternalReferralCostAction {
	public static void setExternalReferralCost(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_External_Referral_Cost_as_Number__c = whw.Weekly_External_Referral_Cost__c;
        }
    }
}