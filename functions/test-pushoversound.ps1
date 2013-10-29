function test-pushoversound
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
  [Parameter(mandatory=$true)] [String] $sound,
  [System.Net.IWebProxy] $WebProxy
)

	$validsounds = get-PushoverSounds -APIToken $APIToken -WebProxy $WebProxy
	
	
	return 	($validsounds.selectnodes($sound).'#text' -ne $null)
	
}