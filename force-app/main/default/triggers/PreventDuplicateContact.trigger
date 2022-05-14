/*
      Created By: Norman Breuer
      Lasted Updated: 05 May 2022
      Description: Trigger for Project Two
*/

trigger PreventDuplicateContact on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
      
      switch on trigger.operationType {
          when BEFORE_INSERT { 
              PreventDuplicateContactHandler.preventDupCon(Trigger.new);
          }
          when BEFORE_UPDATE {
              
          }
          when BEFORE_DELETE { 
              
          }
          when AFTER_INSERT { 
            
          }
          when AFTER_UPDATE {

          }
          when AFTER_DELETE { 

          }
          when AFTER_UNDELETE {
              
          }
      }
}