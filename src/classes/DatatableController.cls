public class DatatableController {

   @AuraEnabled
   public static List<Case> getCases() {
       system.debug([SELECT Id FROM Case limit 10]);
       return [SELECT Id FROM Case limit 10];
   }   
}