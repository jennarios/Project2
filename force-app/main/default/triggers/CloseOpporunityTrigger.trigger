/*
      Created By: Mustafa Rasouli
      Last Updated: 13 May 2022
      Discription: The Trigger should add any task to an opporunity
*/

trigger CloseOpporunityTrigger on Opportunity (before insert, after update) {
      List<Task> taskList = new List<Task>();
      for(Opportunity opporunity:Trigger.new){
            if(opporunity.StageName =='Close won'){
                  Task task = new Task();
                  task.Subject = 'Follow up Task';
                  task.WhatId = opporunity.Id;
                  taskList.add(task);
            }
      }
      if(taskList.size()>0){
            insert taskList;
      }
}