function Test-PushOver 
{
<#
.SYNOPSIS
Tests if the API token and user (optional device ID) are valid.

.DESCRIPTION
This function can be used to validate pushover API tokens, user identifiers and optionally device identifiers. This function calls send-webpage, sending the specified tokens to the 
pushover.net validiation page. IF everything is valid and the API service returns 1, then this function will return 1, else false.

Note/Warning: False will be returned if the following conditions occure:
	1) You cannot resolve the URL
	2) The URL is down
	3) You cannot access the url for some reason (no internet access)
	4) FINALLY: The api token, user id or device ID are invalid

.PARAMETER APIToken
your application's API token

.PARAMETER User
the identifier of your user (or you), viewable when logged into the dashboard

.PARAMETER DeviceID
[Optional] your user's device identifier to send the message directly to that device, rather than all of the user's devices

.PARAMETER PushOverAPIURL
[Optional] Overwrite stored URL for API

.INPUTS
Nothing can be piped directly into this function

.OUTPUTS
String containing status code returned from PushOver API server

.EXAMPLE
Test-PushOver -APIToken 'KzGDORePK8gMaC0QOYAMyEEuzJnyUi' -User 'pQiRzpo4DXghDmr9QzzfQu27cmVRsG'
tests if token and user are valid

.EXAMPLE
Send-PushOver -APIToken 'KzGDORePK8gMaC0QOYAMyEEuzJnyUi' -User 'pQiRzpo4DXghDmr9QzzfQu27cmVRsG' -DeviceID 'droid2'
Tests if token, user and device are valid

.NOTES
NAME: Test-PushOver
AUTHOR: kieran@thekgb.su
LASTEDIT: 2012-10-14 9:15:00
KEYWORDS:

.LINK
http://aperturescience.su/

.LINK
http://pushover.net/
#>
[CMDLetBinding()]
param
(
  [Parameter(mandatory=$true)] [String] $APIToken,
  [Parameter(mandatory=$true)] [String] $User,
  [String] $DeviceID,
  [String] $PushOverAPIURL = 'https://api.pushover.net/1/users/validate.xml'
)

#check if we can access the upload values method
if ((Get-Command Send-WebPage -ErrorAction silentlycontinue) -eq $null) 
{
	throw "Could not find the function Send-WebPage"
}

#collection containing the parameters we will be sending
$reqparams = new-object System.Collections.Specialized.NameValueCollection

#add the mandatory parameters (token, user identifier and the message)
$reqparams.Add("token",$token)
$reqparams.Add("user",$user)

#add the optional parameters if they have been specified (We will not process messageurltitle if no message url specified)
if ($DeviceID) 
{
	$reqparams.Add("device",$DeviceID)
}

#pushover require a specific content-type header
$headers = New-Object System.net.webheadercollection
$headers.Add("Content-Type", "application/x-www-form-urlencoded")

#send the request to the pushover server, capture the response
try 
{
	$response = Send-WebPage -URL $PushOverAPIURL -Values $reqparams -Headers $headers
} 
catch 
{
	#any exceptions caught will lead to us writing it out and returning false
	Write-Error $_
	return $false
}

#write the response in full for vebose output
Write-Verbose " Writing response:"
Write-Verbose "--------------------"
Write-Verbose "$response"
Write-Verbose "--------------------"

#convert response to xml
$xmlresponse = [xml]$response

# if we got back a status of 1, return true, else false
return ($xmlresponse.hash.status.'#text' -eq 1)

}
