
[Entra Home Page](https://entra.microsoft.com/#home)

## https://abouconde.com/2019/07/10/enabling-azure-ad-privileged-identity-management-pim/


### [Start Page](https://portal.azure.com/#view/Microsoft_Azure_PIMCommon/CommonMenuBlade/~/quickStart)

Step 1: "Manage access" > Click "Manage"

### Modify Role Configurations
[Azure Roles](https://portal.azure.com/#view/Microsoft_Azure_PIMCommon/ResourceMenuBlade/~/roles/resourceId//resourceType/tenant/provider/aadroles/defaultId/roles)
[Entra PIM Quickstart](https://entra.microsoft.com/#view/Microsoft_Azure_PIMCommon/ResourceMenuBlade/~/quickstart/resourceId//resourceType/tenant/provider/aadroles)

### Install and Update Powershell Module
Install-Module -Name Az -Repository PSGallery -Force
Update-Module -Name Az -Force

```
Install-Module -Name AzureADPreview
Update-Module -Name AzureADPreview
```
### You have to connect to M$ Graph
```
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory"
```
$role = Get-AzureADMSLifecyclePolicy -Id <Role_ObjectId>
$role.MaximumInactiveDays = <New_Max_Inactive_Days>
Set-AzureADMSLifecyclePolicy -Id <Role_ObjectId> -LifecyclePolicy $role

List the Role
```
Get-AzRoleAssignment
```
Example:
```
PS C:\Users\DOEUser> Get-AzRoleAssignment -ObjectId c8524654-99b3-41d0-b3f4-3d503659af0e

RoleAssignmentName : f38e2492-0241-42ff-a3a6-4b9c0fc0af01
RoleAssignmentId   : /providers/Microsoft.Authorization/roleAssignments/f38e2492-0241-42ff-a3a6-4b9c0fc0af01
Scope              : /
DisplayName        : David
SignInName         : user@doe.gov
RoleDefinitionName : User Access Administrator
RoleDefinitionId   : 18d7d86d-d35e-46b5-a5c3-7673c20a62d9
ObjectId           : c8324354-92b3-41d0-b3f5-3d503559bf0e
ObjectType         : User
CanDelegate        : False
Description        :
ConditionVersion   :
Condition          :
```
### [Create a custom role](https://learn.microsoft.com/en-us/azure/role-based-access-control/tutorial-custom-role-powershell)
```
Get-AzRoleDefinition -Name "Reader"
```