@echo off
echo Notes:
echo Download and unzip axis-bin-1_4.zip, put this wsdl2java.bat to axis-1_4\lib and run it.
echo A jar file adcenter-v8.jar would be generated if all good, please use it in your app.
echo mail.jar and activiation.jar are optional, not required here.

echo -----------------------
echo Converting Ad Intelligence Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://adcenterapi.microsoft.com/Api/Advertiser/v8/CampaignManagement/AdIntelligenceService.svc?wsdl

echo Converting Bulk Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://adcenterapi.microsoft.com/Api/Advertiser/v8/CampaignManagement/BulkService.svc?wsdl 

echo Converting Campaign Management Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://adcenterapi.microsoft.com/Api/Advertiser/v8/CampaignManagement/CampaignManagementService.svc?wsdl

echo Converting Customer Billing Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://sharedservices.adcenterapi.microsoft.com/Api/Billing/v8/CustomerBillingService.svc?wsdl 

echo Converting Customer Management...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://sharedservices.adcenterapi.microsoft.com/Api/CustomerManagement/v8/CustomerManagementService.svc?wsdl

echo Converting Notification Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://sharedservices.adcenterapi.microsoft.com/Api/Notification/v8/NotificationService.svc?wsdl

echo Converting Optimizer Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://adcenterapi.microsoft.com/Api/Advertiser/v8/Optimizer/OptimizerService.svc?wsdl 

echo Converting Reporting Service...
java -cp .;* org.apache.axis.wsdl.WSDL2Java -a https://adcenterapi.microsoft.com/Api/Advertiser/v8/Reporting/ReportingService.svc?wsdl

echo Compiling java source code...
javac -cp .;* -encoding UTF-8 com/microsoft/adapi/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/adcenter/v8/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/adcenter/api/customerbilling/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/adcenter/api/customermanagement/Entities/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/adcenter/api/customermanagement/Exception/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/adcenter/api/customermanagement/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/adcenter/api/notifications/Entities/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/adcenter/api/notifications/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/Microsoft_AdCenter_Advertiser_CampaignManagement_Api_DataContracts/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/Microsoft_AdCenter_Advertiser_Optimizer_Api_DataContracts/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/Microsoft_AdCenter_Advertiser_Optimizer_Api_DataContracts_Entities/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/Microsoft_AdCenter_Shared_Api/*.java

echo Creating jar file adcenter-v8.jar...
jar cf adcenter-v8.jar com/microsoft/* org/datacontract/*

echo WSDL2Java V8 Converting completed!

echo Use following command to add to your maven repository
echo mvn install:install-file -Dfile=adcenter-v8.jar -DgroupId=com.microsoft -DartifactId=adcenter -Dversion=v8 -Dpackaging=jar
