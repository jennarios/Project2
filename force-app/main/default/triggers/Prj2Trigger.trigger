/*
      Created By: Mustafa Rasouli
      Lasted Updated: 03 May 2022
      Description: Triggers for prj2

*/


trigger Prj2Trigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
      
      switch on trigger.operationType {
          when BEFORE_INSERT { 
              TriggerHandler.ValidateAccounts(trigger.new);
          }
          when BEFORE_UPDATE {
              
          }
          when BEFORE_DELETE { 
          }
          when AFTER_INSERT { 
            TriggerHandler.ChangeContacts(trigger.new);
          }
          when AFTER_UPDATE { 
          }
          when AFTER_DELETE { 
          }
          when AFTER_UNDELETE {
              
          }
      }
}