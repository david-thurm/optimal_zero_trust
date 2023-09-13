$params = @{
    "PrincipalId" = "d29e358a-a443-4d83-98b3-499a5405bb5b"
    "RoleDefinitionId" = "88d8e3e3-8f55-4a1e-953a-9b9898b8876b"
    "Justification" = "Add eligible assignment"
    "DirectoryScopeId" = "/"
    "Action" = "AdminAssign"
    "ScheduleInfo" = @{
      "StartDateTime" = Get-Date
      "Expiration" = @{
        "Type" = "AfterDuration"
        "Duration" = "PT10H"
        }
      }
     }
  
  New-MgRoleManagementDirectoryRoleEligibilityScheduleRequest -BodyParameter $params | 
    Format-List Id, Status, Action, AppScopeId, DirectoryScopeId, RoleDefinitionId, IsValidationOnly, Justification, PrincipalId, CompletedDateTime, CreatedDateTime