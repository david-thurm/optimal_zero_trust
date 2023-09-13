## Azure AD PIM + Conditional Access integration

https://entra.microsoft.com/#home  


## [Enable Global Reader Role](https://portal.azure.com/#view/Microsoft_Azure_PIMCommon/UserRolesViewModelMenuBlade/~/members/menuId/members/roleName/Global%20Reader/roleObjectId/f2ef992c-3afb-46b9-b7cf-a126ee74c451/isRoleCustom~/false/roleTemplateId/f2ef992c-3afb-46b9-b7cf-a126ee74c451/resourceId/274cd9b2-b5c2-4638-b976-6fb35dcb68fb/isInternalCall~/true)

Removes the need to elevate priviledges for the priviledged users to view the Entra settings.

```
Add Assignements
Select member(s): <no member selected>
Select Member(s): <check>
<select>
<Next>
Assignment type: <Active>
Enter justification: <your justification>
<Assign>
```



## Conditional Access | Authentication Context
https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/AuthenticationContext
```
<New Conditional Access Context>
Name: Strong Authentication
Description: Strong Authentication
<Save>
```



## Conditional Access Policy

```
Name: Phishing Resistant MFA for Just in Time
Target Resources: Authentication Contexts
Select: Strong Authentication
Grant: Require authentication strength of: FIDO2
<Select>
<Save>
```

## Entra Identity PIM Roles
[Azure AD Role Configuration](https://entra.microsoft.com/#view/Microsoft_Azure_PIMCommon/ResourceMenuBlade/~/quickstart/resourceId//resourceType/tenant/provider/aadroles)

### (left side of the Screen) Identity governance > Privileged Identity Management > Azure AD roles > Roles  
```
Assign Eligibility
Select Role: Global Administrator
Add Assignment
Select member(s): <your user>
<Select>
<Next>
Assignement type: Eligible
Perminantly eligible: <check>
<Assign>
```

## Role Settings [Global Administrator](https://entra.microsoft.com/#view/Microsoft_Azure_PIMCommon/RoleSettingsView/policyId/32614eb4-f001-4f0d-944a-5e537a14f13a/roleName/Global%20Administrator)
Activation Tab
```
<Edit>
Maximum activation duration: 1 hour
On Activation Require: Azure AD Conditional Access Authentication Context
<Select> Strong Authentication
<Check> Require Justification on activation
<Save>
```
Assignment Tab
```

```
Notification Tab
```

Role Assignment Alerts: <check>
Notification to the Assigned User: <check>
Request to approve a role assignement renewal/extension: <check>
<update>

```

### Nuance of Priviledged Identity Management -- Just-in-Time 
The user will be prompted to activate the role when they attempt to access the Azure AD Privileged Identity Management portal. The user will be prompted to authenticate with the Required Authentication Context method. ie FIDO2/PIV  

If the user previously logged in to the console with the same required context method it will not prompt again for reauthentication but will allow escalation.