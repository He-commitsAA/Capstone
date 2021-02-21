public class SetSplitWeeklyProfitAction {
    public static void setSplitWeeklyProfit(List<Weekly_Commission_Splitter__c> wcss){
        for(Weekly_Commission_Splitter__c wcs: wcss){
            wcs.Split_Weekly_Profit_as_Number__c = wcs.Split_Weekly_Profit_AM__c + 	wcs.Split_Weekly_Profit_Rec__c;
        }
    }
}