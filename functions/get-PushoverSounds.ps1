function get-pushoversounds
{
<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER APIToken
your application's API token

.PARAMETER Receipt

.PARAMETER PushOverAPIURL
[Optional] Overwrite stored URL for API

.INPUTS
Nothing can be piped directly into this function

.EXAMPLE

.EXAMPLE

.OUTPUTS

.NOTES
NAME: 
AUTHOR: 
LASTEDIT: 2012-10-14 9:15:00
KEYWORDS:

.LINK


.LINK
http://pushover.net/
#>
[CMDLetBinding()]
param
(
  [Parameter(mandatory=$true)] [String] $APIToken,
  [System.Net.IWebProxy] $WebProxy,
  [String] $PushOverSoundAPIURL = 'https://api.pushover.net/1/sounds.xml?token='
)

#check if we can access the upload values method
if ((Get-Command get-WebPage -ErrorAction silentlycontinue) -eq $null) 
{
	throw "Could not find the function get-WebPage"
}

try
{
	Write-Verbose "Getting sounds list from $PushOverSoundAPIURL$APIToken"
	$sounds = get-webpage -url ($PushOverSoundAPIURL + $APIToken)
}
catch
{
	throw $_
}

Write-Verbose " Writing response:"
Write-Verbose "--------------------"
Write-Verbose "$sounds"
Write-Verbose "--------------------"

return ([xml]$sounds).hash.sounds

}