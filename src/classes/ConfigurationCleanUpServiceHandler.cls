public with sharing class ConfigurationCleanUpServiceHandler {
    public static Map<string, List<string>> getTriggersbyObject()
    {
        List<ApexTrigger> triggerList = TriggerSelector.getTriggers();
     	Map<string, List<string>> triggerMap = new Map<string, List<string>>();
        List<string> triggerTempList;
        for(ApexTrigger apexTriggerObj : triggerList)
        {
            triggerTempList = new List<string>();
            if(triggerMap.containsKey(apexTriggerObj.TableEnumOrId)){
                triggerTempList.addAll(triggerMap.get(apexTriggerObj.TableEnumOrId));
                triggerTempList.add(apexTriggerObj.Name); 
            }
            else{
            	triggerTempList.add(apexTriggerObj.Name);
            }
            triggerMap.put(apexTriggerObj.TableEnumOrId, triggerTempList);                     
        }
        return triggerMap;
    }
    public static Map<string, List<String>> getWorkflows()
    {
    	Map<string, List<String>> WorkflowMap = new Map<string, List<String>>();
    	MetadataAPI mapi = new MetadataAPI();
        MetadataService.FileProperties[] fileproperties = mapi.listWorkflowMetadata();
        if(fileproperties != null){
        	list<String> WorkflowName;
    		for(MetadataService.FileProperties fileProperty : fileproperties)
    		{
	    		if(fileProperty.fullName != null && fileProperty.fullName != '')
    	        {
        	        WorkflowName = new List<String>();                
            	    string Objectname = fileProperty.fullName;
                	if(WorkflowMap.containsKey(Objectname.substringBefore('.')))
                	{ 
	                    WorkflowName.addAll(WorkflowMap.get(Objectname.substringBefore('.')));
    	                WorkflowName.add(Objectname.substringAfter('.'));   
        	        }
            	    else{
                	   	WorkflowName.add(Objectname.substringAfter('.'));
                	}
               		WorkflowMap.put(Objectname.substringBefore('.'), WorkflowName);      
    			}
    		}
        }
    	return WorkflowMap;        
    }
    public static Map<string, List<String>> getValidationRules()
    {
    	Map<string, List<String>> ValidationRuleMap = new Map<string, List<String>>();
    	MetadataAPI mapi = new MetadataAPI();
        MetadataService.FileProperties[] fileproperties = mapi.listValidationRuleMetadata();
        if(fileproperties != null){
        	list<String> ValidationRuleName;
    		for(MetadataService.FileProperties fileProperty : fileproperties)
    		{
	    		if(fileProperty.fullName != null && fileProperty.fullName != '')
    	        {
        	        ValidationRuleName = new List<String>();                
            	    string Objectname = fileProperty.fullName;
                	if(ValidationRuleMap.containsKey(Objectname.substringBefore('.')))
                	{ 
                    	ValidationRuleName.addAll(ValidationRuleMap.get(Objectname.substringBefore('.')));
                    	ValidationRuleName.add(Objectname.substringAfter('.'));   
                	}
                	else{
	                    ValidationRuleName.add(Objectname.substringAfter('.'));
    	            }
        	       	ValidationRuleMap.put(Objectname.substringBefore('.'), ValidationRuleName);      
    			}
    		}
        }
    	return ValidationRuleMap;         
    }
}