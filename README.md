1: Identity
    Phishing Resistant MFA
        Fido2/PIV
    Privileged Identity Management
        Just-in-Time Access
    Prep for Data Labeling/Classification
        Define Security Context
    User Lifecycle Management
        Saviynt/SailPoint
    Privileged Access Management

2: Device
    Device Compliance Standards
        Defender/Okta/EDR Compliance Data Enrichment
        Conditional Access Polices Enforcement
        zScaler, Prisma Access, Firewall, VPN, and/or ForeScout/NAC Enforcement

3: Data
    Labeling/Classification
        Microsoft 0365 Purview, Microsoft Purview, Varonis
    Data Loss Prevention

4: Visibility and Analytics
    (Identity) Export User Risk from Entra to Splunk/Sentinel
    (Identity) Sentinel Workbooks and Splunk Dashboards for UEBA
    (Device) Pull SWAM/HWAM data with a tool like CrowdStrike, Axonius, or ForeScout.

5: Automation
    Adopt Infrastructure as Code as soon as possible (terraform)
    Deployments should all be Ansible/Salt nothing by hand with love and care.
    Shift Left: Device Hardening should be done at Deployment

6: Applications and Workloads
    Move all workloads to be immutable.  Don't patch nuke from orbit and redeploy.

7: Network
    The Network team has had 20 years to do segmentation they are my least priority.
    Fast Network Overlay Illumio and Slack's Nebula
    Enable User/Group based firewall rules for East/West.
    Encrypted DNS has limited support from DNS Server to Internet Root DNS.  (InfoBlox has support)

8: Governance
    Define Zero Trust Policies
    Audit Logging of all assets
    User training and awareness
    Incident response plans
    Data governance policies
