public with sharing class ConfigurationCleanUpService {
    
    public Map<string, List<String>> apexTriggerList {get; set;}
    public List<ApexPage> visualforcePageList {get; set;}
    public Map<string, List<String>> workflowList {get; set;}
    public Map<string, List<String>> validationRuleList {get; set;}
    
    public List<String> selectedApexTriggerList {get; set;}
    public List<String> selectedVisualforcePageList {get; set;}
    public List<String> selectedWorkflowList {get; set;}
    public List<String> selectedValidationRuleList {get; set;}
    
    public ConfigurationCleanUpService(){
    	
    }
    //DONE
    public void getTriggers(){
     	apexTriggerList = TriggerService.getTriggers();
    }
    //DONE
    public void getVisualforcePages(){      
        visualforcePageList = VisualforcePageSelector.getVisualforcePages();
    }
    public void getWorkflows(){
    	workflowList = ConfigurationCleanUpServiceHandler.getWorkflows();
    	System.debug('workflowList - '  + workflowList);
    }
    public void getValidationRules(){
    	workflowList = ConfigurationCleanUpServiceHandler.getValidationRules();
    }
    public void configurationCleanUp(){
    	/*getTriggers();
    	List<List<String>> somelist = new List<List<String>>();
    	somelist = apexTriggerList.values();
    	System.debug('apexTriggerList.values() - ' + somelist[0]);
    	TriggerService.deleteTrigger(somelist[0]);
    	
    	getVisualforcePages();
    	List<ApexPage> someApexPagelist = new List<ApexPage>();
    	someApexPagelist = visualforcePageList;
    	System.debug('visualforcePageList.values() - ' + someApexPagelist);
    	List<String> pageList = new List<String>();
    	for(ApexPage obj:someApexPagelist){
    		if(obj.Name != 'VFDatatable' && 
    		obj.Name != 'Check' && 
    		obj.Name != 'VFPureBootstrap' && 
    		obj.Name != 'TestVFPage1' && 
    		obj.Name != 'ConfigurationCleanUp'){
    			pageList.add(obj.ID);
    		}
    	}
    	System.debug('pageList - ' + pageList);
    	ApexPageService.deleteApexPages(pageList);*/
    }
}