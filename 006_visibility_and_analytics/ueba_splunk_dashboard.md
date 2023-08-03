# UEBA Splunk Dashboard

## Azure UEBA Reference -- https://learn.microsoft.com/en-us/azure/sentinel/ueba-reference

## Sending Event Hub Data to Splunk HEC -- https://github.com/splunk/azure-functions-splunk/blob/master/event-hubs-hec/README.md


## Search Results

- Azure Sign-in
- Azure User Added to Admin Group
- Azure New Account Created

- Azure Account Deleted

### Dashboard Code: Modify the Index for dashboard to work
```
<form version="1.1">
  <label>UEBA: Azure User Activity</label>
  <fieldset submitButton="false">
    <input type="time" token="field1">
      <label></label>
      <default>
        <earliest>-30d@d</earliest>
        <latest>now</latest>
      </default>
    </input>
  </fieldset>
  <row>
    <panel>
      <table>
        <title>Azure Sign-in</title>
        <search>
          <query>index = <CHANGE TO IDENTITY INDEX> 
    ActionType="Sign-in" 
    "ActivityInsights.App"="*" 
| dedup _raw
| rename "ActivityInsights.App" AS App, "DevicesInsights.UserAgentFamily" AS UserAgentFamily
| transaction keeporphans=t maxspan=60s ActionType UserPrincipalName App SourceIPAddress UserAgentFamily
| table _time ActionType UserPrincipalName App SourceIPAddress UserAgentFamily</query>
          <earliest>$field1.earliest$</earliest>
          <latest>$field1.latest$</latest>
          <sampleRatio>1</sampleRatio>
        </search>
        <option name="dataOverlayMode">none</option>
        <option name="drilldown">none</option>
        <option name="percentagesRow">false</option>
        <option name="refresh.display">progressbar</option>
        <option name="rowNumbers">false</option>
        <option name="totalsRow">false</option>
        <option name="wrap">true</option>
      </table>
    </panel>
  </row>
  <row>
    <panel>
      <table>
        <title>Azure User Added to Admin Group</title>
        <search>
          <query>index = <CHANGE TO IDENTITY INDEX> 
    operationName="Add*" 
    "properties.initiatedBy.user.userPrincipalName"="*" 
    "properties.targetResources{}.userPrincipalName"="*"
    "properties.result"="success" 
| eval Details = mvzip('properties.targetResources{}.modifiedProperties{}.displayName','properties.targetResources{}.modifiedProperties{}.newValue',"|") 
| eval Details = mvfilter(match(Details, "Group\.DisplayName\|\".*?((A|a)dmin).*?\"")) 
| rex field=Details "Group\.DisplayName\|\"(?&lt;Group&gt;.*?((A|a)dmin).*?)\"" 
| rename "properties.initiatedBy.user.userPrincipalName" AS "User modified by", "properties.targetResources{}.userPrincipalName" AS "User modified", "properties.result" AS Result 
| dedup _time operationName Result Group "User modified" "User modified by" 
| table _time operationName Result Group "User modified" "User modified by" 
| sort _time</query>
          <earliest>$field1.earliest$</earliest>
          <latest>$field1.latest$</latest>
          <sampleRatio>1</sampleRatio>
        </search>
        <option name="dataOverlayMode">none</option>
        <option name="drilldown">none</option>
        <option name="percentagesRow">false</option>
        <option name="refresh.display">progressbar</option>
        <option name="rowNumbers">false</option>
        <option name="totalsRow">false</option>
        <option name="wrap">true</option>
      </table>
    </panel>
  </row>
  <row>
    <panel>
      <table>
        <title>Azure New Account Created</title>
        <search>
          <query>index = <CHANGE TO IDENTITY INDEX> 
    operationName="Add user" 
    "properties.initiatedBy.user.userPrincipalName"="*" 
    "properties.targetResources{}.userPrincipalName"="*"
    "properties.result"="success" 
| eval Details = mvzip('properties.targetResources{}.modifiedProperties{}.displayName','properties.targetResources{}.modifiedProperties{}.newValue',"|") 
| rename "properties.initiatedBy.user.userPrincipalName" AS "User created by", "properties.targetResources{}.userPrincipalName" AS "User created", "properties.result" AS Result 
| dedup _time operationName Result "User created" "User created by" Details 
| table _time operationName Result "User created" "User created by" Details 
| sort _time</query>
          <earliest>$field1.earliest$</earliest>
          <latest>$field1.latest$</latest>
          <sampleRatio>1</sampleRatio>
        </search>
        <option name="dataOverlayMode">none</option>
        <option name="drilldown">none</option>
        <option name="percentagesRow">false</option>
        <option name="refresh.display">progressbar</option>
        <option name="rowNumbers">false</option>
        <option name="totalsRow">false</option>
        <option name="wrap">true</option>
      </table>
    </panel>
  </row>
  <row>
    <panel>
      <table>
        <title>Azure Account Deleted</title>
        <search>
          <query>index = <CHANGE TO IDENTITY INDEX>
    operationName="Delete user" 
    "properties.initiatedBy.user.userPrincipalName"="*" 
    "properties.targetResources{}.userPrincipalName"="*"
    "properties.result"="success" 
| eval Details = mvzip('properties.targetResources{}.modifiedProperties{}.displayName','properties.targetResources{}.modifiedProperties{}.newValue',"|") 
| rename "properties.initiatedBy.user.userPrincipalName" AS "User deleted by", "properties.targetResources{}.userPrincipalName" AS "User deleted", "properties.result" AS Result 
| eval "User deleted" = substr('User deleted', 33)
| dedup _time operationName Result "User deleted" "User deleted by" Details 
| table _time operationName Result "User deleted" "User deleted by" Details 
| sort _time</query>
          <earliest>$field1.earliest$</earliest>
          <latest>$field1.latest$</latest>
          <sampleRatio>1</sampleRatio>
        </search>
        <option name="dataOverlayMode">none</option>
        <option name="drilldown">none</option>
        <option name="percentagesRow">false</option>
        <option name="refresh.display">progressbar</option>
        <option name="rowNumbers">false</option>
        <option name="totalsRow">false</option>
        <option name="wrap">true</option>
      </table>
    </panel>
  </row>
</form>
```