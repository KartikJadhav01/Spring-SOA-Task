public with sharing class ContactTriggerHandler {
    public static void handleContactCount(List<Contact> conNewList,List<Contact> conOldList){
        try{
            
            set<Id> accIds = new Set<Id>();
            List<Account> accList = new List<Account>();
            map<String,Integer> conMap = new map<String,Integer>();
            
            if(conNewList != null){
                for(Contact con : conNewList){
                    accIds.add(con.AccountId);  
                }
            }
            if(conOldList != null){
                for(Contact con : conOldList){
                    accIds.add(con.AccountId);  
                }
            }
            
            List<Contact> contList = [SELECT Id,AccountId from Contact Where AccountId IN: accIds WITH SECURITY_ENFORCED];
            
            for(Contact con : contList){
                if(!conMap.containsKey(con.AccountId)){
                    conMap.put(con.AccountId,1);
                }
                else{
                    Integer tempCount = conMap.get(con.AccountId);
                    tempCount += 1;
                    conMap.put(con.AccountId,tempCount);
                }
                
            }
            
            
            for(String aId: accIds){
                Account ac = new Account();
                ac.Id = aId;
                ac.Number_of_Contacts__c = conMap.get(aId);
                accList.add(ac);
            }
            
            Database.SaveResult[] results = Database.update(accList,false);
        }
        catch(Exception ex){
            System.debug('Error: ' + ex);
        }
        
    }
}