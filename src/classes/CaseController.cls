public class CaseController 
{
   @AuraEnabled
   public static List<Case> getCases() {
       return [SELECT Id FROM Case ORDER BY CreatedDate ASC limit 10];
   }   
}