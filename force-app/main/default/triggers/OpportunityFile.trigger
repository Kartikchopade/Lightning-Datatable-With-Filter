trigger OpportunityFile on Opportunity (before update,before delete) {
 OpportunityFileHandler.OppStageCheck(trigger.newMap,trigger.oldMap);
}