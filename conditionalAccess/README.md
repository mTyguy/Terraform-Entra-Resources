Can utilize MG-Graph Powershell module to quickly find user object ids

Lazily get all users and relevant properties:
    <br/>```(Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayname,userprincipalname,id,country,usagelocation,usertype,accountenabled" -OutputType PSObject).value```

Get information based on filter searches --
  1. Get user object ids via filtering for upn:
     <br/>```(Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/users?`$filter=startswith(userprincipalname,'a')&`$select=displayname,userprincipalname,id,country,usagelocation,usertype,accountenabled" -OutputType PSObject).value```

<br/>example output:

| key               | value                                |
|-------------------|--------------------------------------|
| displayName       | Abraham Lincoln                      |
| userPrincipalName | ajackson@domain.com                  |
| id                | bd0628e8-6d00-4998-8428-d180aee17f42 |
| country           | GB,FR,SE                             |
| usageLocation     | US                                   |
| userType          | Member                               |
| accountEnabled    | true                                 |

| key               | value                                |
|-------------------|--------------------------------------|
| displayName       | Andrew Jackson                       |
| userPrincipalName | ajackson@domain.com                  |
| id                | d24960b9-2592-42a6-9c44-27bd15e5fd69 |
| country           | US                                   |
| usageLocation     | US                                   |
| userType          | Member                               |
| accountEnabled    | true                                 |

  3. Get user object ids via job titles:
     <br/>```(Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/users?`$filter=startswith(jobtitle,'tier 1')&`$select=displayname,userprincipalname,id,country,usagelocation,usertype,accountenabled" -OutputType PSObject).value```

<br/>example output:

| key               | value                                  |
|-------------------|----------------------------------------|
| displayName       | : Andrew Jackson                       |
| userPrincipalName | ajackson@domain.com                    |
| id                | : d24960b9-2592-42a6-9c44-27bd15e5fd69 |
| country           | : US                                   |
| usageLocation     | : US                                   |
| userType          | : Member                               |
| accountEnabled    | : true                                 |

  5. Get users object ids via their group memberships when you know the group name or approximate group name:
     <br/>```(Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/groups?`$filter=startswith(displayname, 'tier')&expand=members(`$select=id,userprincipalname)").value.members | Select-Object `@odata.type,displayname,userprincipalname,id,country,usagelagelocation,usertype,accountenabled | Format-List```

<br/>example output (utilize @odata.type to easily identity user vs device):

| key               | value                                |
|-------------------|--------------------------------------|
| @odata.type       | #microsoft.graph.user                |
| displayName       | t1                                   |
| userPrincipalName | t1@domain.com                        |
| id                | c5988c5f-6d6a-4597-a86f-3313ac4910b0 |
| country           | US                                   |
| usagelagelocation |                                      |
| userType          | Member                               |
| accountEnabled    | False                                |
        
| key               | value                                |
|-------------------|--------------------------------------|
| @odata.type       | #microsoft.graph.user                |
| displayName       | t2                                   |
| userPrincipalName | t2@domain.com                        |
| id                | f3356c39-065b-4b20-8527-8a4220e0945f |
| country           | US                                   |
| usagelagelocation |                                      |
| userType          | Member                               |
| accountEnabled    | False                                |
        
| key               | value                                |
|-------------------|--------------------------------------|
| @odata.type       | #microsoft.graph.user                |
| displayName       | t3                                   |
| userPrincipalName | t3@domain.com                        |
| id                | 914cfb10-e80b-4dcf-8cbc-06372a9ced6d |
| country           | US                                   |
| usagelagelocation |                                      |
| userType          | Member                               |
| accountEnabled    | False                                |
