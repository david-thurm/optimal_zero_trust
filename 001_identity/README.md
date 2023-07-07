<!-- <center>
<font size="9"> 
<span style="color:blue">Optimal <span style="color:red">IDENTITY <span style="color:blue"> Project Outline</span>.
</font>
</center> -->
# Optimal Identity Project Outline
***

## Enable PIV/FIDO2
## Conditional Access Policies
## Device Compliance Policies
## Export logs to Splunk
- Create an HTTP Event Collector token in your Splunk Environment
- Create an Event Hub Namespace
- Send data to an Event Hub
- Deploy the functions to Azure
## Priviledged Access Management
- Provide just-in-time access to critical resources
- Allow secure remote access using encrypted gateways in lieu of passwords
- Monitor privileged sessions to support investigative audits
- Analyze unusual privileged activity that might be harmful to your organization
- Capture privileged account events for compliance audits
- Generate reports on privileged user access and activity
- Protect DevOps with integrated password security
## Privileged Identity Management
-  Provide just-in-time privileged access to Azure AD and Azure resources
*  Assign time-bound access to resources using start and end dates
-  Require approval to activate privileged roles
*  Enforce multi-factor authentication to activate any role
-  Use justification to understand why users activate
*  Get notifications when privileged roles are activated
-  Conduct access reviews to ensure users still need roles
*  Download audit history for internal or external audit
-  Prevents removal of the last active Global Administrator and Privileged Role Administrator role assignments
## Azure Local Administrator Passwords (LAPS)
- Enabling Windows LAPS with Azure AD - Enable a tenant wide policy and a client-side policy to backup local administrator password to Azure AD.
*  Local administrator password management - Configure client-side policies to set account name, password age, length, complexity, manual password reset and so on.
-  Recovering local administrator password - Use API/Portal experiences for local administrator password recovery.
*  Enumerating all Windows LAPS enabled devices - Use API/Portal experiences to enumerate all Windows devices in Azure AD enabled with Windows LAPS.
-  Authorization of local administrator password recovery - Use role based access control (RBAC) policies with custom roles and administrative units.
* Auditing local administrator password update and recovery - Use audit logs API/Portal experiences to monitor password update and recovery events.
- Conditional Access policies for local administrator password recovery - Configure Conditional Access policies on directory roles that have the authorization of password recovery.
## Disk Encryption with BitLocker
## Migrate On-Prem Apps to Azure Active Directory Authentication

***
# Appendix
## https://learn.microsoft.com/en-us/security/zero-trust/deploy/identity
## https://learn.microsoft.com/en-us/azure/active-directory/hybrid/connect/four-steps
## https://learn.microsoft.com/en-us/windows-server/identity/laps/laps-scenarios-azure-active-directory
## https://github.com/splunk/azure-functions-splunk/blob/master/event-hubs-hec/README.md