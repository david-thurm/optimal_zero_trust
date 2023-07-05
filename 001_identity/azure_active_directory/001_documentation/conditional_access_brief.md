# CONDITIONAL ACCESS BRIEF INSTRUCTIONS
## Enable Security Key


<details>
<summary>Enable Security Key</summary>


| Step | Description |
|---:|:---|
|1| Account Protection > Create Policy
|2| Platform > Windows 10 and Later > Profile > Account Protection > Create              |
|3| Name > Security Keys
|4| Configuration Settings > Enable to use Security Keys for Sign-In
|5| Add Groups > Search Test > Select Test User Group > Select
|6| Create
</details>


## Enable Temporary Access Pass
Step 1: Policies > Temporary Access Pass  
Step 2: Enable and Target > Enable > Add Groups > Search “test” > Click “test_user_group” > Select  
Step 3: Exclude > Add Groups > Search “break” > Select Break_Glass_Group > Select  
Step 4: Configure > Require one-time use > Update  
Step 5: Save  

## Device Compliance
Step 1:Policies > Temporary Access Pass  
Step 2: Policies > Create Policy > Platform > Windows 10 and Later > Select Windows 10 and Later  
Step 3: Create  
Step 4: Basics > Name > “Windows 10/11 Compliance > Next  
Step 5: Compliance Settings > Device Health  
Step 6: Compliance Settings > System Security > Next  

## Named Locations
Step 1: Named Locations  
Step 2: Named Locations > Countries Location  
Step 3: Name > Search “United States” > Select United States > Create  
Step 4: IP Ranges Location > Name > Mark Trusted Location > Enter new IPv4 > Add  
Step 5: Save  

## Authentication Strengths
Step 1: Authentication Strengths > New Authentication Strength > Name > FIDO2 Security Key > Certificate-based Auth > Temporary Access Pass > Next  
Step 2: Create  

## Deny High Risk User Login (CISA)
Step 1: Intune Admin Center > Endpoint Security > Conditional Access  
Step 2: Policies > New Policy  
Step 3: Select Users > Specific Users Included > Select Users and Groups  
Step 4: Exclude > Users and Groups > Search “break” > Select Break Glass Group >Select  
Step 5: Select Cloud Apps or Actions > All Cloud Apps  
Step 6: Select Conditions > User Risk > High  
Step 7: Select Grant > Block Access  
Step 8: Enable Policy > Save  

## Deny High Sign-in Risk (CISA)
Step 1: Name > “Deny High Sign-in Risk” > Users and Groups > Search “Test” > Select Test User > Select  
Step 2: Exclude > Check-Mark Users and Groups > Search “Break” > Select Break Glass Group > Select  
Step 2: Cloud Apps or Actions > All Cloud Apps  
Step 3: Conditions > Configure > High > Done  
Step 4: Grant > Block Access > Select  
Step 5: Enable Policy > Create  

## Deny Non-United States Locations
Step 1: Policies > New Policy  
Step 2: Name > Deny Non-US Locations > Users > Search “test” > Select Test Users > Select  
Step 3: Cloud Apps or Actions > All Cloud Apps  
Step 4: Conditions > Locations > Configure > Select Locations > Select None  
Step 5: Select Multifactor Auth Trusted IPs > Select Department HQ > Select United States > Select  
Step 6: Include > Any Location  
Step 7: Grant > Block Access > Select  
Step 8: Enable Policy > Create  

## Deny Legacy Authentication (CISA)
Step 1: Policies > New Policy  
Step 2: Users > Select Users and Groups > Users and Groups > Search “test” > Select Test Users > Select  
Step 3: All Cloud Apps > Include > All Cloud Apps  
Step 4: Conditions > Client Apps > Configure > Legacy Auth Clients > Active Sync > Other Clients > Done  
Step 5: Grant > Block Access > Select  
Step 6: Enable Policy > Create  

## Device Compliance (CISA)
Step 1: Policies > New Policy  
Step 2: Users > Select Users and Groups > Users and Groups > Search “test” > Select Test Device > Select  
Step 3: All Cloud Apps > Include > All Cloud Apps  
Step 4: Conditions > Device Platforms > Configure > Include > Select Device Platforms > Windows > Done  
Step 5: Grant > Grant Access > Require Device to be Marked Compliant > Select  
Step 6: Enable Policy > Create  

## Phishing Resistant MFA for Admins (CISA)
Step 1: Policies > New Policy  
Step 2: Name > Users > Select Users and Groups > Users & Groups > Search > Select Test Device > Select  
Step 3: Exclude > Search “Break Glass” > Select Break Glass Group > Select  
Step 4: All Cloud Apps > Include > All Cloud Apps  
Step 5: Grant > Grant Access > Require Authentication Strength > Phishing Resistant MFA > Select  
Step 6: Enforce Policy > Create  

## Phishing Resistant MFA for All Users (CISA)
Step 1: Policies > New Policy  
Step 2: Name > Users > Select Users and Groups > Users & Groups > Search > Select Test Device > Select  
Step 3: Exclude > Users and Groups > Search “Break Glass” Group > Select Break Glass Group > Select  
Step 4: All Cloud Apps > Include > All Cloud Apps  
Step 5: Grant > Grant Access > Require Authentication Strength > Phishing Resistant MFA > Select  
Step 6: Enforce Policy > Create  

