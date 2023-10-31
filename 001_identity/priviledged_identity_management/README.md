
# Conditional Access Authentication Strength
## Conditional Access: [Authentication Strengths](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/AuthStrengths)
1. Authentication Strengths
2. New Authentication Strength
3. Name: FIDO2/PIV
4. Check: Certificate-Based Authentication (PIV)
5. Check: FIDO2 Security Key -- [Allowed Yubikey Security Keys](https://support.yubico.com/hc/en-us/articles/360016648959-YubiKey-Hardware-FIDO2-AAGUIDs)
6. Check: Windows Hello for Business (Optional)
7. Next
8. Create


## Conditional Access: [Authentication Contexts](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/AuthenticationContext)

1. Authentication Contexts
2. New Authentication Context
3. Name: Admin Privilege Context
4. Description: Fido2/PIV
5. Check: Publish to apps
6. Save


## Conditional Access: [Policies](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies) 
1. New Policy
2. Name: Admin Privilege Escalation
3. Users: Include All Users
4. Exclude: Exclude users and groups (Break Glass Accounts)
5. Target: Authentication Contexts
6. Check: Admin Privilege Context
7. Conditions: User Risk Low
8. Conditions: Sign-in Risk - Low
9. Conditions: Sign-in Risk - No Risk
10. Locations: All trusted Locations
11. Grant Access: Require authentication strength of: FIDO2/PIV

# Privileged Identity Management: [Main Menu](https://portal.azure.com/#view/Microsoft_Azure_PIMCommon/CommonMenuBlade/~/quickStart)



# Privileged Identity: [Roles](https://portal.azure.com/#view/Microsoft_Azure_PIMCommon/ResourceMenuBlade/~/roles/resourceId//resourceType/tenant/provider/aadroles)

## Global Administrator
1. Search: Global Administrator
2. Select: Global Administrator
3. Settings
4. Edit 
5. Activation duration: 4 hours 
6. On Activation, Require: Microsoft Entra Conditional Access Authentication Context
7. Select: Strong Authentication (Previously created MFA context)
8. Require Justification on activation
9. Require approval to activate (Optional)
10. Select Approver(s): Plus Symbol
11. Search for your user
12. Next: Assignment

PIM Role Assignment
1. Check: Allow permanent eligible assignments
2. Uncheck: Allow permanent active assignment
3. Require justification on assignment
4. Next: Notification
   
Notification

Send notifications when members are assigned as eligible to this role:
1. Role assignment alert
2. Additional recipients: Add appropriate email recipients (Optional)

\
Send notifications when members are assigned as active to this role:
1. Role assignment alert
2. Additional recipients: Add appropriate email recipients (Optional)

\
Send notifications when eligible members activate this role:
1. Role activation alert
2. Additional recipients: Add appropriate email recipients (Optional)
3. Update


## Global Reader
1. Search: Global Reader
2. Select: Global Reader
3. Settings
4. Edit
5. Activation duration: None
6. Uncheck: Require justification on activation
7. Next: Assignment

\
Edit role setting - Global Reader
1. Check: Allow permanent  eligible assignments
2. Check: Allow permanent active assignment
3. Uncheck: Require justification on active assignment
4. Next: Notification (No Changes)
5. Update

\
Add Assignments: Membership
1. Select member(s): Search for your user(s)
2. Select: Next

\
Add Assignments: Setting
1. Assignment type: Eligible
2. Check: Permanently eligible
3. Assign



## Nuance of Priviledged Identity Management -- Just-in-Time
The user will be prompted to activate the role when they attempt to access the Azure AD Privileged Identity Management portal. The user will be prompted to authenticate with the Required Authentication Context method. ie FIDO2/PIV

If the user previously logged in to the console with the same required context method it will not prompt again for reauthentication but will allow escalation.
