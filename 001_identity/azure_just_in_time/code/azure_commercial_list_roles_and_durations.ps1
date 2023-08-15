
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



# Get all role definitions
# limit results to id, 
$RoleDefinitionsRequestParams = @{
    Method = 'Get'
    Uri = "https://graph.microsoft.com/v1.0/rolemanagement/directory/roleDefinitions?`$select=id,description,displayName,isBuiltIn,isEnabled"
    Headers = @{
        Authorization = "Bearer $AccessToken"
    }
}
$RoleDefinitionsRequest = Invoke-RestMethod @RoleDefinitionsRequestParams
$RoleDefinitions = $RoleDefinitionsRequest.value
if ($RoleDefinitions -ne $null) {
    Write-Host "Role definitions retrieved" -ForegroundColor Green
}




# For each role, list the duration of the assigned policy and export the results to a csv
$results = [System.Collections.ArrayList]@()
$RoleDefinitions | % {
    $thisRole = $_
    $thisRoleID = $thisRole.id

    # Get the policies assigned to this role
    $RolePolicyAssignments = $null
    $RolePolicyAssignmentsRequestParams = @{
        Method = 'Get'
        Uri = "https://graph.microsoft.com/v1.0/policies/roleManagementPolicyAssignments?`$filter=scopeId eq '/' and scopeType eq 'DirectoryRole' and roleDefinitionId eq '$thisRoleID'&`$expand=policy(`$expand=rules)"
        Headers = @{
            Authorization = "Bearer $AccessToken"
        }
    }
    $RolePolicyAssignmentsRequest = Invoke-RestMethod @RolePolicyAssignmentsRequestParams
    $RolePolicyAssignments = $RolePolicyAssignmentsRequest.value
    if ($RolePolicyAssignments -ne $null) {
        Write-Host "Role policy assignments retrieved" -ForegroundColor Green
    }
    
    # Get the "Activation maximum duration (hours)" for each policy assignment
    $RolePolicyAssignments | % {
        $RolePolicyRules = $null
        $policyID = $_.policyId
        $RolePolicyRulesRequestParams = @{
            Method = 'Get'
            Uri = "https://graph.microsoft.com/v1.0/policies/roleManagementPolicies/$policyID/rules?`$filter=id eq 'Expiration_EndUser_Assignment'"
            Headers = @{
                Authorization = "Bearer $AccessToken"
            }
        }
        $RolePolicyRulesRequest = Invoke-RestMethod @RolePolicyRulesRequestParams
        $RolePolicyRules = $RolePolicyRulesRequest.value
        if ($RolePolicyRules -ne $null) {
            Write-Host "Role policy rules retrieved" -ForegroundColor Green
            
            $result = [PSCustomObject]@{
                RoleID = $thisRoleID
                RoleDescription = $thisRole.description
                RoleName = $thisRole.displayName
                RoleIsBuiltIn = $thisRole.isBuiltIn
                RoleIsEnabled = $thisRole.isEnabled
                RoleExpirationRequired = $RolePolicyRules.isExpirationRequired
                RoleDuration = $RolePolicyRules.maximumDuration
            }
            $results += $result
        }
    }
}

$results | Export-Csv "Azure_RoleDurations.csv" -NoTypeInformation