public with sharing class TriggerService {
	public static Map<string, List<String>> getTriggers()
    {
    	System.debug('In trigger getter');
        List<ApexTrigger> triggerList = TriggerSelector.getTriggers();
     	Map<string, List<string>> triggerMap = new Map<string, List<string>>();
        List<string> triggerTempList;
        for(ApexTrigger apexTriggerObj : triggerList)
        {
        	System.debug('In trigger getter - IN FOR');
            triggerTempList = new List<string>();
            if(triggerMap.containsKey(apexTriggerObj.TableEnumOrId)){
                triggerTempList.addAll(triggerMap.get(apexTriggerObj.TableEnumOrId));
                triggerTempList.add(apexTriggerObj.ID); 
            }
            else{
            	triggerTempList.add(apexTriggerObj.ID);
            }
            triggerMap.put(apexTriggerObj.TableEnumOrId, triggerTempList);                     
        }
        System.debug('In trigger getter - OUT FOR');
        return triggerMap;
    } 
    public static void deleteTrigger(List<String> selectedTriggers)
    {
        Map<string, List<String>> triggerMap = new Map<string, List<String>>();
        triggerMap.put('ApexTrigger', selectedTriggers);
        Id batchJobId = database.executeBatch(new ConfigurationCleanUpBatchService(triggerMap),100);
        System.debug('batchJobId - ' + batchJobId);
    }
}