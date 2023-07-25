# CONDITIONAL ACCESS BRIEF INSTRUCTIONS
## [Enable Security Key](https://portal.azure.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AdminAuthMethods)

Step 1: Account Protection > Create Policy  
Step 2: Platform > Windows 10 and Later > Profile > Account Protection > Create  
Step 3: Name > Security Keys  
Step 4: Configuration Settings > Enable to use Security Keys for Sign-In  
Step 5: Add Groups > Search Test > Select Test User Group > Select  
Step 6: Create

## [Enable Certificate Based Authentication](https://portal.azure.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AdminAuthMethods)

###  Certificate Authority Download and Install
[Entrust Certificate Download Site](https://www.entrust.com/resources/certificate-solutions/tools/root-certificate-downloads)  
Step 1: Choose Appropriate CA for your group  

[Azure Certificate Authorities](https://portal.azure.us/#view/Microsoft_AAD_IAM/SecurityMenuBlade/~/CertificateAuthorities)  
Step 1: Upload  
Step 2: Browse to Certificate you downloaded  
Step 3: Is Root CA Certificate > yes  
Step 4: Certificate Revocation List URL > "http://repo.fpki.gov/fcpca/fcpcag2.crl"  
Step 5: Add


### Certificate-based authentication Prep Work

Step 1: Launch Entrust Certificate Manager  
Step 2: Intended Purpose > Client Authentication,Smart Card Login, etc  
Step 3: Open Certificate > Details > Subject Key Identifier > Copy Contents to Notepad  
Step 4: Remove "KeyID=" and spaces between numbers  
[Azure AD Users](https://portal.azure.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers)  
Step 5: Azure AD > Users > Search "Test User" > Double Click "Test User"  
Step 6: Authorization Info > Edit Certificate user IDs  
Step 7: Add > "X509:<SKI>" followed by the Subject Key Identifier  
* Example:  "X509://<SKI>5cdea00000b5324400000002a98e03bccdab324567"  

Step 8: Save

### [Certificate-based Authentication Settings](https://portal.azure.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AdminAuthMethods)

Step 1: Enable  
Step 2: Select Groups > Add Groups > Search “test” > Click “test_user_group” > Click Select  
Step 3: Configure  
Step 4: Protection Level > "Single Factor Authentication"  
Step 5: Add Rule > Certificate Issuer  
Step 6: Certificate Issuer Identifier > Select Your Certificate Authority > Protection Level > "Multi-Factor Authentication" > Save  
Step 7: Certificate Field > certificateUserIds  
Step 8: User Binding > Certificate Field > Click "SubjectKeyIdentifier" Select User Attribute > Choose "CertificateUserIds"  
Step 9: Move "SubjectKeyIdentifier" to the top of the list
Step 10: Save

## [Enable Temporary Access Pass](https://portal.azure.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AdminAuthMethods)
 
Step 1: Policies > Temporary Access Pass  
Step 2: Enable and Target > Enable > Add Groups > Search “test” > Click “test_user_group” > Select  
Step 3: Exclude > Add Groups > Search “break” > Select Break_Glass_Group > Select  
Step 4: Configure > Require one-time use > Update  
Step 5: Save  

## Device Compliance
 
### [Windows Device Compliance](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesWindowsMenu/~/compliancePolicies)
Step 1: Policies > Create Policy > Platform > Windows 10 and Later > Select Windows 10 and Later  
Step 2: Create  
Step 3: Basics > Name > “Windows 10/11 Compliance" > Next  
Step 4: Compliance Settings > Device Health  
Step 5: Compliance Settings > System Security > Next  

### [iOS Compliance Policy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesIosMenu/~/compliancePolicies)  
### [macOS Compliance Policy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMacOsMenu/~/compliancePolicies)  
### [Linux Compliance Policy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesLinuxMenu/~/compliancePolicies)  
### [Android Compliance POlicy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesAndroidMenu/~/compliancePolicies) 

## [Named Locations](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/NamedLocations)

Step 1: Named Locations  
Step 2: Named Locations > Countries Location  
Step 3: Name > Search “United States” > Select United States > Create  
Step 4: IP Ranges Location > Name > Mark Trusted Location > Enter new IPv4 > Add  
Step 5: Save  

## [Authentication Strengths](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/AuthStrengths)

Step 1: Authentication Strengths > New Authentication Strength > Name > FIDO2 Security Key > Certificate-based Auth > Temporary Access Pass > Next  
Step 2: Create  

## [Deny High Risk User Login (CISA)](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies) 

Step 1: Policies > New Policy  
Step 3: Select Users > Specific Users Included > Select Users and Groups  
Step 4: Exclude > Users and Groups > Search “break” > Select Break Glass Group >Select  
Step 5: Select Cloud Apps or Actions > All Cloud Apps  
Step 6: Select Conditions > User Risk > High  
Step 7: Select Grant > Block Access  
Step 8: Enable Policy > Save  

## [Deny High Sign-in Risk (CISA)](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Name > “Deny High Sign-in Risk” > Users and Groups > Search “Test” > Select Test User > Select > Exclude > Check-Mark Users and Groups > Search “Break” > Select Break Glass Group > Select  
Step 4: Target Resources > Cloud Apps > All Cloud Apps  
Step 5: Conditions > Sign-in Risk > Configure YES > High > Done  
Step 6: Grant > Block Access > Select  
Step 7: Enable Policy > Create  

## [Deny Non-United States Locations](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Name > Deny Non-US Locations > Users > Search “test” > Select Test Users > Select  
# Fix This Garbage  
Step 3: Cloud Apps or Actions > All Cloud Apps  
Step 4: Conditions > Locations > Configure > Select Locations > Select Any  
Step 6: Include > Any Location  
Step 7: Grant > Block Access > Select  
Step 8: Enable Policy > Create  

## [Allow Only DOE IP Space](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies) 
Step 1: Policies > New Policy  
Step 2: Name > Allow Only DOE IP Space > Users > Search “test” > Select Test Users > Select  
Step 3: Cloud Apps or Actions > All Cloud Apps  
Step 4: Conditions > Locations > Configure (YES) > Include > Select "Any Location"   
Step 5: Exclude > Selected Locations > Select None > Choose DOE IP Space > Click Select  
Step 6: Grant > Block Access > Select  
Step 7: Enable Policy > Create  

## [Deny Legacy Authentication (CISA)](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Users > Select Users and Groups > Users and Groups > Search “test” > Select Test Users > Select  
Step 3: All Cloud Apps > Include > All Cloud Apps  
Step 4: Conditions > Client Apps > Configure > Legacy Auth Clients > Active Sync > Other Clients > Done  
Step 5: Grant > Block Access > Select  
Step 6: Enable Policy > Create  

## [Device Compliance (CISA)](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Users > Select Users and Groups > Users and Groups > Search “test” > Select Test Device > Select  
Step 3: All Cloud Apps > Include > All Cloud Apps  
Step 4: Conditions > Device Platforms > Configure > Include > Select Device Platforms > Windows > Done  
Step 5: Grant > Grant Access > Require Device to be Marked Compliant > Select > Required Hybrid Azure AD Joined Device  
Step 6: Enable Policy > Create  

## [Phishing Resistant MFA for Admins (CISA)](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)
Step 1: Policies > New Policy  
Step 2: Name > Users > Select Users and Groups > Users & Groups > Search > Select Test Device > Select  
Step 3: Exclude > Search “Break Glass” > Select Break Glass Group > Select  
Step 4: All Cloud Apps > Include > All Cloud Apps  
Step 5: Grant > Grant Access > Require Authentication Strength > Phishing Resistant MFA > Select  
Step 6: Enforce Policy > Create  

## [Phishing Resistant MFA for All Users (CISA)](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Name > Users > Select Users and Groups > Users & Groups > Search > Select Test Device > Select  
Step 3: Exclude > Users and Groups > Search “Break Glass” Group > Select Break Glass Group > Select  
Step 4: All Cloud Apps > Include > All Cloud Apps  
Step 5: Grant > Grant Access > Require Authentication Strength > Phishing Resistant MFA > Select  
Step 6: Enforce Policy > Create  


