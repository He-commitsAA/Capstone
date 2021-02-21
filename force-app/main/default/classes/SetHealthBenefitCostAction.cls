/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly Health Benefit Cost
into the Weekly Healht Benefit Cost as Number field for calculating roll-up summaries
*/
public class SetHealthBenefitCostAction {
	public static void setHealthBenefitCost(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_Health_Benefit_Cost_as_Number__c = whw.Weekly_Health_Benefit_Cost__c;
        }
    }
}