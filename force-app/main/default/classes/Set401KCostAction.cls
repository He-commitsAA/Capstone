/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly 401K Cost
into the Weekly 401K Cost as Number field for calculating roll-up summaries
*/
public class Set401KCostAction {
	public static void set401KCost(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_401K_Cost_as_Number__c = whw.Weekly_401K_Cost__c;
        }
    }
}