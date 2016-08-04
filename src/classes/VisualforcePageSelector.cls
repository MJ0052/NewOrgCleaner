public with sharing class VisualforcePageSelector {
    public static List<ApexPage> getVisualforcePages(){      
        List<ApexPage> apexPageList = new List<ApexPage>([Select Id, Name From Apexpage]);
        return apexPageList;
    }
}