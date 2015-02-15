@echo off
echo Running The Step 1......
echo Notes:
echo Download and unzip axis-bin-1_4.zip, put this wsdl2java.bat to axis-1_4\lib and run it.
echo A jar file bingads-v9.jar would be generated if all good, please use it in your app.
echo mail.jar and activiation.jar are optional, not required here.

echo -----------------------
echo Converting Ad Intelligence Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://api.bingads.microsoft.com/Api/Advertiser/AdIntelligence/v9/AdIntelligenceService.svc?wsdl

echo Converting Bulk Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://api.bingads.microsoft.com/Api/Advertiser/CampaignManagement/v9/BulkService.svc?wsdl 

echo Converting Campaign Management Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://api.bingads.microsoft.com/Api/Advertiser/CampaignManagement/v9/CampaignManagementService.svc?wsdl

echo Converting Customer Billing Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://clientcenter.api.bingads.microsoft.com/Api/Billing/v9/CustomerBillingService.svc?wsdl 

echo Converting Customer Management...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://clientcenter.api.bingads.microsoft.com/Api/CustomerManagement/v9/CustomerManagementService.svc?wsdl

echo Converting Optimizer Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://api.bingads.microsoft.com/Api/Advertiser/Optimizer/v9/OptimizerService.svc?wsdl 

echo Converting Reporting Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://api.bingads.microsoft.com/Api/Advertiser/Reporting/v9/ReportingService.svc?wsdl

echo Please change long[] to Long[] within the following java files to fix the ArrayOfNullableOflong issue, then run The Step 2:
echo 1. AddAdsResponse.java
echo 2. AddKeywordsResponse.java
