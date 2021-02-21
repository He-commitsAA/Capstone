/*
 * Written by Simon Sawyer
 * Calculates the Split Weekly Profit within the Weekly Commission object based upon Weekly Hours Worked and Commission Split
*/

public class WeeklyCommissionSplitterCalculator {
    public static void calculate(List<Weekly_Commission_Splitter__c> wcss){
        
        //Determines Whether or not all commission splitters start on same date
        Boolean sameStart = true;
        Date startDate = wcss[0].Billing_Week_Start_Date__c;
        for(Weekly_Commission_Splitter__c wcs : wcss){
            if(wcs.Billing_Week_Start_Date__c != startDate){
                sameStart = false;
            }
        }
        
        //Create and assign maps to track relationships of WCS
        Map<Weekly_Commission_Splitter__c, Commission_Split__c> csMap = new Map<Weekly_Commission_Splitter__c, Commission_Split__c>();
        Map<Weekly_Commission_Splitter__c, Weekly_Hours_Worked__c> whwMap = new Map<Weekly_Commission_Splitter__c, Weekly_Hours_Worked__c>();
        
        List<Commission_Split__c> csList = [SELECT id, Split__c FROM Commission_Split__c WHERE Placement__r.Stage__c= 'Active Contract'];
        List<Weekly_Hours_Worked__c> whwList = sameStart? [SELECT id, Weekly_Profit__c FROM Weekly_Hours_Worked__c WHERE Billing_Week_Start_Date__c =: startDate] : 
        [SELECT id, Weekly_Bill__c, Weekly_Payment__c FROM Weekly_Hours_Worked__c WHERE Billing_Week_Start_Date__c < Next_N_Months:2 OR Billing_Week_Start_Date__c > Last_N_Months:2];
        
        for(Weekly_Commission_Splitter__c wcs : wcss){
            for(Commission_Split__c cs : csList){
                if(wcs.Commission_Split__c == cs.id){
                    csMap.put(wcs, cs);
                    break;
                }
            }
            for(Weekly_Hours_Worked__c whw : whwList){
                if(wcs.Weekly_Hours_Worked__c == whw.id){
                    whwMap.put(wcs, whw);
                    break;
                }
            }
        }
            
        for(Weekly_Commission_Splitter__c wcs : wcss){
            wcs.Split_Weekly_Profit__c = csMap.get(wcs).Split__c * .01 * whwMap.get(wcs).Weekly_Profit__c;
        }
    }
}