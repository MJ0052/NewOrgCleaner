public with sharing class DemoClass {
     public static void triggercreate(integer start,integer iCount){
     	for(integer i=start;i<iCount;i++)
     	{
            String json = '{ "Name" : "AccountTrigger'+i+'", "TableEnumOrId" : "Account", "Body" : "trigger AccountTrigger'+i+' on Account (before insert) { }" }';
            Httprequest req = new HttpRequest();
            req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v30.0/sobjects/ApexTrigger');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
            req.setBody(json);
            
            Http httpReq = new Http();
            HttpResponse res = httpReq.send(req);
            System.debug(i + ' -- ' +res.getBody());
        }
     }
      public static void triggerclass(integer start,integer iCount){
     	for(integer i=start;i<iCount;i++)
     	{
            String json = '{ "Name" : "SampleClass'+i+'", "Body" : "public class SampleClass'+i+'{ }" }';
            Httprequest req = new HttpRequest();
            req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v30.0/sobjects/ApexClass');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
            req.setBody(json);
            
            Http httpReq = new Http();
            HttpResponse res = httpReq.send(req);
            System.debug(i + ' -- ' +res.getBody());
        }
     }
     public static void triggerApexPage1(integer start,integer iCount){
     	for(integer i=start;i<iCount;i++)
     	{
            String json = '{ "Name" : "SampleApexPage'+i+'","Label" : "SampleApexPage'+i+'"}';
            Httprequest req = new HttpRequest();
            req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v30.0/sobjects/ApexPage');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
            req.setBody(json);
            
            Http httpReq = new Http();
            HttpResponse res = httpReq.send(req);
            System.debug(i + ' -- ' +res.getBody());
        }
     }
     public static void triggerApexPage(integer start,integer iCount){
     	for(integer i=start;i<iCount;i++)
     	{
            MetadataAPI.createPage('SamplePage'+i,'SamplePage'+i);
        }
     }
}