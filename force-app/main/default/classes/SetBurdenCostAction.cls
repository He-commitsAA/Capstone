/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly Burden Cost
into the Weekly Burden Cost as Number field for calculating roll-up summaries
*/
public class SetBurdenCostAction {
	public static void setBurdenCost(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_Burden_Cost_as_Number__c = whw.Weekly_Burden_Cost__c;
        }
    }
}