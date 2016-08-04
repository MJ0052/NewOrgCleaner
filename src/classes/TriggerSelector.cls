public with sharing class TriggerSelector {
    public static List<ApexTrigger> getTriggers()
    {
        List<ApexTrigger> triggerList = new List<ApexTrigger>([Select TableEnumOrId,Name from ApexTrigger]);
        return triggerList;
    }
}