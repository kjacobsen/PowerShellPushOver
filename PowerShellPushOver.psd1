#
# Module manifest for module 'PowerShellPushOver'
#
# Generated by: Kieran Jacobsen <code@poshsecurity.com>
#
# Generated on: 11/12/2014
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '2.0.1'

# ID used to uniquely identify this module
GUID = '8ff2aed8-e1b3-48b5-b9a2-53304cca18a6'

# Author of this module
Author = 'Kieran Jacobsen <code@poshsecurity.com>'

# Company or vendor of this module
CompanyName = 'Posh Security <poshsecurity.com>'

# Copyright statement for this module
Copyright = '(c) 2016 Kieran Jacobsen <code@poshsecurity.com>. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Send PushOver.Net notifications to your devices from PowerShell'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('.\PowerShellPushOver.psm1')

# Functions to export from this module
FunctionsToExport = @('Send-Pushover', 'Get-PushoverReceipt', 'Test-Pushover')

# Cmdlets to export from this module
CmdletsToExport = ''

# Variables to export from this module
VariablesToExport = ''

# Aliases to export from this module
AliasesToExport = ''

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('pushover', 'mobile', 'notifications', 'android', 'ios', 'iphone')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/poshsecurity/PowerShellPushOver/blob/master/LICENSE.md'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/poshsecurity/PowershellPushover/'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = 'Fix PSD1 loading issue'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

