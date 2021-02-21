/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly PTO Cost
into the Weekly PTO Cost as Number field for calculating roll-up summaries
*/
public class SetPTOCostAction {
	public static void setPTOCost(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_PTO_Cost_as_Number__c = whw.Weekly_PTO_Cost__c;
        }
    }
}