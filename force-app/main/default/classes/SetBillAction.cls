/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly Bill
into the Weekly Bill as Number field for calculating roll-up summaries
*/
public class SetBillAction {
	public static void setBill(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_Bill_as_Number__c = whw.Weekly_Bill__c;
        }
    }
}