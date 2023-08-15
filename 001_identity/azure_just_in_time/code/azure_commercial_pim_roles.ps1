###

# To manage the rules for Azure AD roles, grant yourself the RoleManagementPolicy.ReadWrite.Directory delegated permission. 
# To manage the rules for groups, grant yourself the RoleManagementPolicy.ReadWrite.AzureADGroup delegated permission.

###

$ClientSecret = Read-Host -Prompt 'Enter Secret'
$ClientID = "xxx"
$TenantID = "xxx"
$Resource = "https://graph.microsoft.com/"
$Scope = "https://graph.microsoft.com/.default"

#Get Access Token
$TokenRequestParams = @{
    Method = 'Post'
    Uri = "https://login.microsoftonline.com/$TenantID/oauth2/v2.0/token"
    Body = @{
        scope = $Scope
        client_id = $ClientID
        client_secret = $ClientSecret
        grant_type = "client_credentials"
    }
}
$TokenCodeRequest = Invoke-RestMethod @TokenRequestParams
if ($TokenCodeRequest.access_token -ne $null) { 
    Write-Host "Access token received" -ForegroundColor Green
}

$AccessToken = $TokenCodeRequest.access_token


# https://learn.microsoft.com/en-us/graph/api/rbacapplication-list-roledefinitions?view=graph-rest-1.0&tabs=http
$RoleDefinitionsRequestParams = @{
    Method = 'Get'
    Uri = "https://graph.microsoft.com/v1.0/rolemanagement/directory/roleDefinitions"
    Headers = @{
        Authorization = "Bearer $AccessToken"
    }
}
$RoleDefinitionsRequest = Invoke-RestMethod @RoleDefinitionsRequestParams
$RoleDefinitions = $RoleDefinitionsRequest.value
if ($RoleDefinitions -ne $null) {
    Write-Host "Role definitions retrieved" -ForegroundColor Green
}

# In Microsoft Graph, role settings are referred to as rules. 
# They're assigned to Azure AD roles through container policies. 
# Each Azure AD role is assigned a specific policy object. 
# You can retrieve all policies that are scoped to Azure AD roles.
# For each policy, you can retrieve the associated collection of rules by using an $expand query parameter.


# https://learn.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-change-default-settings
# https://learn.microsoft.com/en-us/graph/identity-governance-pim-rules-overview
# https://learn.microsoft.com/en-us/azure/active-directory/roles/assign-roles-different-scopes#assign-roles-scoped-to-the-tenant
# This method requires the $filter (eq) query parameter to scope the request to a scopeId and a scopeType. 
# You can also use the $select and $expand OData query parameters to help customize the response. 
# See https://learn.microsoft.com/en-us/azure/active-directory/roles/custom-overview#scope for information about scopes
# https://learn.microsoft.com/en-us/graph/api/unifiedrolemanagementpolicy-list-rules?view=graph-rest-1.0&tabs=http
$RolePoliciesRequestParams = @{
    Method = 'Get'
    Uri = "https://graph.microsoft.com/v1.0/policies/roleManagementPolicies?`$filter=scopeId eq '/' and scopeType eq 'DirectoryRole'&`$expand=rules"
    Headers = @{
        Authorization = "Bearer $AccessToken"
    }
}
$RolePoliciesRequest = Invoke-RestMethod @RolePoliciesRequestParams
$RolePolicies = $RolePoliciesRequest.value
if ($RolePolicies -ne $null) {
    Write-Host "Role policies retrieved" -ForegroundColor Green
}




# https://learn.microsoft.com/en-us/graph/api/policyroot-list-rolemanagementpolicyassignments?view=graph-rest-1.0&tabs=http
$RolePolicyAssignmentsRequestParams = @{
    Method = 'Get'
    Uri = "https://graph.microsoft.com/v1.0/policies/roleManagementPolicyAssignments?`$filter=scopeId eq '/' and scopeType eq 'DirectoryRole' and roleDefinitionId eq '9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3'&`$expand=policy(`$expand=rules)"
    Headers = @{
        Authorization = "Bearer $AccessToken"
    }
}
$RolePolicyAssignmentsRequest = Invoke-RestMethod @RolePolicyAssignmentsRequestParams
$RolePolicyAssignments = $RolePolicyAssignmentsRequest.value
if ($RolePolicyAssignments -ne $null) {
    Write-Host "Role policy assignments retrieved" -ForegroundColor Green
}


# List rules (for a role management policy)
# https://learn.microsoft.com/en-us/graph/api/unifiedrolemanagementpolicy-list-rules?view=graph-rest-1.0&tabs=http
# filtered to Expiration_EndUser_Assignment
$RolePolicyRulesRequestParams = @{
    Method = 'Get'
    Uri = "https://graph.microsoft.com/v1.0/policies/roleManagementPolicies/DirectoryRole_ba8e81a1-2c0a-45e7-99f8-198991f3989b_e3570317-8aa5-4517-aea3-4d647aa9e83c/rules?`$filter=id eq 'Expiration_EndUser_Assignment'"
    Headers = @{
        Authorization = "Bearer $AccessToken"
    }
}
$RolePolicyRulesRequest = Invoke-RestMethod @RolePolicyRulesRequestParams
$RolePolicyRules = $RolePolicyRulesRequest.value
if ($RolePolicyRules -ne $null) {
    Write-Host "Role policy rules retrieved" -ForegroundColor Green
}









# https://learn.microsoft.com/en-us/graph/how-to-pim-update-rules?tabs=http