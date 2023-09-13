import requests
import msal

# Replace these with your Azure AD credentials
TENANT_ID = '<your-tenant-id>'
CLIENT_ID = '<your-client-id>'
CLIENT_SECRET = '<your-client-secret>'

authority = f'https://login.microsoftonline.com/{TENANT_ID}'
scopes = ['https://graph.microsoft.com/.default']

app = msal.ConfidentialClientApplication(
    client_id=CLIENT_ID,
    client_credential=CLIENT_SECRET,
    authority=authority
)

result = app.acquire_token_silent(scopes=scopes, account=None)

if not result:
    result = app.acquire_token_for_client(scopes=scopes)

access_token = result['access_token']
# Replace these with the appropriate values
pim_role_id = '<application-admin-role-id>'
activation_max_duration = 'PT8H'  # Time duration in ISO 8601 format (e.g., PT8H for 8 hours)

headers = {
    'Authorization': f'Bearer {access_token}',
    'Content-Type': 'application/json'
}

payload = {
    'roleSettings': [
        {
            'id': pim_role_id,
            'maximumDuration': activation_max_duration
        }
    ]
}

url = f'https://graph.microsoft.com/v1.0/me/privilegedRoleSettings'

response = requests.patch(url, json=payload, headers=headers)

if response.status_code == 204:
    print('Activation maximum duration modified successfully.')
else:
    print(f'Failed to modify activation maximum duration. Status code: {response.status_code}, Error: {response.text}')
