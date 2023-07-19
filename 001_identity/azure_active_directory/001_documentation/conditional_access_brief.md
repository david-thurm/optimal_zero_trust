# CONDITIONAL ACCESS BRIEF INSTRUCTIONS
## Enable Security Key -- This may be no longer needed
[Account Protection](https://portal.azure.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AdminAuthMethods)

Step 1: Account Protection > Create Policy  
Step 2: Platform > Windows 10 and Later > Profile > Account Protection > Create  
Step 3: Name > Security Keys  
Step 4: Configuration Settings > Enable to use Security Keys for Sign-In  
Step 5: Add Groups > Search Test > Select Test User Group > Select  
Step 6: Create


## [Enable Temporary Access Pass](https://portal.azure.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AdminAuthMethods)
 
Step 1: Policies > Temporary Access Pass  
Step 2: Enable and Target > Enable > Add Groups > Search “test” > Click “test_user_group” > Select  
Step 3: Exclude > Add Groups > Search “break” > Select Break_Glass_Group > Select  
Step 4: Configure > Require one-time use > Update  
Step 5: Save  

## Device Compliance
[Windows Compliance Policy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesWindowsMenu/~/compliancePolicies)  
[IOS Compliance Policy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesIosMenu/~/compliancePolicies)  
[macOS Compliance Policy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMacOsMenu/~/compliancePolicies)  
[Linux Compliance Policy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesLinuxMenu/~/compliancePolicies)  
[Android Compliance POlicy](https://endpoint.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesAndroidMenu/~/compliancePolicies)  
### Windows Device Compliance
Step 1: Policies > Create Policy > Platform > Windows 10 and Later > Select Windows 10 and Later  
Step 2: Create  
Step 3: Basics > Name > “Windows 10/11 Compliance > Next  
Step 4: Compliance Settings > Device Health  
Step 5: Compliance Settings > System Security > Next  

## [Named Locations](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/NamedLocations)

Step 1: Named Locations  
Step 2: Named Locations > Countries Location  
Step 3: Name > Search “United States” > Select United States > Create  
Step 4: IP Ranges Location > Name > Mark Trusted Location > Enter new IPv4 > Add  
Step 5: Save  

## [Authentication Strengths](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/AuthStrengths)

Step 1: Authentication Strengths > New Authentication Strength > Name > FIDO2 Security Key > Certificate-based Auth > Temporary Access Pass > Next  
Step 2: Create  

## Deny High Risk User Login (CISA)
### [Endpoint Conditional Access Policies](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  

Step 1: Policies > New Policy  
Step 3: Select Users > Specific Users Included > Select Users and Groups  
Step 4: Exclude > Users and Groups > Search “break” > Select Break Glass Group >Select  
Step 5: Select Cloud Apps or Actions > All Cloud Apps  
Step 6: Select Conditions > User Risk > High  
Step 7: Select Grant > Block Access  
Step 8: Enable Policy > Save  

## Deny High Sign-in Risk (CISA)
### [Endpoint Conditional Access Policies](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Name > “Deny High Sign-in Risk” > Users and Groups > Search “Test” > Select Test User > Select > Exclude > Check-Mark Users and Groups > Search “Break” > Select Break Glass Group > Select  
Step 4: Target Resources > Cloud Apps > All Cloud Apps  
Step 5: Conditions > Sign-in Risk > Configure YES > High > Done  
Step 6: Grant > Block Access > Select  
Step 7: Enable Policy > Create  

## Deny Non-United States Locations
### [Endpoint Conditional Access Policies](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Name > Deny Non-US Locations > Users > Search “test” > Select Test Users > Select  
Step 3: Cloud Apps or Actions > All Cloud Apps  
Step 4: Conditions > Locations > Configure > Select Locations > Select None  
Step 5: Select Multifactor Auth Trusted IPs > Select Department HQ > Select United States > Select  
Step 6: Include > Any Location  
Step 7: Grant > Block Access > Select  
Step 8: Enable Policy > Create  

## Deny Legacy Authentication (CISA)
### [Endpoint Conditional Access Policies](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Users > Select Users and Groups > Users and Groups > Search “test” > Select Test Users > Select  
Step 3: All Cloud Apps > Include > All Cloud Apps  
Step 4: Conditions > Client Apps > Configure > Legacy Auth Clients > Active Sync > Other Clients > Done  
Step 5: Grant > Block Access > Select  
Step 6: Enable Policy > Create  

## Device Compliance (CISA)
### [Endpoint Conditional Access Policies](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Users > Select Users and Groups > Users and Groups > Search “test” > Select Test Device > Select  
Step 3: All Cloud Apps > Include > All Cloud Apps  
Step 4: Conditions > Device Platforms > Configure > Include > Select Device Platforms > Windows > Done  
Step 5: Grant > Grant Access > Require Device to be Marked Compliant > Select  
Step 6: Enable Policy > Create  

## Phishing Resistant MFA for Admins (CISA)
### [Endpoint Conditional Access Policies](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Name > Users > Select Users and Groups > Users & Groups > Search > Select Test Device > Select  
Step 3: Exclude > Search “Break Glass” > Select Break Glass Group > Select  
Step 4: All Cloud Apps > Include > All Cloud Apps  
Step 5: Grant > Grant Access > Require Authentication Strength > Phishing Resistant MFA > Select  
Step 6: Enforce Policy > Create  

## Phishing Resistant MFA for All Users (CISA)
### [Endpoint Conditional Access Policies](https://endpoint.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies)  
Step 1: Policies > New Policy  
Step 2: Name > Users > Select Users and Groups > Users & Groups > Search > Select Test Device > Select  
Step 3: Exclude > Users and Groups > Search “Break Glass” Group > Select Break Glass Group > Select  
Step 4: All Cloud Apps > Include > All Cloud Apps  
Step 5: Grant > Grant Access > Require Authentication Strength > Phishing Resistant MFA > Select  
Step 6: Enforce Policy > Create  

