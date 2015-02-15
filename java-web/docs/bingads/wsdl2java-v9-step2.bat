@echo off
echo Running The Step 2......

echo Compiling java source code...
javac -cp .;* -encoding UTF-8 com/microsoft/adapi/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/AdIntelligence/v9/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/Billing/v9/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/CampaignManagement/v9/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/Customer/v9/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/Customer/v9/Entities/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/Customer/v9/Exception/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/Optimizer/v9/*.java
javac -cp .;* -encoding UTF-8 com/microsoft/bingads/Reporting/v9/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/Microsoft_BingAds_Advertiser_CampaignManagement_Api_DataContracts/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/Microsoft_BingAds_Advertiser_Optimizer_Api_DataContracts/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/Microsoft_BingAds_Advertiser_Optimizer_Api_DataContracts_Entities/*.java
javac -cp .;* -encoding UTF-8 org/datacontract/schemas/_2004/_07/System_Collections_Generic/*.java

echo Creating jar file bingads-v9.jar...
jar cf bingads-v9.jar com/microsoft/* org/datacontract/*

echo WSDL2Java BingAds API V9 Converting completed!

echo Use following command to add to the maven repository
echo mvn install:install-file -Dfile=bingads-v9.jar -DgroupId=com.microsoft -DartifactId=bingads -Dversion=v9 -Dpackaging=jar
