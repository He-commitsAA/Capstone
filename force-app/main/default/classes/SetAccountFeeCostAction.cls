/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly Account Fee Cost
into the Weekly Account Fee Cost as Number field for calculating roll-up summaries
*/
public class SetAccountFeeCostAction {
	public static void setAccountFeeCost(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_Account_Fee_Cost_as_Number__c = whw.Weekly_Account_Fee_Cost__c;
        }
    }
}