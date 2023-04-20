public with sharing class DisplayAccountTaskController {
    @AuraEnabled(cacheable = true)
    public static List<Account> fetchAccountName(){
        try {
            List<Account> accList = [SELECT id,Name,CreatedDate,Type FROM Account WITH SECURITY_ENFORCED  ORDER BY createdDate desc LIMIT 10 ];
            return accList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}