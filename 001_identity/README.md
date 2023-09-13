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
- 
## Priviledged Access Management (PAM)
- Provide just-in-time access to critical resources
- Allow secure remote access using encrypted gateways in lieu of passwords
- Monitor privileged sessions to support investigative audits
- Analyze unusual privileged activity that might be harmful to your organization
- Capture privileged account events for compliance audits
- Generate reports on privileged user access and activity
- Protect DevOps with integrated password security
- 
## Privileged Identity Management (PIM)
-  Provide just-in-time privileged access to Azure AD and Azure resources
*  Assign time-bound access to resources using start and end dates
-  Require approval to activate privileged roles
*  Enforce multi-factor authentication to activate any role
-  Use justification to understand why users activate
*  Get notifications when privileged roles are activated
-  Conduct access reviews to ensure users still need roles
*  Download audit history for internal or external audit
-  Prevents removal of the last active Global Administrator and Privileged Role Administrator role assignments
-  
## Identity and Access Management (IAM)
- Identity management - The process of creating, storing, and managing identity information. Identity providers (IdP) are software solutions that are used to track and manage user identities, as well as the permissions and access levels associated with those identities.
- Identity federation - You can allow users who already have passwords elsewhere (for example, in your enterprise network or with an internet or social identity provider) to get access to your system.
- Provisioning and deprovisioning of users - The process of creating and managing user accounts, which includes specifying which users have access to which resources, and assigning permissions and access levels.
- Authentication of users - Authenticate a user, machine, or software component by confirming that they're who or what they say they are. You can add multi-factor authentication (MFA) for individual users for extra security or single sign-on (SSO) to allow users to authenticate their identity with one portal instead of many different resources.
- Authorization of users - Authorization ensures a user is granted the exact level and type of access to a tool that they're entitled to. Users can also be portioned into groups or roles so large cohorts of users can be granted the same privileges.
- Access control - The process of determining who or what has access to which resources. This includes defining user roles and permissions, as well as setting up authentication and authorization mechanisms. Access controls regulate access to systems and data.
- Reports and monitoring - Generate reports after actions taken on the platform (like sign-in time, systems accessed, and type of authentication) to ensure compliance and assess security risks. Gain insights into the security and usage patterns of your environment.
- 
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

## Purview for Office 365 (Data and Identity Pillars)

## Purview for Datalake (Data and Identity Pillars)
https://learn.microsoft.com/en-us/azure/architecture/solution-ideas/articles/azure-purview-data-lake-estate-architecture

## Purview for AWS s3 Buckets (Data and Identity Pillars)
https://techcommunity.microsoft.com/t5/security-compliance-and-identity/scanning-and-labeling-aws-s3-buckets-with-azure-purview/ba-p/2833072

## Cloud Access Security Broker (Network and Identity Pillars)
To Be Determined

## Cloud Web Proxy (Network and Identity Pillars)
To Be Determined 

***
# Appendix
## https://learn.microsoft.com/en-us/security/zero-trust/deploy/identity
## https://learn.microsoft.com/en-us/azure/active-directory/hybrid/connect/four-steps
## https://learn.microsoft.com/en-us/windows-server/identity/laps/laps-scenarios-azure-active-directory
## https://github.com/splunk/azure-functions-splunk/blob/master/event-hubs-hec/README.md
