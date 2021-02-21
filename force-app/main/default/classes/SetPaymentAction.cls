/*Created by Simon Sawyer
	Provides Trigger logic to input the result of the Weekly Payment
into the Weekly Payment as Number field for calculating roll-up summaries
*/
public class SetPaymentAction {
	public static void setPayment(List<Weekly_Hours_Worked__c> whws){
        for(Weekly_Hours_Worked__c whw : whws){
            whw.Weekly_Payment_as_Number__c = whw.Weekly_Payment__c;
        }
    }
}