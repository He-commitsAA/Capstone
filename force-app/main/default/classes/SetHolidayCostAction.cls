/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly Federal Holiday Cost
into the Weekly Federal Holiday Cost as Number field for calculating roll-up summaries
*/
public class SetHolidayCostAction {
    public static void setHolidayCost(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_Federal_Holiday_Cost_as_Number__c = whw.Weekly_Federal_Holiday_Cost__c;
        }
    }
}