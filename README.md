## I: Identity
    1: Phishing Resistant MFA
        A: Fido2/PIV
    2: Privileged Identity Management
        B: Just-in-Time Access
    3: Prep for Data Labeling/Classification
        C: Define Security Context  
    4: User Lifecycle Management
        D: Saviynt/SailPoint  
    5: Privileged Access Management  

## II: Device
    1: Device Compliance Standards
        A: Defender/Okta/EDR Compliance Data Enrichment  
        B: Conditional Access Polices Enforcement  
        C: zScaler, Prisma Access, Firewall, VPN, and/or ForeScout/NAC Enforcement  

## III: Data
    1: Labeling/Classification  
        A: Microsoft 0365 Purview, Microsoft Purview, Varonis  
    2: Data Loss Prevention  

## IV: Visibility and Analytics
    1: (Identity) Export User Risk from Entra to Splunk/Sentinel  
    2: (Identity) Sentinel Workbooks and Splunk Dashboards for UEBA  
    3: (Device) Pull SWAM/HWAM data with a tool like CrowdStrike, Axonius, or ForeScout.  

## V: Automation
    1: Adopt Infrastructure as Code as soon as possible (terraform)  
    2: Deployments should all be Ansible/Salt nothing by hand with love and care.  
    3: Shift Left: Device Hardening should be done at Deployment  

## VI: Applications and Workloads
    1: Move all workloads to be immutable.  Don't patch nuke from orbit and redeploy.  

## VII: Network
    1: The Network team has had 20 years to do segmentation they are my least priority.  
    2: Fast Network Overlay Illumio and Slack's Nebula  
    3: Enable User/Group based firewall rules for East/West.  
    4: Encrypted DNS has limited support from DNS Server to Internet Root DNS.  (InfoBlox has support)  

## VIII: Governance
    1: Define Zero Trust Policies  
    2: Audit Logging of all assets  
    3: User training and awareness  
    4: Incident response plans  
    5: Data governance policies  
