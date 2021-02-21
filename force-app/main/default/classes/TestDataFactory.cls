/* 
 * Created by Kareem El Sayed 
 */
@isTest
public class TestDataFactory {
   
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccountWCS' + i, Type='Smoothstack');
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Closed Won',
                                       Type='Train and Place',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        insert opps;
        
        return accts;
    }
    
    public static List<Contact> createTestAManagers(Integer numAM, Integer acctNum, Integer oppNum){
        List<Contact> ctacts = new List<Contact>();
        List<Account> accts = createAccountsWithOpps(acctNum, oppNum);
        Id recTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Account Manager').getRecordTypeId();
       
       for(Account a: accts){
        for(Integer i = 0; i < numAM; i++){
            Contact c = new Contact();
            c.LastName = 'Eliot ' + i;
            c.FirstName = 'Test-Manager' + i;
            c.AccountId = a.Id;
            c.Email = 'evilcorp@test.com';
            c.RecordTypeId = recTypeId;
            c.Phone = '777-347-891' + i;
            ctacts.add(c);
           }
          }
          insert ctacts;
        
         return ctacts;
        }
   
    
     public static List<Contact> createTestRecruiters(Integer numR, Integer acctNum, Integer oppNum){
        List<Contact> ctacts = new List<Contact>();
        List<Account> accts = createAccountsWithOpps(acctNum, oppNum);
        Id recTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Recruiter').getRecordTypeId();
         for(Account a: accts){
          for(Integer i = 0; i < numR; i++){
            Contact c = new Contact();
            c.LastName = 'Eliott ' + i;
            c.FirstName = 'Test-Recruiter' + i;
            c.AccountId = a.Id;
            c.Email = 'goodcorp@test.com';
            c.RecordTypeId = recTypeId;
            c.Phone = '777-347-891' + i;
            ctacts.add(c);
           }
         }
          insert ctacts;
        
         return ctacts;
        
     }
    /*
    public static List<Placement__c> createPlacement(aacts, opps, resource){
        List<Placement__c> plcments = new List<Placement__c>();
        placement is a person associated with job. 
        resource is me(Smoothstack employee)
    }

    public static List<CommisionSplits__c> createPlacement(placements, AMS, Recruiters){
        
    }

    public static List<WeekHWorked>(placements[resource]){

    }
*/
    public static List<Weekly_Commission__c> createWeeklyCommissions(Integer wcNum, Integer amNum, Integer recNum, Integer acctNum, Integer oppNum){
    	List<Contact> ams = createTestAManagers(amNum, acctNum, oppNum);
		List<Contact> recs = createTestRecruiters(recNum, acctNum, oppNum);
        List<Weekly_Commission__c> wcList = new List<Weekly_Commission__c>();
        for(Integer i= 0; i < wcNum; i++){
            for(Contact c: ams){
            	wcList.add(new Weekly_Commission__c(Name= 'Test WC ' + i, AM_Recruiter__c = c.id, Billing_Week_Start_Date__c= Date.today().addDays(i*7)));
            }
            for(Contact c: recs){
            	wcList.add(new Weekly_Commission__c(Name= 'Test WC ' + i, AM_Recruiter__c = c.id, Billing_Week_Start_Date__c= Date.today().addDays(i*7)));
            }
        }
        insert wcList;        
		return wcList;
    }
/*
    public static List<Weekly Commisions spliter>(WHW, WEEKLYCommision, Commision Split){
    
    }
  */
}