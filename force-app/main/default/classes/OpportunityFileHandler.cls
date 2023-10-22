public class OpportunityFileHandler {
	public static void OppStageCheck(Map<Id, SObject> newMap, Map<Id, SObject> oldMap)
    {   
        Map<Id, Opportunity> newOppMap = (Map<Id, Opportunity>)newMap;
        for(Opportunity oppObj : [SELECT Id,Name,StageName, (SELECT Id FROM ContentDocumentLinks) FROM Opportunity WHERE Id IN: newOppMap.keySet()]){ 
            if(oppObj.ContentDocumentLinks.size() == 0 && newOppMap.get(oppObj.Id).StageName == 'Closed Won'){
                newOppMap.get(oppObj.Id).StageName.addError('Please attach at least one file before updating opportunity to Closed Won');
            }
        }
    }
}