function get-pushoverreceipt
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
  [Parameter(mandatory=$true)] [String] $Receipt,
  [System.Net.IWebProxy] $WebProxy,
  [String] $PushOverReceiptURL = 'https://api.pushover.net/1/receipts/',
  [String] $PushOverReceiptURLMEthod = '.json?token='
)

#check if we can access the upload values method
if ((Get-Command get-WebPage -ErrorAction silentlycontinue) -eq $null) 
{
	throw "Could not find the function Send-WebPage"
}

$RequestURL = $PushOverReceiptURL + $Receipt + $PushOverReceiptURLMEthod + $APIToken


try
{
	Write-Verbose "Getting receipt from $RequestURL"
	$receipt = get-webpage -url $RequestURL
}
catch
{
	throw $_
}

Write-Verbose " Writing response:"
Write-Verbose "--------------------"
Write-Verbose "$receipt"
Write-Verbose "--------------------"

return convertfrom-json $receipt

}