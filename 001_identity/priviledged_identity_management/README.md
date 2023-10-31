# Create Entra Conditional Access Authentication Context


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
