trigger ContactTrigger on Contact (After insert,After update,After Delete) {
    if(Trigger.isInsert && Trigger.isAfter){
        ContactTriggerHandler.handleContactCount(Trigger.new,Trigger.old);
    }
    if(Trigger.isUpdate && Trigger.isAfter){
        ContactTriggerHandler.handleContactCount(Trigger.new,Trigger.old);
    }
    if(Trigger.isDelete && Trigger.isAfter){
        ContactTriggerHandler.handleContactCount(Trigger.new,Trigger.old);
        
    }
    
}