# Chromium policies module for Home-Manager
# Auto-generated from Chrome policy HTML - do not edit manually
# Total policies: 453
#
# Usage:
#   programs.chromium.policies = {
#     PasswordManagerEnabled = false;
#     AutofillAddressEnabled = false;
#   };

{ config, lib, ... }:

let
  cfg = config.programs.chromium.policies;
  enabledPolicies = lib.filterAttrs (n: v: v != null) cfg;
in
{
  options.programs.chromium.policies = {

    AIModeSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for Google's AI Mode integrations in the address bar and New Tab page search box.

This policy controls Google's AI Mode integrations in the address bar and the New Tab page search box.

To access this feature, Google must be set as the user's default search engine.

0/unset = The feature will be available to users.

1 = The feature will not be available to users.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.
* 0 = Allow AI Mode integrations.
* 1 = Do not allow AI Mode integrations.
    '';
    };

    AbusiveExperienceInterventionEnforce = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Abusive Experience Intervention Enforce

If SafeBrowsingEnabled is not Disabled, then setting AbusiveExperienceInterventionEnforce to Enabled or leaving it unset prevents sites with abusive experiences from opening new windows or tabs.

Setting SafeBrowsingEnabled to Disabled or AbusiveExperienceInterventionEnforce to Disabled lets sites with abusive experiences open new windows or tabs.
    '';
    };

    AccessCodeCastDeviceDuration = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Specifies how long (in seconds) a cast device selected with an access code or QR code stays in the Google Cast menu's list of cast devices.

This policy specifies how long (in seconds) a cast device that was previously selected via an access code or QR code can be seen within the Google Cast menu of cast devices.
The lifetime of an entry starts at the time the access code was first entered or the QR code was first scanned.
During this period the cast device will appear in the Google Cast menu's list of cast devices.
After this period, in order to use the cast device again the access code must be reentered or the QR code must be rescanned.
By default, the period is zero seconds, so cast devices will not stay in the Google Cast menu, and so the access code must be reentered, or the QR code rescanned, in order to initiate a new casting session.
Note that this policy only affects how long a cast devices appears in the Google Cast menu, and has no effect on any ongoing cast session which will continue even if the period expires.
This policy has no effect unless the AccessCodeCastEnabled policy is Enabled.
    '';
    };

    AccessCodeCastEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow users to select cast devices with an access code or QR code from within the Google Cast menu.

This policy controls whether a user will be presented with an option, within the Google Cast menu which allows them to cast to cast devices that do not appear in the Google Cast menu, using either the access code or QR code displayed on the cast devices's screen.
By default, a user must reenter the access code or rescan the QR code in order to initiate a subsequent casting session, but if the AccessCodeCastDeviceDuration policy has been set to a non-zero value (the default is zero), then the cast device will remain in the list of available cast devices until the specified period of time has expired.
When this policy is set to Enabled, users will be presented with the option to select cast devices by using an access code or by scanning a QR code.
When this policy is set to Disabled or not set, users will not be given the option to select cast devices by using an access code or by scanning a QR code.
    '';
    };

    AccessControlAllowMethodsInCORSPreflightSpecConformant = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Make Access-Control-Allow-Methods matching in CORS preflight spec conformant

This policy controls whether request methods are uppercased when matching with Access-Control-Allow-Methods response headers in CORS preflight.

If the policy is Disabled, request methods are uppercased.
This is the behavior on or before Google Chrome 108.

If the policy is Enabled or not set, request methods are not uppercased, unless matching case-insensitively with DELETE, GET, HEAD, OPTIONS, POST, or PUT.
This would reject fetch(url, {method: 'Foo'}) + "Access-Control-Allow-Methods: FOO" response header,
and would accept fetch(url, {method: 'Foo'}) + "Access-Control-Allow-Methods: Foo" response header.

Note: request methods "post" and "put" are not affected, while "patch" is affected.

This policy is intended to be temporary and will be removed in the future.
    '';
    };

    AccessibilityImageLabelsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Get Image Descriptions from Google.

The Get Image Descriptions from Google
accessibility feature enables visually-impaired screen reader users to
get descriptions of unlabeled images on the web. Users who choose to enable it
will have the option of using an anonymous Google service to provide
automatic descriptions for unlabeled images they encounter on the web.

If this feature is enabled, the content of images will be sent to Google
servers in order to generate a description. No cookies or other user
data is sent, and Google does not save or log any image content.

If this policy is set to Enabled, the
Get Image Descriptions from Google
feature will be enabled, though it will only affect users who are using a
screen reader or other similar assistive technology.

If this policy is set to Disabled, users will not have the option of enabling
the feature.

If this policy is not set, user can choose to use this feature or not.
    '';
    };

    AdditionalDnsQueryTypesEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow DNS queries for additional DNS record types

This policy controls whether Google Chrome may query additional DNS record types when making insecure DNS requests. This policy has no effect on DNS queries made via Secure DNS, which may always query additional DNS types.

If this policy is unset or set to Enabled, additional types such as HTTPS (DNS type 65) may be queried in addition to A (DNS type 1) and AAAA (DNS type 28).

If this policy is set to Disabled, DNS will only be queried for A (DNS type 1) and/or AAAA (DNS type 28).

This policy is a temporary measure and will be removed in future versions of Google Chrome. After removal of the policy, Google Chrome will always be able to query additional DNS types.
    '';
    };

    AdsSettingForIntrusiveAdsSites = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Ads setting for sites with intrusive ads

Unless SafeBrowsingEnabled is set to False, then setting AdsSettingForIntrusiveAdsSites to 1 or leaving it unset allows ads on all sites.

Setting the policy to 2 blocks ads on sites with intrusive ads.
* 1 = Allow ads on all sites
* 2 = Do not allow ads on sites with intrusive ads
    '';
    };

    AdvancedProtectionAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable additional protections for users enrolled in the Advanced Protection program

This policy controls whether users enrolled in the Advanced Protection program receive extra protections. Some of these features may involve the sharing of data with Google (for example, Advanced Protection users will be able to send their downloads to Google for malware scanning). If set to True or not set, enrolled users will receive extra protections. If set to False, Advanced Protection users will receive only the standard consumer features.
    '';
    };

    AllHttpAuthSchemesAllowedForOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      List of origins allowing all HTTP authentication

Setting the policy specifies for which origins to allow all the HTTP authentication schemes Google Chrome supports regardless of the AuthSchemes policy.

Format the origin pattern according to this format (https://support.google.com/chrome/a?p=url_blocklist_filter_format). Up to 1,000 exceptions can be defined in AllHttpAuthSchemesAllowedForOrigins.
Wildcards are allowed for the whole origin or parts of the origin, either the scheme, host, port.
    '';
    };

    AllowBackForwardCacheForCacheControlNoStorePageEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow pages with Cache-Control: no-store header to enter back/forward cache

This policy controls if a page with Cache-Control: no-store header can be stored in back/forward cache. The website setting this header may not expect the page to be restored from back/forward cache since some sensitive information could still be displayed after the restoration even if it is no longer accessible.

If the policy is enabled or unset, the page with Cache-Control: no-store header might be restored from back/forward cache unless the cache eviction is triggered (e.g. when there is HTTP-only cookie change to the site).

If the policy is disabled, the page with Cache-Control: no-store header will not be stored in back/forward cache.
    '';
    };

    AllowCrossOriginAuthPrompt = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Cross-origin HTTP Authentication prompts

Setting the policy to Enabled allows third-party images on a page to show an authentication prompt.

Setting the policy to Disabled or leaving it unset renders third-party images unable to show an authentication prompt.

Typically, this policy is Disabled as a phishing defense.
    '';
    };

    AllowDeletingBrowserHistory = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable deleting browser and download history

Setting the policy to Enabled or leaving it unset means browser history and download history can be deleted in Chrome, and users can't change this setting.

Setting the policy to Disabled means browser history and download history can't be deleted. Even with this policy off, the browsing and download history are not guaranteed to be retained. Users may be able to edit or delete the history database files directly, and the browser itself may expire or archive any or all history items at any time.
    '';
    };

    AllowDinosaurEasterEgg = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Dinosaur Easter Egg Game

Setting the policy to True allows users to play the dinosaur game. Setting the policy to False means users can't play the dinosaur easter egg game when device is offline.

Leaving the policy unset means users can't play the game on enrolled Google ChromeOS, but can under other circumstances.
    '';
    };

    AllowFileSelectionDialogs = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow invocation of file selection dialogs

Setting the policy to Enabled or leaving it unset means Chrome can display, and users can open, file selection dialogs.

Setting the policy to Disabled means that whenever users perform actions provoking a file selection dialog, such as importing bookmarks, uploading files, and saving links, a message appears instead. The user is assumed to have clicked Cancel on the file selection dialog.
    '';
    };

    AllowSystemNotifications = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allows system notifications

Configures whether Google Chrome on Linux will use system notifications.

If set to True or not set, Google Chrome is allowed to use system notifications.

If set to False, Google Chrome will not use system notifications. Google Chrome's Message Center will be used as a fallback.
    '';
    };

    AllowWebAuthnWithBrokenTlsCerts = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Web Authentication requests on sites with broken TLS certificates.

If set to Enabled, Google Chrome will
allow Web Authentication requests on websites that have TLS certificates with
errors (i.e. websites considered not secure).

If the policy is set to Disabled or left unset, the default behavior of
blocking such requests will apply.
    '';
    };

    AllowedDomainsForApps = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Define domains allowed to access Google Workspace

Setting the policy turns on Chrome's restricted sign-in feature in Google Workspace and prevents users from changing this setting. Users can only access Google tools using accounts from the specified domains (to allow gmail or googlemail accounts, add consumer_accounts to the list of domains). This setting prevents users from signing in and adding a Secondary Account on a managed device that requires Google authentication, if that account doesn't belong to one of the explicitly allowed domains.

Leaving this setting empty or unset means users can access Google Workspace with any account.

Users cannot change or override this setting.

Note: This policy causes the X-GoogApps-Allowed-Domains header to be appended to all HTTP and HTTPS requests to all google.com domains, as described in https://support.google.com/a/answer/1668854.
    '';
    };

    AlternateErrorPagesEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable alternate error pages

Setting the policy to True means Google Chrome uses alternate error pages built into (such as "page not found"). Setting the policy to False means Google Chrome never uses alternate error pages.

If you set the policy, users can't change it. If not set, the policy is on, but users can change this setting.
    '';
    };

    AlternativeBrowserParameters = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Command-line parameters for the alternative browser.

Setting the policy to a list of strings means each string is passed to the alternative browser as separate command-line parameters. On Microsoft® Windows®, the parameters are joined with spaces. On macOS and Linux®, a parameter can have spaces and still be treated as a single parameter.

If a parameter contains $\{url}, $\{url} is replaced with the URL of the page to open. If no parameter contains $\{url}, the URL is appended at the end of the command line.

Environment variables are expanded. On Microsoft® Windows®, %ABC% is replaced with the value of the ABC environment variable. On macOS and Linux®, $\{ABC} is replaced with the value of the ABC environment variable.

Leaving the policy unset means only the URL is passed as a command-line parameter.
    '';
    };

    AlternativeBrowserPath = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Alternative browser to launch for configured websites.

Setting the policy controls which command to use to open URLs in an alternative browser. The policy can be set to one of $\{ie}, $\{firefox}, $\{safari}, $\{opera}, $\{edge} or a file path. When this policy is set to a file path, that file is used as an executable file. $\{ie} is only available on Microsoft® Windows®. $\{safari} and $\{edge} are only available on Microsoft® Windows® and macOS.

Leaving the policy unset puts a platform-specific default in use: Internet Explorer® for Microsoft® Windows®, or Safari® for macOS. On Linux®, launching an alternative browser will fail.
    '';
    };

    AlwaysOpenPdfExternally = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Always Open PDF files externally

Setting the policy to Enabled turns the internal PDF viewer off in Google Chrome, treats PDF files as a download, and lets users open PDFs with the default application.

Setting the policy to Disabled means that unless users turns off the PDF plugin, it will open PDF files.

If you set the policy, users can't change it in Google Chrome. If not set, users can choose whether to open PDF externally or not.
    '';
    };

    AmbientAuthenticationInPrivateModesEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Enable Ambient Authentication for profile types.

Configuring this policy will allow/disallow ambient authentication for Incognito and Guest profiles in Google Chrome.

Ambient Authentication is http authentication with default credentials if explicit credentials are not provided via NTLM/Kerberos/Negotiate challenge/response schemes.

Setting the RegularOnly (value 0), allows ambient authentication for Regular sessions only. Incognito and Guest sessions wouldn't be allowed to ambiently authenticate.

Setting the IncognitoAndRegular (value 1), allows ambient authentication for Incognito and Regular sessions. Guest sessions wouldn't be allowed to ambiently authenticate.

Setting the GuestAndRegular (value 2), allows ambient authentication for Guest and Regular sessions. Incognito sessions wouldn't be allowed to ambiently authenticate.

Setting the  All (value 3), allows ambient authentication for all sessions.

Note that, ambient authentication is always allowed on regular profiles.

In Google Chrome version 81 and later, if the policy is left not set, ambient authentication will be enabled in regular sessions only.
* 0 = Enable ambient authentication in regular sessions only.
* 1 = Enable ambient authentication in incognito and regular sessions.
* 2 = Enable ambient authentication in guest and regular sessions.
* 3 = Enable ambient authentication in regular, incognito and guest sessions.
    '';
    };

    AudioCaptureAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow or deny audio capture

Setting the policy to Enabled or leaving it unset means that, with the exception of URLs set in the AudioCaptureAllowedUrls list, users get prompted for audio capture access.

Setting the policy to Disabled turns off prompts, and audio capture is only available to URLs set in the AudioCaptureAllowedUrls list.

Note: The policy affects all audio input (not just the built-in microphone).
    '';
    };

    AudioCaptureAllowedUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      URLs that will be granted access to audio capture devices without prompt

Setting the policy means you specify the URL list whose patterns get matched to the security origin of the requesting URL. A match grants access to audio capture devices without prompt

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns/. Note, however, that the pattern "*", which matches any URL, is not supported by this policy.
    '';
    };

    AudioSandboxEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow the audio sandbox to run

This policy controls the audio process sandbox.
If this policy is enabled, the audio process will run sandboxed.
If this policy is disabled, the audio process will run unsandboxed and the WebRTC audio-processing module will run in the renderer process.
This leaves users open to security risks related to running the audio subsystem unsandboxed.
If this policy is not set, the default configuration for the audio sandbox will be used, which may differ per platform.
This policy is intended to give enterprises flexibility to disable the audio sandbox if they use security software setups that interfere with the sandbox.
    '';
    };

    AuthNegotiateDelegateAllowlist = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Kerberos delegation server allowlist

Setting the policy assigns servers that Google Chrome may delegate to. Separate multiple server names with commas. Wildcards, *, are allowed.

Leaving the policy unset means Google Chrome won't delegate user credentials, even if a server is detected as intranet.
    '';
    };

    AuthNegotiateDelegateByKdcPolicy = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use KDC policy to delegate credentials.

Setting the policy to Enabled means HTTP authentication respects approval by KDC policy. In other words, Google Chrome delegates user credentials to the service being accessed if the KDC sets OK-AS-DELEGATE on the service ticket. See RFC 5896 ( https://tools.ietf.org/html/rfc5896.html ). The service should also be allowed by AuthNegotiateDelegateAllowlist.

Setting the policy to Disabled or leaving it unset means KDC policy is ignored on supported platforms and only AuthNegotiateDelegateAllowlist is respected.

On Microsoft® Windows®, KDC policy is always respected.
    '';
    };

    AuthSchemes = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Supported authentication schemes

Setting the policy specifies which HTTP authentication schemes Google Chrome supports.

Leaving the policy unset employs all 4 schemes.

Valid values:

* basic

* digest

* ntlm

* negotiate

Note: Separate multiple values with commas.
    '';
    };

    AuthServerAllowlist = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Authentication server allowlist

Setting the policy specifies which servers should be allowed for integrated authentication. Integrated authentication is only on when Google Chrome gets an authentication challenge from a proxy or from a server in this permitted list.

Leaving the policy unset means Google Chrome tries to detect if a server is on the intranet. Only then will it respond to IWA requests. If a server is detected as internet, then Google Chrome ignores IWA requests from it.

Note: Separate multiple server names with commas. Wildcards, *, are allowed.
    '';
    };

    AutoLaunchProtocolsFromOrigins = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Define a list of protocols that can launch an external application from listed origins without prompting the user

Allows you to set a list of protocols, and for each protocol an associated list of allowed origin patterns, that can launch an external application without prompting the user. The trailing separator should not be included when listing the protocol, so list "skype" instead of "skype:" or "skype://".

If this policy is set, a protocol will only be permitted to launch an external application without prompting by policy if the protocol is listed, and the origin of the site trying to launch the protocol matches one of the origin patterns in that protocol's allowed_origins list. If either condition is false the external protocol launch prompt will not be omitted by policy.

If this policy is not set, no protocols can launch without a prompt by default. Users may opt out of prompts on a per-protocol/per-site basis unless the ExternalProtocolDialogShowAlwaysOpenCheckbox policy is set to Disabled. This policy has no impact on per-protocol/per-site prompt exemptions set by users.

The origin matching patterns use a similar format to those for the 'URLBlocklist' policy, which are documented at https://support.google.com/chrome/a?p=url_blocklist_filter_format.

However, origin matching patterns for this policy cannot contain "/path" or "@query" elements. Any pattern that does contain a "/path" or "@query" element will be ignored.

Schema:
{
  "items": {
    "properties": {
      "allowed_origins": {
        "items": {
          "type": "string"
        }, 
        "type": "array"
      }, 
      "protocol": {
        "type": "string"
      }
    }, 
    "required": [
      "protocol", 
      "allowed_origins"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    AutoOpenAllowedForURLs = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      URLs where AutoOpenFileTypes can apply

List of URLs specifying which urls AutoOpenFileTypes will apply to. This policy has no impact on automatically open values set by users.

If this policy is set, files will only automatically open by policy if the url is part of this set and the file type is listed in AutoOpenFileTypes. If either condition is false the download won't automatically open by policy.

If this policy isn't set, all downloads where the file type is in AutoOpenFileTypes will automatically open.

A URL pattern has to be formatted according to https://support.google.com/chrome/a?p=url_blocklist_filter_format.
    '';
    };

    AutoOpenFileTypes = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      List of file types that should be automatically opened on download

List of file types that should be automatically opened on download. The leading separator should not be included when listing the file type, so list "txt" instead of ".txt".

Files with types that should be automatically opened will still be subject to the enabled safe browsing checks and won't be opened if they fail those checks.

If this policy isn't set, only file types that a user has already specified to automatically be opened will do so when downloaded.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    AutoSelectCertificateForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Automatically select client certificates for these sites

Setting the policy lets you make a list of URL patterns that specify sites for which Chrome can automatically select a client certificate. The value is an array of stringified JSON dictionaries, each with the form { "pattern": "$URL_PATTERN", "filter" : $FILTER }, where $URL_PATTERN is a content setting pattern. $FILTER restricts the client certificates the browser automatically selects from. Independent of the filter, only certificates that match the server's certificate request are selected. On Android, Chrome can only select client certificates that it has provisioned itself; it cannot access certificates installed at the operating system level.

Examples for the usage of the $FILTER section:

* When $FILTER is set to { "ISSUER": { "CN": "$ISSUER_CN" } }, only client certificates issued by a certificate with the CommonName $ISSUER_CN are selected.

* When $FILTER contains both the "ISSUER" and the "SUBJECT" sections, only client certificates that satisfy both conditions are selected.

* When $FILTER contains a "SUBJECT" section with the "O" value, a certificate needs at least one organization matching the specified value to be selected.

* When $FILTER contains a "SUBJECT" section with a "OU" value, a certificate needs at least one organizational unit matching the specified value to be selected.

* When $FILTER is set to {}, the selection of client certificates is not additionally restricted. Note that filters provided by the web server still apply.

Leaving the policy unset means there's no autoselection for any site.

Schema:
{
  "items": {
    "properties": {
      "filter": {
        "properties": {
          "ISSUER": {
            "id": "CertPrincipalFields", 
            "properties": {
              "CN": {
                "type": "string"
              }, 
              "L": {
                "type": "string"
              }, 
              "O": {
                "type": "string"
              }, 
              "OU": {
                "type": "string"
              }
            }, 
            "type": "object"
          }, 
          "SUBJECT": {
            "properties": {
              "CN": {
                "type": "string"
              }, 
              "L": {
                "type": "string"
              }, 
              "O": {
                "type": "string"
              }, 
              "OU": {
                "type": "string"
              }
            }, 
            "type": "object"
          }
        }, 
        "type": "object"
      }, 
      "pattern": {
        "type": "string"
      }
    }, 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    AutofillAddressEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable AutoFill for addresses

Setting the policy to True or leaving it unset gives users control of Autofill for addresses in the UI.

Setting the policy to False means Autofill never suggests or fills address information, nor does it save additional address information that users submit while browsing the web.
    '';
    };

    AutofillCreditCardEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable AutoFill for credit cards

Setting the policy to True or leaving it unset means users can control autofill suggestions for credit cards in the UI.

Setting the policy to False means autofill never suggests or fills credit card information, nor will it save additional credit card information that users might submit while browsing the web.
    '';
    };

    AutofillPredictionSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for enhanced autofill

Specifies whether users can let Google Chrome use Generative AI to better understand forms and help them fill more fields.

0 = Allow the feature to be used, while allowing Google to use relevant data to improve its AI models. Relevant data may include prompts, inputs, outputs, source materials, and written feedback, depending on the feature. 0 is the default value, except when noted below.

1 = Allow the feature to be used, but does not allow Google to improve models using users' content (including prompts, inputs, outputs, source materials, and written feedback). 1 is the default value for Enterprise users managed by Google Admin console and for Education accounts managed by Google Workspace.

2 = Do not allow the feature.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow enhanced autofill and improve AI models.
* 1 = Allow enhanced autofill without improving AI models.
* 2 = Do not allow enhanced autofill.
    '';
    };

    AutomatedPasswordChangeSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Enable automated password change

This policy controls the availability of Google Chrome's automated password change feature.

If enabled, a user can trigger a process where the browser attempts to change their password on a website automatically. This process is managed by Generative AI. The new password is saved in the browser's password manager.

0 = Allow the feature to be used, while allowing Google to use relevant data to improve its AI models. Relevant data may include prompts, inputs, outputs, source materials, and written feedback, depending on the feature. It may also be reviewed by humans to improve AI models. 0 is the default value, except when noted below.

1 = Allow the feature to be used, but does not allow Google to improve models using users' content (including prompts, inputs, outputs, source materials, and written feedback). 1 is the default value for Enterprise users managed by Google Admin console and for Education accounts managed by Google Workspace.

2 = Do not allow the feature.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow feature use and improving AI models
* 1 = Allow feature use without improving AI models
* 2 = Do not allow feature
    '';
    };

    AutomaticFullscreenAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow automatic fullscreen on these sites

For security reasons, the
requestFullscreen() web API
requires a prior user gesture ("transient activation") to be called or will
otherwise fail. Users' personal settings may allow certain origins to call
this API without a prior user gesture, as described in
https://chromestatus.com/feature/6218822004768768.

This policy supersedes users' personal settings and allows matching origins to
call the API without a prior user gesture.

For detailed information on valid url patterns, please see
https://chromeenterprise.google/policies/url-patterns.
Wildcards, *, are allowed.

Origins matching both blocked and allowed policy patterns will be blocked.
Origins not specified by policy nor user settings will require a prior user
gesture to call this API.
    '';
    };

    AutomaticFullscreenBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block automatic fullscreen on these sites

For security reasons, the
requestFullscreen() web API
requires a prior user gesture ("transient activation") to be called or will
otherwise fail. Users' personal settings may allow certain origins to call
this API without a prior user gesture, as described in
https://chromestatus.com/feature/6218822004768768.

This policy supersedes users' personal settings and blocks matching origins
from calling the API without a prior user gesture.

For detailed information on valid url patterns, please see
https://chromeenterprise.google/policies/url-patterns.
Wildcards, *, are allowed.

Origins matching both blocked and allowed policy patterns will be blocked.
Origins not specified by policy nor user settings will require a prior user
gesture to call this API.
    '';
    };

    AutoplayAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow media autoplay

Setting the policy to True lets Google Chrome autoplay media. Setting the policy to False stops Google Chrome from autoplaying media.

If this policy is left unset, Google Chrome doesn't autoplay media. But, for certain URL patterns, you can use the AutoplayAllowlist policy to change this setting.

If this policy changes while Google Chrome is running, it only applies to newly opened tabs.
    '';
    };

    AutoplayAllowlist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow media autoplay on a allowlist of URL patterns

Setting the policy lets videos play automatically (without user consent) with audio content in Google Chrome. If AutoplayAllowed policy is set to True, then this policy has no effect. If AutoplayAllowed is set to False, then any URL patterns set in this policy can still play. If this policy changes while Google Chrome is running, it only applies to newly opened tabs.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns/.
    '';
    };

    BackgroundModeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Continue running background apps when Google Chrome is closed

Setting the policy to Enabled turns background mode on. In background mode, a Google Chrome process is started on OS sign-in and keeps running when the last browser window is closed, allowing background apps and the browsing session to remain active. The background process displays an icon in the system tray and can always be closed from there.

Setting the policy to Disabled turns background mode off.

If you set the policy, users can't change it in the browser settings. If unset, background mode is off at first, but users can change it.
    '';
    };

    BasicAuthOverHttpEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Basic authentication for HTTP

Setting the policy to Enabled or leaving it unset will allow Basic authentication challenges received over non-secure HTTP.

Setting the policy to Disabled forbids non-secure HTTP requests from using the Basic authentication scheme; only secure HTTPS is allowed.

This policy setting is ignored (and Basic is always forbidden) if the AuthSchemes policy is set and does not include Basic.
    '';
    };

    BatterySaverModeAvailability = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Enable Battery Saver Mode

This policy enables or disables the Battery Saver Mode setting.
On Chrome, this setting makes it so that frame rate is throttled to lower power consumption. If this policy is unset, the end user can control this setting in chrome://settings/performance.
On ChromeOS, this setting makes it so that frame rate and CPU frequency are throttled, backlights are dimmed, and Android is put in Battery Saver Mode. On devices with multiple CPUs, some CPUs will be turned off.
The different levels are:
Disabled (0): Battery Saver Mode will be disabled.
EnabledBelowThreshold (1): Battery Saver Mode will be enabled when the device is on battery power and battery level is low.
EnabledOnBattery (2): This value is deprecated as of M121. From M121 onwards, values will be      treated as EnabledBelowThreshold.

* 0 = Battery Saver Mode will be disabled.
* 1 = Battery Saver Mode will be enabled when the device is on battery power and battery level is low.
* 2 = This value is deprecated as of M121. In M121 and after, values will be treated as EnabledBelowThreshold.
    '';
    };

    BlockExternalExtensions = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Blocks external extensions from being installed

Controls external extensions installation.

Setting this policy to Enabled blocks external extensions from being installed.

Setting this policy to Disabled or leaving it unset allows external extensions to be installed.

External extensions and their installation are documented at https://developer.chrome.com/docs/extensions/how-to/distribute/install-extensions.

Note: This policy only applies to platforms that support extensions.
    '';
    };

    BlockThirdPartyCookies = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Block third party cookies

Setting the policy to Enabled prevents webpage elements that aren't from the domain that's in the browser's address bar from setting cookies. Setting the policy to Disabled lets those elements set cookies and prevents users from changing this setting.

Leaving it unset allows third-party cookies, but users can change this setting.

Note: This policy doesn't apply in Incognito mode, where third-party cookies are blocked and can only be allowed at the site level. To allow cookies at the site level, use the CookiesAllowedForUrls policy.
    '';
    };

    BookmarkBarEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Bookmark Bar

Setting the policy to True displays a bookmark bar in Google Chrome. Setting the policy to False means users never see the bookmark bar.

If you set the policy, users can't change it. If not set, users decide whether to use this function.
    '';
    };

    BrowserAddPersonEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable add person in user manager

If this policy is set to true or not configured, Google Chrome and Lacros will allow to add a new person from the user manager.

If this policy is set to false, Google Chrome and Lacros will not allow adding a new person from the user manager.
    '';
    };

    BrowserGuestModeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable guest mode in browser

If this policy is set to Enabled or not configured, Google Chrome will enable guest logins. Guest logins are Google Chrome profiles where all windows are in incognito mode.

If this policy is set to Disabled, Google Chrome will not allow guest profiles to be started.
    '';
    };

    BrowserGuestModeEnforced = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enforce browser guest mode

Setting the policy to Enabled means Google Chrome enforces guest sessions and prevents profile sign-ins. Guest sign-ins are Google Chrome profiles where windows are in Incognito mode.

Setting the policy to Disabled, leaving it unset, or disabling browser Guest mode (through BrowserGuestModeEnabled) allows the use of new and existing profiles.
    '';
    };

    BrowserLabsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Browser experiments icon in toolbar

Setting the policy to Enabled or leaving the policy unset means that users can access browser experimental features through an icon in the toolbar

Setting the policy to Disabled removes the browser experimental features icon from the toolbar.

chrome://flags and any other means of turning off and on browser features will still behave as expected regardless of whether this policy is Enabled or Disabled.
    '';
    };

    BrowserNetworkTimeQueriesEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow queries to a Google time service

Setting the policy to Enabled or leaving it unset means Google Chrome send occasional queries to a Google server to retrieve an accurate timestamp.

Setting the policy to Disabled stops Google Chrome from sending these queries.
    '';
    };

    BrowserSignin = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Browser sign in settings

This policy controls the sign-in behavior of the browser. It allows you to specify if the user can sign in to Google Chrome with their account and use account related services like Google Chrome Sync.

If the policy is set to "Disable browser sign-in" then the user cannot sign in to the browser and use account-based services. In this case browser-level features like Google Chrome Sync cannot be used and will be unavailable. On iOS, if the user was signed in and the policy is set to "Disabled" they will be signed out immediately. On other platforms, they will be signed out the next time they run Google Chrome. On all platforms, their local profile data like bookmarks, passwords etc. will be preserved and still usable. The user will still be able to sign into and use Google web services like Gmail.

If the policy is set to "Enable browser sign-in," then the user is allowed to sign in to the browser. On all platforms except iOS, the user is automatically signed in to the browser when signed in to Google web services like Gmail. Being signed in to the browser means the user's account information will be kept by the browser. However, it does not mean that Google Chrome Sync will be turned on by default; the user must separately opt-in to use this feature. Enabling this policy will prevent the user from turning off the setting that allows browser sign-in. To control the availability of Google Chrome Sync, use the SyncDisabled policy.

If the policy is set to "Force browser sign-in" the user is presented with an account selection dialog and has to choose and sign in to an account to use the browser. This ensures that for managed accounts the policies associated with the account are applied and enforced. The default value of BrowserGuestModeEnabled will be set to disabled. Note that existing unsigned profiles will be locked and inaccessible after enabling this policy. For more information, see help center article: https://support.google.com/chrome/?p=force_browser_signin . This option is not supported on Google ChromeOS nor Android, where it will fall back to "Enable browser sign-in" if used.

If this policy is not set then the user can decide if they want to enable browser sign-in in the Google Chrome settings and use it as they see fit.
* 0 = Disable browser sign-in
* 1 = Enable browser sign-in
* 2 = Force users to sign-in to use the browser
    '';
    };

    BrowserSwitcherDelay = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Delay before launching alternative browser (milliseconds)

Setting the policy to a number has Google Chrome show a message for that number of milliseconds, then it opens an alternative browser.

Leaving the policy unset or set to 0 means navigating to a designated URL immediately opens it in an alternative browser.
    '';
    };

    BrowserSwitcherEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable the Legacy Browser Support feature.

Setting the policy to Enabled means Google Chrome will try to launch some URLs in an alternate browser, such as Internet Explorer®. This feature is set using the policies in the Legacy Browser support group.

Setting the policy to Disabled or leaving it unset means Google Chrome won't try to launch designated URLs in an alternate browser.
    '';
    };

    BrowserSwitcherExternalGreylistUrl = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      URL of an XML file that contains URLs that should never trigger a browser switch.

Setting the policy to a valid URL has Google Chrome download the site list from that URL and apply the rules as if they were set up with the BrowserSwitcherUrlGreylist policy. These policies prevent Google Chrome and the alternative browser from opening one another.

Leaving it unset (or set to a invalid URL) means Google Chrome doesn't use the policy as a source of rules for not switching browsers.

Note: This policy points to an XML file in the same format as Internet Explorer®'s SiteList policy. This loads rules from an XML file, without sharing those rules with Internet Explorer®. Read more on Internet Explorer®'s SiteList policy ( https://docs.microsoft.com/internet-explorer/ie11-deploy-guide/what-is-enterprise-mode )
    '';
    };

    BrowserSwitcherExternalSitelistUrl = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      URL of an XML file that contains URLs to load in an alternative browser.

Setting the policy to a valid URL has Google Chrome download the site list from that URL and apply the rules as if they were set up with the BrowserSwitcherUrlList policy.

Leaving it unset (or set to a invalid URL) means Google Chrome doesn't use the policy as a source of rules for switching browsers.

Note: This policy points to an XML file in the same format as Internet Explorer®'s SiteList policy. This loads rules from an XML file, without sharing those rules with Internet Explorer®. Read more on Internet Explorer®'s SiteList policy ( https://docs.microsoft.com/internet-explorer/ie11-deploy-guide/what-is-enterprise-mode)
    '';
    };

    BrowserSwitcherKeepLastChromeTab = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Keep last tab open in Chrome.

Setting the policy to Enabled or leaving it unset has Google Chrome keep at least one tab open, after switching to an alternate browser.

Setting the policy to Disabled has Google Chrome close the tab after switching to an alternate browser, even if it was the last tab. This causes Google Chrome to exit completely.
    '';
    };

    BrowserSwitcherParsingMode = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Sitelist parsing mode

This policy controls how Google Chrome interprets sitelist/greylist policies for the Legacy Browser Support feature. It affects the following policies: BrowserSwitcherUrlList, BrowserSwitcherUrlGreylist, BrowserSwitcherUseIeSitelist, BrowserSwitcherExternalSitelistUrl, and BrowserSwitcherExternalGreylistUrl.

If 'Default' (0) or unset, URL matching is less strict. Rules that do not contain "/" look for a substring anywhere in the URL's hostname. Matching the path component of a URL is case-sensitive.

If 'IESiteListMode' (1), URL matching is more strict. Rules that do not contain "/" only match at the end of the hostname. They must also be at a domain name boundary. Matching the path component of a URL is case-insensitive. This is more compatible with Microsoft® Internet Explorer® and Microsoft® Edge®.

For example, with the rules "example.com" and "acme.com/abc":

"http://example.com/", "http://subdomain.example.com/" and "http://acme.com/abc" match regardless of parsing mode.

"http://notexample.com/", "http://example.com.invalid.com/", "http://example.comabc/" only match in 'Default' mode.

"http://acme.com/ABC" only matches in 'IESiteListMode'.
* 0 = Default behavior for LBS.
* 1 = More compatible with Microsoft IE/Edge enterprise mode sitelists.
    '';
    };

    BrowserSwitcherUrlGreylist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Websites that should never trigger a browser switch.

Setting the policy controls the list of websites that will never cause a browser switch. Each item is treated as a rule. Those rules that match won't open an alternative browser. Unlike the BrowserSwitcherUrlList policy, rules apply to both directions. When the Internet Explorer® add-in is on, it also controls whether Internet Explorer® should open these URLs in Google Chrome.

Leaving the policy unset adds no websites to the list.

Note: Elements can also be added to this list through the BrowserSwitcherExternalGreylistUrl policy.
    '';
    };

    BrowserSwitcherUrlList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Websites to open in alternative browser

Setting the policy controls the list of websites to open in an alternative browser. Each item is treated as a rule for something to open in an alternative browser. Google Chrome uses those rules when choosing if a URL should open in an alternative browser. When the Internet Explorer® add-in is on, Internet Explorer® switches back to Google Chrome when the rules don't match. If rules contradict each other, Google Chrome uses the most specific rule.

Leaving the policy unset adds no websites to the list.

Note: Elements can also be added to this list through the BrowserSwitcherUseIeSitelist and BrowserSwitcherExternalSitelistUrl policies.
    '';
    };

    BrowserThemeColor = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Configure the color of the browser's theme

This policy allows admins to configure the color of Google Chrome's theme. The input string should be a valid hex color string matching the format "#RRGGBB".

Setting the policy to a valid hex color causes a theme based on that color to be automatically generated and applied to the browser. Users won't be able to change the theme set by the policy.

Leaving the policy unset lets users change their browser's theme as preferred.
    '';
    };

    BrowsingDataLifetime = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Browsing Data Lifetime Settings

Configures browsing data lifetime settings for Google Chrome. This policy allows admins to configure (per data-type) when data is deleted by the browser. This is useful for customers that work with sensitive customer data.

Warning: Setting this policy can impact and permanently remove local personal data. It is recommended to test your settings before deploying to prevent accidental deletion of personal data.

The available data types are 'browsing_history', 'download_history', 'cookies_and_other_site_data', 'cached_images_and_files', 'password_signin', 'autofill', 'site_settings' and 'hosted_app_data'. 'download_history' and 'hosted_app_data' are not supported on Android.

The browser will automatically remove data of selected types that is older than 'time_to_live_in_hours'. The minimum value that can be set is 1 hour.

The deletion of expired data will happen 15 seconds after the browser starts then every 30 minutes while the browser is running.

The user will stay signed into their Google account when deleting cookies.

Until Chrome 114, this policy required the SyncDisabled policy to be set to true. Starting Chrome 115, setting this policy will disable sync for the respective data types if neither `Chrome Sync` is disabled by setting the SyncDisabled policy nor BrowserSignin is disabled.

Schema:
{
  "items": {
    "properties": {
      "data_types": {
        "items": {
          "enum": [
            "browsing_history", 
            "download_history", 
            "cookies_and_other_site_data", 
            "cached_images_and_files", 
            "password_signin", 
            "autofill", 
            "site_settings", 
            "hosted_app_data"
          ], 
          "type": "string"
        }, 
        "type": "array"
      }, 
      "time_to_live_in_hours": {
        "minimum": 1, 
        "type": "integer"
      }
    }, 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    BuiltInAIAPIsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow pages to use the built-in AI APIs.

This policy controls if a page can use the built-in AI APIs (such as LanguageModel API, Summarization API, Writer API, and Rewriter API).

If the policy is enabled or unset, the APIs are enabled to be used.

If the policy is disabled, attempting using the APIs will result in an error.
    '';
    };

    BuiltInDnsClientEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use built-in DNS client

This policy controls which software stack is used to communicate with the DNS server: the Operating System DNS client, or Google Chrome's built-in DNS client. This policy does not affect which DNS servers are used: if, for example, the operating system is configured to use an enterprise DNS server, that same server would be used by the built-in DNS client. It also does not control if DNS-over-HTTPS is used; Google Chrome will always use the built-in resolver for DNS-over-HTTPS requests. Please see the DnsOverHttpsMode policy for information on controlling DNS-over-HTTPS.

If this policy is set to Enabled or is left unset, the built-in DNS client will be used.

If this policy is set to Disabled, the built-in DNS client will only be used when DNS-over-HTTPS is in use.
    '';
    };

    CACertificateManagementAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Allow users to manage installed CA certificates.

Setting the policy to All (0) or leaving it unset lets users edit trust settings for all CA certificates, remove user-imported certificates, and import certificates using Certificate Manager. Setting the policy to UserOnly (1) lets users manage only user-imported certificates, but not change trust settings of built-in certificates. Setting it to None (2) lets users view (not manage) CA certificates.
* 0 = Allow users to manage all certificates
* 1 = Allow users to manage user certificates
* 2 = Disallow users from managing certificates
    '';
    };

    CACertificates = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      TLS certificates that should be trusted by Google Chrome for server authentication

A list of TLS certificates that should be trusted by Google Chrome for server authentication.
Certificates should be base64-encoded.
    '';
    };

    CACertificatesWithConstraints = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      TLS certificates that should be trusted by Google Chrome for server authentication with constraints

A list of TLS certificates that should be trusted by Google Chrome for server authentication, with constraints added outside the certificate. If no constraint of a certain type is present, then any name of that type is allowed.
Certificates should be base64-encoded. At least one constraint must be specified for each certificate.

Schema:
{
  "items": {
    "properties": {
      "certificate": {
        "type": "string"
      }, 
      "constraints": {
        "properties": {
          "permitted_cidrs": {
            "items": {
              "type": "string"
            }, 
            "type": "array"
          }, 
          "permitted_dns_names": {
            "items": {
              "type": "string"
            }, 
            "type": "array"
          }
        }, 
        "type": "object"
      }
    }, 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    CADistrustedCertificates = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      TLS certificates that should be distrusted by Google Chrome for server authentication

A list of certificate public keys that should be distrusted by Google Chrome for TLS server
authentication.

The policy value is a list of base64-encoded X.509 certificates. Any
certificate with a matching SPKI (SubjectPublicKeyInfo) will be distrusted.
    '';
    };

    CAHintCertificates = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      TLS certificates that are not trusted or distrusted but can be used in path-building for server authentication

A list of certificates that are not trusted or distrusted in Google Chrome
but can be used as hints for path-building. Certificates should be base64-encoded.
    '';
    };

    CAPlatformIntegrationEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use user-added TLS certificates from platform trust stores for server authentication

If enabled(or not set), user-added TLS certificates from platform trust stores will be used in path-building for TLS server authentication.

If disabled, user-added TLS certificates from platform trust stores will not be used in path-building for TLS server authentication.
    '';
    };

    CORSNonWildcardRequestHeadersSupport = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      CORS non-wildcard request headers support

Configures support of CORS non-wildcard request headers.

Google Chrome version 97 introduces support for CORS non-wildcard request headers. When scripts make a cross-origin network request via fetch() and XMLHttpRequest with a script-added Authorization header, the header must be explicitly allowed by the Access-Control-Allow-Headers header in the CORS preflight response. "Explicitly" here means that the wild card symbol "*" doesn't cover the Authorization header. See https://chromestatus.com/feature/5742041264816128 for more detail.

If this policy is not set, or set to True, Google Chrome will support the CORS non-wildcard request headers and behave as described above.

When this policy is set to False, chrome will allow the wildcard symbol ("*") in the Access-Control-Allow-Headers header in the CORS preflight response to cover the Authorization header.

This Enterprise policy is temporary; it's intended to be removed in the future.
    '';
    };

    CacheEncryptionEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      This policy allows administrators to encrypt http cache on disk.

This policy allows the administrators to encrypt browser http cache on disk.

When this policy is Enabled, browser cache will be encrypted.

When this policy is Disabled or not set, browser cache will not be encrypted.

Browser cache encryption may result in a performance impact.
    '';
    };

    CertificateTransparencyEnforcementDisabledForCas = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Disable Certificate Transparency enforcement for a list of subjectPublicKeyInfo hashes

Setting the policy turns off enforcement of Certificate Transparency disclosure requirements for a list of subjectPublicKeyInfo hashes. Enterprise hosts can keep using certificates that otherwise wouldn't be trusted (because they weren't properly publicly disclosed). To turn off enforcement, the hash must meet one of these conditions:

* It's of the server certificate's subjectPublicKeyInfo.

* It's of a subjectPublicKeyInfo that appears in a Certificate Authority (CA) certificate in the certificate chain. That CA certificate is constrained through the X.509v3 nameConstraints extension, one or more directoryName nameConstraints are present in the permittedSubtrees, and the directoryName has an organizationName attribute.

* It's of a subjectPublicKeyInfo that appears in a CA certificate in the certificate chain, the CA certificate has one or more organizationName attributes in the certificate Subject, and the server's certificate has the same number of organizationName attributes, in the same order, and with byte-for-byte identical values.

Specify a subjectPublicKeyInfo hash by linking the hash algorithm name, a slash, and the Base64 encoding of that hash algorithm applied to the DER-encoded subjectPublicKeyInfo of the specified certificate. Base64 encoding format matches that of an SPKI Fingerprint. The only recognized hash algorithm is sha256; others are ignored.

Leaving the policy unset means that if certificates requiring disclosure through Certificate Transparency aren't disclosed, then Google Chrome doesn't trust those certificates.
    '';
    };

    CertificateTransparencyEnforcementDisabledForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Disable Certificate Transparency enforcement for a list of URLs

Setting the policy turns off Certificate Transparency disclosure requirements for the hostnames in the specified URLs. While making it harder to detect misissued certificates, hosts can keep using certificates that otherwise wouldn't be trusted (because they weren't properly publicly disclosed).

Leaving the policy unset means that if certificates requiring disclosure through Certificate Transparency aren't disclosed, then Google Chrome doesn't trust those certificates.

A URL pattern follows this format ( https://support.google.com/chrome/a?p=url_blocklist_filter_format ). However, because the validity of certificates for a given hostname is independent of the scheme, port, or path, Google Chrome only considers the hostname portion of the URL. Wildcard hosts aren't supported.
    '';
    };

    ChromeForTestingAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Chrome for Testing

Controls whether users may use Chrome for Testing.

If this policy is set to Enabled or not set, users may install and run Chrome for Testing.

If this policy is set to Disabled, users are not allowed to run Chrome for Testing. Users will still be able to install Chrome for Testing, however it will not run with the profiles where this policy is set to Disabled.
    '';
    };

    ChromeVariations = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Determine the availability of variations

Configuring this policy allows to specify which variations are allowed to be applied in Google Chrome.

Variations provide a means for offering modifications to Google Chrome without shipping a new version of the browser by selectively enabling or disabling already existing features. See https://support.google.com/chrome/a?p=Manage_the_Chrome_variations_framework for more information.

Setting the VariationsEnabled (value 0), or leaving the policy not set allows all variations to be applied to the browser.

Setting the CriticalFixesOnly (value 1), allows only variations considered critical security or stability fixes to be applied to Google Chrome.

Setting the VariationsDisabled (value 2), prevent all variations from being applied to the browser. Please note that this mode can potentially prevent the Google Chrome developers from providing critical security fixes in a timely manner and is thus not recommended.
* 0 = Enable all variations
* 1 = Enable variations concerning critical fixes only
* 2 = Disable all variations
    '';
    };

    ClearBrowsingDataOnExitList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Clear Browsing Data on Exit

Configures a list of browsing data types that should be deleted when the user closes all browser windows.

Warning: Setting this policy can impact and permanently remove local personal data. It is recommended to test your settings before deploying to prevent accidental deletion of personal data.

The available data types are browsing history (browsing_history), download history (download_history), cookies (cookies_and_other_site_data), cache(cached_images_and_files), autofill (autofill), passwords (password_signin), site settings (site_settings) and hosted apps data (hosted_app_data). This policy does not take precedence over AllowDeletingBrowserHistory.

The user will stay signed into their Google account when deleting cookies.

Until Chrome 114, this policy required the SyncDisabled policy to be set to true. Starting Chrome 115, setting this policy will disable sync for the respective data types if neither `Chrome Sync` is disabled by setting the SyncDisabled policy nor BrowserSignin is disabled.

If for some reason the data deletion has started and did not complete, the browsing data will be cleared the next time the profile is loaded.

If Google Chrome does not exit cleanly (for example, if the browser or the OS crashes), the browsing data will not be cleared since the browser closing was not a result of the use closing all the browser windows.
* "browsing_history" = Browsing history
* "download_history" = Download history
* "cookies_and_other_site_data" = Cookies and other site data
* "cached_images_and_files" = Cached images and files
* "password_signin" = Password signin
* "autofill" = Autofill
* "site_settings" = Site settings
* "hosted_app_data" = Hosted apps data
    '';
    };

    ClickToCallEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable the Click to Call Feature

Enable the Click to Call feature which allows users to send phone numbers from Chrome Desktops to an Android device when the user is Signed-in. For more information, see help center article: https://support.google.com/chrome/answer/9430554?hl=en.

If this policy is set to enabled, the capability of sending phone numbers to Android devices will be enabled for the Chrome user.

If this policy is set to disabled, the capability of sending phone numbers to Android devices will be disabled for the Chrome user.

If you set this policy, users cannot change or override it.

If this policy is left unset, the Click to Call feature is enabled by default.
    '';
    };

    ClipboardAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow clipboard on these sites

Setting the policy lets you set a list of URL patterns that specify sites that can use the clipboard site permission. This does not include all clipboard operations on origins matching the patterns. For instance, users will still be able to paste using keyboard shortcuts as this isn't gated by the clipboard site permission.

Leaving the policy unset means DefaultClipboardSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    ClipboardBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block clipboard on these sites

Setting the policy lets you set a list of URL patterns that specify sites that can't use the clipboard site permission. This does not include all clipboard operations on origins matching the patterns. For instance, users will still be able to paste using keyboard shortcuts as this isn't gated by the clipboard site permission.

Leaving the policy unset means DefaultClipboardSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    CloudManagementEnrollmentMandatory = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable mandatory cloud management enrollment

Setting the policy to Enabled mandates Chrome Enterprise Core browser enrollment and blocks Google Chrome launch process if failed.

Setting the policy to Disabled or leaving it unset renders Chrome Enterprise Core browser enrollment optional and doesn't block Google Chrome launch process if failed.

Machine scope cloud policy enrollment on desktop uses this policy. See https://support.google.com/chrome/a/answer/9301891 for details.
    '';
    };

    CloudManagementEnrollmentToken = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      The enrollment token of cloud policy

Setting the policy means Google Chrome tries to register itself with Chrome Enterprise Core browser management. The value of this policy is an enrollment token you can retrieve from the Google Admin console.

See https://support.google.com/chrome/a/answer/9301891 for details.
    '';
    };

    CloudPolicyOverridesPlatformPolicy = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Google Chrome cloud policy overrides Platform policy.

Setting the policy to Enabled means cloud policy takes precedence if it conflicts with platform policy.

Setting the policy to Disabled or leaving it unset means platform policy takes precedence if it conflicts with cloud policy.

This mandatory policy affects machine scope cloud policies.

This policy is specific to Google Chrome and does not affect Google Update because they are independent applications.
Google Update has a separate policy with the same name.
    '';
    };

    CloudUserPolicyMerge = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enables merging of user cloud policies into machine-level policies

Setting the policy to Enabled allows policies associated with a managed account to be merged into machine-level policies.

Setting the policy to Disabled or leaving it unset prevents user-level cloud policies from being merged with policies from any other sources.

Only policies originating from secure users can take precedence. A secure user is affiliated with the organization that manages their browser using Chrome Enterprise Core. All other user-level policies will have default precedence.

Policies that need to be merged also need to be set in either PolicyListMultipleSourceMergeList or PolicyDictionaryMultipleSourceMergeList. This policy will be ignored if neither of the two aforementioned policies is configured.
    '';
    };

    CloudUserPolicyOverridesCloudMachinePolicy = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow user cloud policies to override Chrome Browser Cloud Management policies.

Setting the policy to Enabled allows policies associated with a managed account to take precedence if they conflict with Chrome Enterprise Core browser policies.

Setting the policy to Disabled or leaving it unset causes user-level cloud policies to have default priority.

Only policies originating from secure users can take precedence. A secure user is affiliated with the organization that manages their browser using Chrome Enterprise Core. All other user-level policies will have default precedence.

The policy can be combined with CloudPolicyOverridesPlatformPolicy. If both policies are enabled, user cloud policies will also take precedence over conflicting platform policies.
    '';
    };

    CommandLineFlagSecurityWarningsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable security warnings for command-line flags

Setting the policy to Enabled or leaving it unset means security warnings appear when potentially dangerous command-line flags are used to launch Chrome.

Setting the policy to Disabled prevents security warnings from appearing when Chrome is launched with potentially dangerous command-line flags.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    ComponentUpdatesEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable component updates in Google Chrome

Enables component updates for all components in Google Chrome when not set or set to enabled.

If set to disabled, updates to components are disabled. However, some components are exempt from this policy: updates to any component that does not contain executable code and is critical for the security of the browser will not be disabled.
Examples of such components include the certificate revocation lists and subresource filters.
    '';
    };

    CompressionDictionaryTransportEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable compression dictionary transport support

This feature enables the use of dictionary-specific content encodings in the Accept-Encoding request header ("sbr" and "zst-d") when dictionaries are available for use.

Setting the policy to Enabled or leaving it unset means Google Chrome will accept web contents using the compression dictionary transport feature.
Setting the policy to Disabled turns off the compression dictionary transport feature.
    '';
    };

    CookiesAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow cookies on these sites

Allows you to set a list of url patterns that specify sites which are allowed to set cookies.

URL patterns may be a single URL indicating that the site may use cookies on all top-level sites.

Patterns may also be two URLs delimited by a comma. The first specifies the site that should be allowed to use cookies. The second specifies the top-level site that the first value should be applied on.

If you use a pair of URLs, the first value in the pair supports * but the second value does not. Using * for the first value indicates that all sites may use cookies when the second URL is the top-level site.

If this policy is left not set the global default value will be used for all sites either from the DefaultCookiesSetting or BlockThirdPartyCookies policies if they are set, or the user's personal configuration otherwise.

See also policies CookiesBlockedForUrls and CookiesSessionOnlyForUrls. Note that there must be no conflicting URL patterns between these three policies - it is unspecified which policy takes precedence.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    CookiesBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block cookies on these sites

Setting the policy lets you make a list of URL patterns that specify sites that can't set cookies.

Leaving the policy unset results in the use of DefaultCookiesSetting for all sites, if it's set. If not, the user's personal setting applies.

While no specific policy takes precedence, see CookiesAllowedForUrls and CookiesSessionOnlyForUrls. URL patterns among these 3 policies must not conflict.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    CookiesSessionOnlyForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Limit cookies from matching URLs to the current session

Unless the RestoreOnStartup policy is set to permanently restore URLs from previous sessions, then setting CookiesSessionOnlyForUrls lets you make a list of URL patterns that specify sites that can and can't set cookies for one session.

Leaving the policy unset results in the use of DefaultCookiesSetting for all sites, if it's set. If not, the user's personal setting applies. URLs not covered by the patterns specified also result in the use of defaults.

While no specific policy takes precedence, see CookiesBlockedForUrls and CookiesAllowedForUrls. URL patterns among these 3 policies must not conflict.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    CreateThemesSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for Create Themes with AI

Create Themes with AI lets users create custom themes/wallpapers by preselecting from a list of options.

0 = Allow the feature to be used, while allowing Google to use relevant data to improve its AI models. Relevant data may include prompts, inputs, outputs, source materials, and written feedback, depending on the feature. It may also be reviewed by humans to improve AI models. 0 is the default value, except when noted below.

1 = Allow the feature to be used, but does not allow Google to improve models using users' content (including prompts, inputs, outputs, source materials, and written feedback). 1 is the default value for Enterprise users managed by Google Admin console and for Education accounts managed by Google Workspace.

2 = Do not allow the feature.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow Create Themes and improve AI models.
* 1 = Allow Create Themes without improving AI models.
* 2 = Do not allow Create Themes.
    '';
    };

    DNSInterceptionChecksEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      DNS interception checks enabled

This policy configures a local switch that can be used to disable DNS interception checks. The checks attempt to discover whether the browser is behind a proxy that redirects unknown host names.

This detection may not be necessary in an enterprise environment where the network configuration is known, since it causes some amount of DNS and HTTP traffic on start-up and each DNS configuration change.

When this policy is not set, or is enabled, the DNS interception checks are performed. When explicitly disabled, they're not.
    '';
    };

    DataURLWhitespacePreservationEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      DataURL Whitespace Preservation for all media types

This policy provides a temporary opt-out for changes to how Chrome handles whitepsace in data URLS.
Previously, whitespace would be kept only if the top level media type was text or contained the media type string xml.
Now, whitespace will be preserved in all data URLs, regardless of media type.

If this policy is left unset or is set to True, the new behavior is enabled.

When this policy is set to False, the old behavior is enabled.
    '';
    };

    DataUrlInSvgUseEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Data URL support for SVGUseElement.

This policy enables Data URL support for SVGUseElement, which will be disabled
by default starting in M119.
If this policy is set to Enabled, Data URLs will continue to work in SVGUseElement.
If this policy is set to Disabled or not set, Data URLs won't work in SVGUseElement.
    '';
    };

    DefaultBrowserSettingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Set Google Chrome as Default Browser

Setting the policy to True has Google Chrome always check whether it's the default browser on startup and, if possible, automatically register itself. Setting the policy to False stops Google Chrome from ever checking if it's the default and turns user controls off for this option.

Leaving the policy unset means Google Chrome lets users control whether it's the default and, if not, whether user notifications should appear.

Note: For Microsoft®Windows® administrators, turning this setting on only works for machines running Windows 7. For later versions, you must deploy a "default application associations" file that makes Google Chrome the handler for the https and http protocols (and, optionally, the ftp protocol and other file formats). See Chrome Help ( https://support.google.com/chrome?p=make_chrome_default_win ).
    '';
    };

    DefaultClipboardSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default clipboard setting

Setting the policy to 2 blocks sites from using the clipboard site permission. Setting the policy to 3 or leaving it unset lets the user change the setting and decide if the clipboard APIs are available when a site wants to use one.

This policy can be overridden for specific URL patterns using the ClipboardAllowedForUrls and ClipboardBlockedForUrls policies.

This policy only affects clipboard operations controlled by the clipboard site permission, and does not affect sanitized clipboard writes or trusted copy and paste operations.
* 2 = Do not allow any site to use the clipboard site permission
* 3 = Allow sites to ask the user to grant the clipboard site permission
    '';
    };

    DefaultCookiesSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default cookies setting

Unless the RestoreOnStartup policy is set to permanently restore URLs from previous sessions, then setting CookiesSessionOnlyForUrls lets you make a list of URL patterns that specify sites that can and can't set cookies for one session.

Leaving the policy unset results in the use of DefaultCookiesSetting for all sites, if it's set. If not, the user's personal setting applies. URLs not covered by the patterns specified also result in the use of defaults.

While no specific policy takes precedence, see CookiesBlockedForUrls and CookiesAllowedForUrls. URL patterns among these 3 policies must not conflict.
* 1 = Allow all sites to set local data
* 2 = Do not allow any site to set local data
* 4 = Keep cookies for the duration of the session
    '';
    };

    DefaultDownloadDirectory = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Set default download directory

Setting the policy changes the default directory that Chrome downloads files to, but users can change the directory.

Leaving the policy unset means Chrome uses its platform-specific default directory.

This policy has no effect if the policy DownloadDirectory is set.

Note: See a list of variables you can use ( https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables ).
    '';
    };

    DefaultFileSystemReadGuardSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of the File System API for reading

Setting the policy to 3 lets websites ask for read access to files and directories in the host operating system's file system via the File System API. Setting the policy to 2 denies access.

Leaving it unset lets websites ask for access, but users can change this setting.
* 2 = Do not allow any site to request read access to files and directories via the File System API
* 3 = Allow sites to ask the user to grant read access to files and directories via the File System API
    '';
    };

    DefaultFileSystemWriteGuardSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of the File System API for writing

Setting the policy to 3 lets websites ask for write access to files and directories in the host operating system's file system. Setting the policy to 2 denies access.

Leaving it unset lets websites ask for access, but users can change this setting.
* 2 = Do not allow any site to request write access to files and directories
* 3 = Allow sites to ask the user to grant write access to files and directories
    '';
    };

    DefaultGeolocationSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default geolocation setting

Setting the policy to 1 lets sites track the users' physical location as the default state. Setting the policy to 2 denies this tracking by default. You can set the policy to ask whenever a site wants to track the users' physical location.

Leaving the policy unset means the AskGeolocation policy applies, but users can change this setting.
* 1 = Allow sites to track the users' physical location
* 2 = Do not allow any site to track the users' physical location
* 3 = Ask whenever a site wants to track the users' physical location
    '';
    };

    DefaultIdleDetectionSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default idle detection setting

Allows you to set whether websites are allowed to use the Idle Detection API.

When this policy is set to 1 - AllowIdleDetection, websites can use the API without asking the user for permission.

When this policy is set to 2 - BlockIdleDetection, websites can't use the API, regardless of the user's permission.

When this policy is set to 3 - AskIdleDetection or not set, websites can't use the API without the user's permission.
* 1 = Allow sites to detect idle state without asking the user
* 2 = Do not allow any site to detect the user's idle state
* 3 = Ask every time a site wants to detect the user's idle state
    '';
    };

    DefaultImagesSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default images setting

Setting the policy to 1 lets all websites display images. Setting the policy to 2 denies image display.

Leaving it unset allows images, but users can change this setting.
* 1 = Allow all sites to show all images
* 2 = Do not allow any site to show images
    '';
    };

    DefaultInsecureContentSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of insecure content exceptions

Allows you to set whether users can add exceptions to allow mixed content for specific sites.

This policy can be overridden for specific URL patterns using the 'InsecureContentAllowedForUrls' and 'InsecureContentBlockedForUrls' policies.

If this policy is left not set, users will be allowed to add exceptions to allow blockable mixed content and disable autoupgrades for optionally blockable mixed content.
* 2 = Do not allow any site to load mixed content
* 3 = Allow users to add exceptions to allow mixed content
    '';
    };

    DefaultJavaScriptJitSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of JavaScript JIT

Allows you to set whether Google Chrome will run the v8 JavaScript engine with JIT (Just In Time) compiler enabled or not.

Disabling the JavaScript JIT will mean that Google Chrome may render web content more slowly, and may also disable parts of JavaScript including WebAssembly. Disabling the JavaScript JIT may allow Google Chrome to render web content in a more secure configuration.

This policy can be overridden for specific URL patterns using the JavaScriptJitAllowedForSites and JavaScriptJitBlockedForSites policies.

If this policy is left not set, JavaScript JIT is enabled.
* 1 = Allow any site to run JavaScript JIT
* 2 = Do not allow any site to run JavaScript JIT
    '';
    };

    DefaultJavaScriptOptimizerSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of JavaScript optimizers

Allows you to set whether Google Chrome
will run the v8 JavaScript engine with more advanced JavaScript optimizations enabled.

Disabling JavaScript optimizations (by setting this policy's value to 2) will
mean that Google Chrome may render web
content more slowly.

This policy can be overridden for specific URL patterns using the JavaScriptOptimizerAllowedForSites and JavaScriptOptimizerBlockedForSites policies.

If this policy is left not set, JavaScript optimizations are enabled.
* 1 = Enable advanced JavaScript optimizations on all sites
* 2 = Disable advanced JavaScript optimizations on all sites
    '';
    };

    DefaultJavaScriptSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default JavaScript setting

Setting the policy to 1 lets websites run JavaScript. Setting the policy to 2 denies JavaScript.

Leaving it unset allows JavaScript, but users can change this setting.
* 1 = Allow all sites to run JavaScript
* 2 = Do not allow any site to run JavaScript
    '';
    };

    DefaultLocalFontsSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default Local Fonts permission setting

Setting the policy to BlockLocalFonts (value 2) automatically denies the local fonts permission to sites by default. This will limit the ability of sites to see information about local fonts.

Setting the policy to AskLocalFonts (value 3) will prompt the user when the local fonts permission is requested by default. If users allow the permission, it will extend the ability of sites to see information about local fonts.

Leaving the policy unset means the default behavior applies which is to prompt the user, but users can change this setting
* 2 = Denies the Local Fonts permission on all sites by default
* 3 = Ask every time a site wants obtain the Local Fonts permission
    '';
    };

    DefaultNotificationsSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default notification setting

Setting the policy to 1 lets websites display desktop notifications. Setting the policy to 2 denies desktop notifications.

Leaving it unset means AskNotifications applies, but users can change this setting.
* 1 = Allow sites to show desktop notifications
* 2 = Do not allow any site to show desktop notifications
* 3 = Ask every time a site wants to show desktop notifications
    '';
    };

    DefaultPopupsSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default pop-ups setting

Setting the policy to 1 lets websites display pop-ups. Setting the policy to 2 denies pop-ups.

Leaving it unset means BlockPopups applies, but users can change this setting.
* 1 = Allow all sites to show pop-ups
* 2 = Do not allow any site to show pop-ups
    '';
    };

    DefaultPrinterSelection = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Default printer selection rules

Setting the policy sets the rules for selecting the default printer in Google Chrome, overriding the default rules. Printer selection occurs the first time users try to print, when Google Chrome seeks a printer matching the specified attributes. In case of a less than perfect match, Google Chrome can be set to select any matching printer, depending on the order printers are discovered.

Leaving the policy unset or set to attributes for which there's no match means the built-in PDF printer is the default. If there's no PDF printer, Google Chrome defaults to none.

Currently, all printers are classified as "local". Printers connected to Google Cloud Print are considered "cloud", but Google Cloud Print is no longer supported.

Note: Omitting a field means all values match for that particular field. For example, not specifying idPattern means Print Preview accepts all printer IDs. Regular expression patterns must follow the JavaScript RegExp syntax, and matches are case sensistive.

Schema:
{
  "properties": {
    "idPattern": {
      "description": "Regular expression to match printer ID.", 
      "type": "string"
    }, 
    "kind": {
      "description": "Whether to limit the search of the matching printer to a specific set of printers.", 
      "enum": [
        "local", 
        "cloud"
      ], 
      "type": "string"
    }, 
    "namePattern": {
      "description": "Regular expression to match printer display name.", 
      "type": "string"
    }
  }, 
  "type": "object"
}
    '';
    };

    DefaultSearchProviderAlternateURLs = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      List of alternate URLs for the default search provider

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderAlternateURLs specifies a list of alternate URLs for extracting search terms from the search engine. The URLs should include the string '{searchTerms}'.

Leaving DefaultSearchProviderAlternateURLs unset means no alternate URLs are used to extract search terms.
    '';
    };

    DefaultSearchProviderContextMenuAccessAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow default search provider context menu search access

Enables the use of a default search provider on the context menu.

If you set this policy to disabled the search context menu item that relies on your default search provider will not be available.

If this policy is set to enabled or not set, the context menu item for your default search provider will be available.

The policy value is only appled when the DefaultSearchProviderEnabled policy is enabled, and is not applicable otherwise.
    '';
    };

    DefaultSearchProviderEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable the default search provider

Setting the policy to Enabled means a default search is performed when a user enters non-URL text in the address bar. To specify the default search provider, set the rest of the default search policies. If you leave those policies empty, the user can choose the default provider. Setting the policy to Disabled means there's no search when the user enters non-URL text in the address bar. The Disabled value is not supported by the Google Admin console.

If you set the policy, users can't change it in Google Chrome. If not set, the default search provider is on, and users can set the search provider list.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    DefaultSearchProviderEncodings = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Default search provider encodings

If DefaultSearchProviderEnabled is on, setting DefaultSearchProviderEncodings specifies the character encodings supported by the search provider. Encodings are code page names such as UTF-8, GB2312, and ISO-8859-1. They're tried in the order provided.

Leaving DefaultSearchProviderEncodings unset puts UTF-8 in use.
    '';
    };

    DefaultSearchProviderImageURL = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Parameter providing search-by-image feature for the default search provider

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderImageURL specifies the URL of the search engine used for image search. (If DefaultSearchProviderImageURLPostParams is set, then image search requests use the POST method instead.)

Leaving DefaultSearchProviderImageURL unset means no image search is used.

If image search uses the GET method, then the URL must specify image
parameters using a valid combination of the following placeholders:
'{google:imageURL}',
'{google:imageOriginalHeight}',
'{google:imageOriginalWidth}',
'{google:processedImageDimensions}',
'{google:imageSearchSource}',
'{google:imageThumbnail}',
'{google:imageThumbnailBase64}'.
    '';
    };

    DefaultSearchProviderImageURLPostParams = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Parameters for image URL which uses POST

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderImageURLPostParams specifies the parameters during image search with POST. It consists of comma-separated, name-value pairs. If a value is a template parameter, such as {imageThumbnail}, real image thumbnail data replaces it.

Leaving DefaultSearchProviderImageURLPostParams unset means image search request is sent using the GET method.

The URL must specify the image parameter using a valid combination of
the following placeholders depending on what the search provider supports:
'{google:imageURL}',
'{google:imageOriginalHeight}',
'{google:imageOriginalWidth}',
'{google:processedImageDimensions}',
'{google:imageSearchSource}',
'{google:imageThumbnail}',
'{google:imageThumbnailBase64}'.
    '';
    };

    DefaultSearchProviderKeyword = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Default search provider keyword

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderKeyword specifies the keyword or shortcut used in the address bar to trigger the search for this provider.

Leaving DefaultSearchProviderKeyword unset means no keyword activates the search provider.
    '';
    };

    DefaultSearchProviderName = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Default search provider name

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderName specifies the default search provider's name.

Leaving DefaultSearchProviderName unset means the hostname specified by the search URL is used.
    '';
    };

    DefaultSearchProviderNewTabURL = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Default search provider new tab page URL

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderNewTabURL specifies the URL of the search engine used to provide a New Tab page.

Leaving DefaultSearchProviderNewTabURL unset means no new tab page is provided.
    '';
    };

    DefaultSearchProviderSearchURL = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Default search provider search URL

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderSearchURL specifies the URL of the search engine used during a default search. The URL should include the string '{searchTerms}', replaced in the query by the user's search terms.

You can specify Google's search URL as: '{google:baseURL}search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:searchClient}{google:sourceId}ie={inputEncoding}'.
    '';
    };

    DefaultSearchProviderSearchURLPostParams = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Parameters for search URL which uses POST

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderSearchURLPostParams specifies the parameters when searching a URL with POST. It consists of comma-separated, name-value pairs. If a value is a template parameter, such as '{searchTerms}', real search terms data replaces it.

Leaving DefaultSearchProviderSearchURLPostParams unset means search requests are sent using the GET method.
    '';
    };

    DefaultSearchProviderSuggestURL = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Default search provider suggest URL

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderSuggestURL specifies the URL of the search engine to provide search suggestions. The URL should include the string '{searchTerms}', replaced in the query by the user's search terms.

You can specify Google's search URL as: '{google:baseURL}complete/search?output=chrome&q={searchTerms}'.
    '';
    };

    DefaultSearchProviderSuggestURLPostParams = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Parameters for suggest URL which uses POST

If DefaultSearchProviderEnabled is on, then setting DefaultSearchProviderSuggestURLPostParams specifies the parameters during suggestion search with POST. It consists of comma-separated, name-value pairs. If a value is a template parameter, such as '{searchTerms}', real search terms data replaces it.

Leaving DefaultSearchProviderSuggestURLPostParams unset unset means suggest search requests are sent using the GET method.
    '';
    };

    DefaultSensorsSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default sensors setting

Setting the policy to 1 lets websites access and use sensors such as motion and light. Setting the policy to 2 denies access to sensors.

Leaving it unset means AllowSensors applies, but users can change this setting.
* 1 = Allow sites to access sensors
* 2 = Do not allow any site to access sensors
    '';
    };

    DefaultSerialGuardSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of the Serial API

Setting the policy to 3 lets websites ask for access to serial ports. Setting the policy to 2 denies access to serial ports.

Leaving it unset lets websites ask for access, but users can change this setting.
* 2 = Do not allow any site to request access to serial ports via the Serial API
* 3 = Allow sites to ask the user to grant access to a serial port
    '';
    };

    DefaultWebBluetoothGuardSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of the Web Bluetooth API

Setting the policy to 3 lets websites ask for access to nearby Bluetooth devices. Setting the policy to 2 denies access to nearby Bluetooth devices.

Leaving the policy unset lets sites ask for access, but users can change this setting.
* 2 = Do not allow any site to request access to Bluetooth devices via the Web Bluetooth API
* 3 = Allow sites to ask the user to grant access to a nearby Bluetooth device
    '';
    };

    DefaultWebHidGuardSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of the WebHID API

Setting the policy to 3 lets websites ask for access to HID devices. Setting the policy to 2 denies access to HID devices.

Leaving it unset lets websites ask for access, but users can change this setting.

This policy can be overridden for specific url patterns using the WebHidAskForUrls and WebHidBlockedForUrls policies.
* 2 = Do not allow any site to request access to HID devices via the WebHID API
* 3 = Allow sites to ask the user to grant access to a HID device
    '';
    };

    DefaultWebUsbGuardSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of the WebUSB API

Setting the policy to 3 lets websites ask for access to connected USB devices. Setting the policy to 2 denies access to connected USB devices.

Leaving it unset lets websites ask for access, but users can change this setting.
* 2 = Do not allow any site to request access to USB devices via the WebUSB API
* 3 = Allow sites to ask the user to grant access to a connected USB device
    '';
    };

    DefaultWindowManagementSetting = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Default Window Management permission setting

Setting the policy to BlockWindowManagement (value 2) automatically denies the window management permission to sites by default. This will limit the ability of sites to see information about the device's screens and use that information to open and place windows or request fullscreen on specific screens.

Setting the policy to AskWindowManagement (value 3) will prompt the user when the window management permission is requested by default. If users allow the permission, it will extend the ability of sites to see information about the device's screens and use that information to open and place windows or request fullscreen on specific screens.

Leaving the policy unset means the AskWindowManagement policy applies, but users can change this setting.

This replaces the deprecated DefaultWindowPlacementSetting policy.
* 2 = Denies the Window Management permission on all sites by default
* 3 = Ask every time a site wants obtain the Window Management permission
    '';
    };

    DeletingUndecryptablePasswordsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable deleting undecryptable passwords

This policy controls whether the built-in password manager can delete undecryptable passwords from its database. This is required to restore the full functionality of the built-in password manager, but it may include a permanent data loss. Undecryptable password values will not become decryptable on their own and, if fixing them is possible, it usually requires complex user actions.

Setting the policy to Enabled or leaving it unset means that users with undecryptable passwords saved to the built-in password manager will lose them. Passwords that are still in a working state will remain untouched.

Setting the policy to Disabled means users will leave their password manager data untouched, but will experience a broken password manager functionality.

If the policy is set, users can't change it in Google Chrome.
    '';
    };

    DesktopSharingHubEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable desktop sharing in the omnibox and 3-dot menu

Setting the policy to True or leaving it unset lets users share or save the current webpage using actions provided by the desktop sharing hub. The sharing hub is accessed through either an omnibox icon or the 3-dot menu.

Setting the policy to False removes the sharing icon from the omnibox and the entry from the 3-dot menu.
    '';
    };

    DevToolsGenAiSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for Chrome DevTools Generative AI Features

These features in Chrome DevTools employ generative AI models to provide additional debugging information. To use these features, Google Chrome has to collect data such as error messages, stack traces, code snippets, and network requests and send them to a server owned by Google, which runs a generative AI model. Response body or authentication and cookie headers in network requests are not included in the data sent to the server.

0 = Allow the feature to be used, while allowing Google to use relevant data to improve its AI models. Relevant data may include prompts, inputs, outputs, source materials, and written feedback, depending on the feature. It may also be reviewed by humans to improve AI models. 0 is the default value, except when noted below.

1 = Allow the feature to be used, but does not allow Google to improve models using users' content (including prompts, inputs, outputs, source materials, and written feedback). 1 is the default value for Enterprise users managed by Google Admin console and for Education accounts managed by Google Workspace.

2 = Do not allow the feature.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

Chrome DevTools Generative AI features include:

- Console Insights: explains console messages and offers suggestions on how to fix console errors.

- AI assistance: get help with understanding CSS styles (since version 131), network requests, performance, and files (all since version 132).

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow Chrome DevTools Generative AI Features and improve AI models.
* 1 = Allow Chrome DevTools Generative AI Features without improving AI models.
* 2 = Do not allow Chrome DevTools Generative AI Features.
    '';
    };

    DevToolsGoogleDeveloperProgramProfileAvailability = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Enable Google Developer Program Profiles in Chrome DevTools

This policy controls the integration of the Google Developer Program with Chrome DevTools. The user's Google Developer Program profile is shown in Chrome DevTools, and users receive badges for performing specific actions within Chrome DevTools.

Setting the policy to 0 - 'Enabled', or not setting any policy value, allows the integration of the Google Developer Program with Chrome DevTools, and allows sharing of Chrome DevTools tool usage in order to be able to award badges.

Setting the policy to 1 - 'Enabled without badges', allows the integration of the Google Developer Program with Chrome DevTools, but does not allow sharing Chrome DevTools tool usage with the Google Developer Program. No badges will be awarded.

Setting the policy to 2 - 'Disabled', does not allow the integration of the Google Developer Program with Chrome DevTools.
* 0 = Enable Google Developer Program integration in Chrome DevTools.
* 1 = Enable Google Developer Program integration in Chrome DevTools, but without sharing tool usage (for awarding badges).
* 2 = Do not enable Google Developer Program integration in Chrome DevTools.
    '';
    };

    DeveloperToolsAvailability = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control where Developer Tools can be used

Setting the policy to 0 (the default) means you can access the developer tools and the JavaScript console, but not in the context of extensions installed by enterprise policy or, since version 114 and if this is a managed user, extensions built into the browser. Setting the policy to 1 means you can access the developer tools and the JavaScript console in all contexts, including that of extensions installed by enterprise policy. Setting the policy to 2 means you can't access developer tools, and you can't inspect website elements.

This setting also turns off keyboard shortcuts and menu or context menu entries to open developer tools or the JavaScript console.

As of Google Chrome version 99, this setting also controls entry points for the 'View page source' feature. If you set this policy to 'DeveloperToolsDisallowed' (value 2), users cannot access source viewing via keyboard shortcut or the context menu. To fully block source viewing, you must also add 'view-source:*' to the URLBlocklist policy.

As of Google Chrome version 119, this setting also controls whether developer mode for Isolated Web Apps can be activated and used.

As of Google Chrome version 128, this setting will not control developer mode on extensions page if ExtensionDeveloperModeSettings policy is set.

The availability of Developer Tools is determined in the following order of precedence:
1. If a URL matches a pattern in the DeveloperToolsAvailabilityAllowlist policy, Developer Tools are allowed.
2. If the DeveloperToolsAvailabilityAllowlist is set and the DeveloperToolsAvailabilityBlocklist is not, any URL not on the allowlist is blocked.
3. If a URL matches a pattern in the DeveloperToolsAvailabilityBlocklist policy, Developer Tools are blocked.
4. If a URL is not covered by the allowlist or blocklist, this policy (DeveloperToolsAvailability) is the fallback.
* 0 = Disallow usage of the Developer Tools on apps and extensions installed by enterprise policy or, since version 114 and if this is a managed user, extensions built into the browser. Allow usage of the Developer Tools in other contexts
* 1 = Allow usage of the Developer Tools
* 2 = Disallow usage of the Developer Tools
    '';
    };

    Disable3DAPIs = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Disable support for 3D graphics APIs

Setting the policy to True (or setting HardwareAccelerationModeEnabled to False) prevents webpages from accessing the WebGL API.

Setting the policy to False or leaving it unset lets webpages use the WebGL API, but the browser's default settings might still require command line arguments to use these APIs.
    '';
    };

    DisableAuthNegotiateCnameLookup = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Disable CNAME lookup when negotiating Kerberos authentication

Setting the policy to Enabled skips CNAME lookup. The server name is used as entered when generating the Kerberos SPN.

Setting the policy to Disabled or leaving it unset means CNAME lookup determines the canonical name of the server when generating the Kerberos SPN.
    '';
    };

    DisablePrintPreview = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Disable Print Preview

Setting the policy to Enabled has Google Chrome open the system print dialog instead of the built-in print preview when users request a printout.

Setting the policy to Disabled or leaving it unset has print commands trigger the print preview screen.
    '';
    };

    DisableSafeBrowsingProceedAnyway = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Disable proceeding from the Safe Browsing warning page

Setting the policy to Enabled prevents users from proceeding past the warning page the Safe Browsing service shows to the malicious site. This policy only prevents users from proceeding on Safe Browsing warnings such as malware and phishing, not for SSL certificate-related issues such as invalid or expired certificates.

Setting the policy to Disabled or leaving it unset means users can choose to proceed to the flagged site after the warning appears.

See more about Safe Browsing ( https://developers.google.com/safe-browsing ).
    '';
    };

    DisableScreenshots = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Disable taking screenshots

Setting the policy to Enabled disallows screenshots taken with keyboard shortcuts
or extension APIs. Setting the policy to Disabled or not set allows screenshots.

Note that on Microsoft® Windows®, macOS and Linux,
this does not prevent screenshots that are taken with operating system or third party applications.
    '';
    };

    DiskCacheDir = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Set disk cache directory

Setting the policy has Google Chrome use the directory you provide for storing cached files on the disk—whether or not users specify the --disk-cache-dir flag.

If not set, Google Chrome uses the default cache directory, but users can change that setting with the --disk-cache-dir command line flag.

Google Chrome manages the contents of a volume's root directory. So to avoid data loss or other errors, do not set this policy to the root directory or any directory used for other purposes. See the variables you can use ( https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables ).
    '';
    };

    DiskCacheSize = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Set disk cache size in bytes

Setting the policy to None has Google Chrome use the default cache size for storing cached files on the disk. Users can't change it.

If you set the policy, Google Chrome uses the cache size you provide—whether or not users specify the --disk-cache-size flag. (Values below a few megabytes are rounded up.)

If not set, Google Chrome uses the default size. Users can change that setting using the --disk-cache-size flag.

Note: The value specified in this policy is used as a hint to various cache subsystems in the browser. Therefore the actual total disk consumption of all caches will be higher but within the same order of magnitude as the value specified.
    '';
    };

    DnsOverHttpsMode = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Controls the mode of DNS-over-HTTPS

Controls the mode of the DNS-over-HTTPS resolver. Please note that this
policy will only set the default mode for each query. The mode may be
overridden for special types of queries such as requests to resolve a
DNS-over-HTTPS server hostname.

The "off" mode will disable
DNS-over-HTTPS.

The "automatic" mode will send
DNS-over-HTTPS queries first if a DNS-over-HTTPS server is available and
may fallback to sending insecure queries on error.

The "secure" mode will only send
DNS-over-HTTPS queries and will fail to resolve on error.

On Android Pie and above, if DNS-over-TLS
is active, Google Chrome will not
send insecure DNS requests.

If this policy is unset, for managed devices DNS-over-HTTPS queries will not
be sent. Otherwise, the browser may send DNS-over-HTTPS requests to a
resolver associated with the user's configured system resolver.
* "off" = Disable DNS-over-HTTPS
* "automatic" = Enable DNS-over-HTTPS with insecure fallback
* "secure" = Enable DNS-over-HTTPS without insecure fallback
    '';
    };

    DnsOverHttpsTemplates = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Specify URI template of desired DNS-over-HTTPS resolver

The URI template of the desired DNS-over-HTTPS resolver. To specify multiple DNS-over-HTTPS resolvers, separate the corresponding URI templates with spaces.

If the DnsOverHttpsMode is set to "secure" then this policy must be set and not empty. On Google ChromeOS only, either this policy or the DnsOverHttpsTemplatesWithIdentifiers must be set, otherwise the DNS resolution will fail.

If the DnsOverHttpsMode is set to "automatic" and this policy is set then the URI templates specified will be used; if this policy is unset then hardcoded mappings will be used to attempt to upgrade the user's current DNS resolver to a DoH resolver operated by the same provider.

If the URI template contains a dns variable, requests to the resolver will use GET; otherwise requests will use POST.

Incorrectly formatted templates will be ignored.
    '';
    };

    DomainReliabilityAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow reporting of domain reliability related data

If this policy is set false, domain reliability diagnostic data reporting is disabled and no data is sent to Google.
If this policy is set true or not set, domain reliability diagnostic data reporting will follow the behavior of MetricsReportingEnabled for Google Chrome or DeviceMetricsReportingEnabled for Google ChromeOS.
    '';
    };

    DownloadDirectory = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Set download directory

Setting the policy sets up the directory Chrome uses for downloading files. It uses the provided directory, whether or not users specify one or turned on the flag to be prompted for download location every time.

This policy overrides the DefaultDownloadDirectory policy.

Leaving the policy unset means Chrome uses the default download directory, and users can change it.

On Google ChromeOS it's possible to set it only to Google Drive directories.

Note: See a list of variables you can use ( https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables ).
    '';
    };

    DownloadRestrictions = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Allow download restrictions

Setting the policy means users can't bypass download security decisions.

There are many types of download warnings within Chrome, which roughly break down into these categories (learn more about Safe Browsing verdicts https://support.google.com/chrome/?p=ib_download_blocked):

* Malicious, as flagged by the Safe Browsing server
* Uncommon or unwanted, as flagged by the Safe Browsing server
* A dangerous file type (e.g. all SWF downloads and many EXE downloads)

Setting the policy blocks different subsets of these, depending on it's value:

0: No special restrictions. Default.

1: Blocks malicious files flagged by the Safe Browsing server AND Blocks all dangerous file types. Only recommended for OUs/browsers/users that have a high tolerance for False Positives.

2: Blocks malicious files flagged by the Safe Browsing server AND Blocks uncommon or unwanted files flagged by the Safe Browsing server AND Blocks all dangerous file types. Only recommended for OUs/browsers/users that have a high tolerance for False Positives.

3: Blocks all downloads. Not recommended, except for special use cases.

4: Blocks malicious files flagged by the Safe Browsing server, does not block dangerous file types. Recommended.

Note: These restrictions apply to downloads triggered from webpage content, as well as the Download link… menu option. They don't apply to the download of the currently displayed page or to saving as PDF from the printing options. Read more about Safe Browsing ( https://developers.google.com/safe-browsing ).
* 0 = No special restrictions. Default.
* 1 = Block malicious downloads and dangerous file types.
* 2 = Block malicious downloads, uncommon or unwanted downloads and dangerous file types.
* 3 = Block all downloads.
* 4 = Block malicious downloads. Recommended.
    '';
    };

    EditBookmarksEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable or disable bookmark editing

Setting the policy to True or leaving it unset lets users add, remove, modify, or upload bookmarks.

Setting the policy to False means users can't add, remove, modify or upload bookmarks. They can still use existing bookmarks.
    '';
    };

    EnableAuthNegotiatePort = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Include non-standard port in Kerberos SPN

Setting the policy to Enabled and entering a nonstandard port (in other words, a port other than 80 or 443) includes it in the generated Kerberos SPN.

Setting the policy to Disabled or leaving it unset means the generated Kerberos SPN won't include a port.
    '';
    };

    EnableExperimentalPolicies = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Enables experimental policies

Allows Google Chrome to load experimental policies.

WARNING: Experimental policies are unsupported and subject to change or be removed without notice in future version of the browser!

An experimental policy may not be finished or still have known or unknown defects. It may be changed or even removed without any notification. By enabling experimental policies, you could lose browser data or compromise your security or privacy.

If a policy is not in the list and it's not officially released, its value will be ignored on Beta and Stable channel.

If a policy is in the list and it's not officially released, its value will be applied.

This policy has no effect on already released policies.
    '';
    };

    EnableMediaRouter = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Google Cast

Setting the policy to Enabled or leaving it unset turns on Google Cast, which users can launch from the app menu, page context menus, media controls on Cast-enabled websites, and (if shown) the Cast toolbar icon.

Setting the policy to Disabled turns off Google Cast.
    '';
    };

    EnableOnlineRevocationChecks = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable online OCSP/CRL checks

Setting the policy to True means online OCSP/CRL checks are performed.

Setting the policy to False or leaving it unset means Google Chrome won't perform online revocation checks in Google Chrome 19 and later.

Note: OCSP/CRL checks provide no effective security benefit.
    '';
    };

    EnableProxyOverrideRulesForAllUsers = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Controls which managed users can set the ProxyOverrideRules policy.

When this policy is set to 0 or left unset, the ProxyOverrideRules policy will only be applied at the user scope for affiliated users.
When this policy is set to 1, the ProxyOverrideRules policy will be applied at the user scope, even that user is unaffiliated.
    '';
    };

    EnableUnsafeSwiftShader = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow software WebGL fallback using SwiftShader

A policy that controls if SwiftShader will be used as a WebGL fallback when hardware GPU acceleration is not available.

SwiftShader has been used to support WebGL on systems without GPU acceleration such as headless systems or virtual machines but has been deprecated due to security issues. Starting in M139, WebGL context creation will fail when it would have otherwise used SwiftShader. This policy allows the browser or administrator to temporarily defer the deprecation.

Setting the policy to Enabled, SwiftShader will be used as a software WebGL fallback.

Setting the policy to Disabled or not set, WebGL context creation may fail if hardware GPU acceleration is not available. Web pages may misbehave if they do not gracefully handle WebGL context creation failure.

This is a temporary policy which will be removed in the future.
    '';
    };

    EncryptedClientHelloEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable TLS Encrypted ClientHello

Encrypted ClientHello (ECH) is an extension to TLS to encrypt sensitive fields of the ClientHello and improve privacy.

If this policy is not configured, or is set to enabled, Google Chrome will follow the default rollout process for ECH. If it is disabled, Google Chrome will not enable ECH.

When the feature is enabled, Google Chrome may or may not use ECH depending on server support, availability of the HTTPS DNS record, or rollout status.

ECH is an evolving protocol, so Google Chrome's implementation is subject to change. As such, this policy is a temporary measure to control the initial experimental implementation. It will be replaced with final controls as the protocol finalizes.
    '';
    };

    EnterpriseCustomLabel = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Set a custom enterprise label for a managed profile

This policy controls a custom label used to identify managed profiles. For managed profiles, this label will be shown next to the avatar in the toolbar. The custom label will not be translated.

When this policy is applied, any strings that surpass 16 characters will be truncated with a “...” Please refrain from using extended names.

This policy can only be set as a user policy.

Note that this policy has no effect if the EnterpriseProfileBadgeToolbarSettings policy is set to hide_expanded_enterprise_toolbar_badge (value 1).
    '';
    };

    EnterpriseCustomLabelForBrowser = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Set a custom enterprise label for a managed browser

This policy controls a custom label used to indicate a managed browser. For managed browsers, this label will be shown in a management disclaimer on a footer on the New Tab page. The custom label will not be translated.

Note that this policy is only applied for managed browsers, so it will have no effect for managed users on unmanaged browsers.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    EnterpriseHardwarePlatformAPIEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enables managed extensions to use the Enterprise Hardware Platform API

Setting the policy to True lets extensions installed by enterprise policy use the Enterprise Hardware Platform API.

Setting the policy to False or leaving it unset prevents extensions from using this API.

Note: This policy also applies to component extensions, such as the Hangout Services extension.
    '';
    };

    EnterpriseLogoUrl = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Enterprise Logo URL for a managed profile

A URL to an image that will be used as an enterprise badge for a managed profile. The URL must point to an image.

This policy can only be set as a user policy.

It is recommended to use the favicon (example https://www.google.com/favicon.ico) or an icon no smaller than 48 x 48 px.
    '';
    };

    EnterpriseLogoUrlForBrowser = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Enterprise Logo URL for a managed browser

A URL to an image that will be used as an enterprise badge for a managed browser. The URL must point to an image.

It is recommended to use the favicon (example https://www.google.com/favicon.ico) or an icon no smaller than 48 x 48 px.

Note that this policy is only applied for managed browsers, so it will have no effect for managed users on unmanaged browsers.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    EnterpriseProfileBadgeToolbarSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Controls visibility of enterprise profile badge in the toolbar

For work and school profiles, the toolbar will show a "Work" or "School" label by default next to the toolbar avatar. The label will only be shown if the signed in account is managed.

Setting this policy to hide_expanded_enterprise_toolbar_badge (value 1) will hide the enterprise badge for a managed profile in the toolbar.

Leaving this policy unset or setting it to show_expanded_enterprise_toolbar_badge (value 0) will show the enterprise badge.

The label is customizable via the EnterpriseCustomLabel policy.
* 0 = Show expanded enterprise toolbar badge
* 1 = Hide expanded enterprise toolbar badge
    '';
    };

    EnterpriseProfileCreationKeepBrowsingData = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Keep browsing data when creating enterprise profile by default

If this policy is Enabled, the option to keep any existing browsing data when creating an enterprise profile will be checked by default.

If this policy is unset or Disabled, the option to keep any existing browsing data when creating an enterprise profile will not be checked by default.

Regardless of the value, the user will be able to decide whether or not to keep any existing browsing data when creating an enterprise profile.

This policy has no effect if the option to keep existing browsing data is not available; this happens if enterprise profile separation is strictly enforced, or if the data would be from an already managed profile.
    '';
    };

    EnterpriseSearchAggregatorSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Enterprise search aggregator settings

This policy allows administrators to set a designated enterprise search aggregator that will provide search recommendations and results within the omnibox (address bar) and the search box on the New Tab page.

By default, enterprise search suggestions will be blended and shown alongside regular Google Chrome recommendations. Users can explicitly scope their search to just the enterprise search aggregator by typing the keyword specified in the shortcut field with or without the @ prefix (e.g. @work) followed by Space or Tab in the omnibox. Scoped enterprise searches (triggered by a keyword) are currently only supported in the omnibox and not in the search box on the New Tab page.

The following fields are required: name, shortcut, search_url, suggest_url.

The name field corresponds to the search engine name shown to the user in the address bar.

The shortcut field corresponds to the keyword that the user enters to trigger the search. The shortcut can include plain words and characters, but cannot include spaces or start with the @ symbol. Shortcuts must be unique.

The search_url field specifies the URL on which to search. Enter the web address for the search engine's results page, and use '{searchTerms}' in place of the query.

The suggest_url field specifies the URL that provides search suggestions. A POST request will be made and the user's query will be passed in the POST params under key 'query'.

The icon_url field specifies the URL to an image that will be used on the search suggestions. A default icon will be used when this field is not set. It's recommended to use a favicon (example https://www.google.com/favicon.ico). Supported image file formats: JPEG, PNG, and ICO.

The require_shortcut field specifies whether the address bar shortcut is required to see search recommendations. If required, suggestions will not be shown in the search box on the New Tab page, but will continue to be shown in the omnibox (address bar) in scoped search mode. If this field is not set, the address bar shortcut is not required.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.

Schema:
{
  "properties": {
    "icon_url": {
      "type": "string"
    }, 
    "name": {
      "type": "string"
    }, 
    "require_shortcut": {
      "type": "boolean"
    }, 
    "search_url": {
      "type": "string"
    }, 
    "shortcut": {
      "type": "string"
    }, 
    "suggest_url": {
      "type": "string"
    }
  }, 
  "required": [
    "name", 
    "shortcut", 
    "suggest_url", 
    "search_url"
  ], 
  "type": "object"
}
    '';
    };

    ExemptDomainFileTypePairsFromFileTypeDownloadWarnings = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Disable download file type extension-based warnings for specified file types on domains

You can enable this policy to create a dictionary of file type extensions with a corresponding list of domains that will be exempted from file type extension-based download warnings. This lets enterprise administrators block file type extension-based download warnings for files that are associated with a listed domain. For example, if  the "jnlp" extension is associated with "website1.com", users would not see a warning when downloading "jnlp" files from "website1.com", but see a download warning when downloading "jnlp" files from "website2.com".

Files with file type extensions specified for domains identified by this policy will still be subject to non-file type extension-based security warnings such as mixed-content download warnings and Safe Browsing warnings.

If you disable this policy or don't configure it, file types that trigger extension-based download warnings will show warnings to the user.

If you enable this policy:

* The URL pattern should be formatted according to https://chromeenterprise.google/policies/url-patterns/.

* The file type extension entered must be in lower-cased ASCII. The leading separator should not be included when listing the file type extension, so list "jnlp" should be used instead of ".jnlp".

Example:

The following example value would prevent file type extension-based download warnings on "exe" and "jnlp" extensions for *.example.com domains, and on "swf" extensions for all domains. It will show the user a file type extension-based download warning on any other domain for exe and jnlp files, but not for swf files.

[
{ "file_extension": "jnlp", "domains": ["example.com"] },
{ "file_extension": "exe", "domains": ["example.com"] },
{ "file_extension": "swf", "domains": ["*"] }
]

Note that while the preceding example shows the suppression of file type extension-based download warnings for "swf" files for all domains, applying suppression of such warnings for all domains for any dangerous file type extension is not recommended due to security concerns. It is shown in the example merely to demonstrate the ability to do so.

If this policy is enabled alongside DownloadRestrictions, then the exemptions to file type extension-based warnings specified by this policy take precedence over a DownloadRestrictions setting that would block dangerous file types. The exemptions specified by this policy only apply to the "block dangerous file types" behavior specified by values 1 and 2 of DownloadRestrictions.

For example, if this policy specifies an exemption for "exe" downloads from "website1.com", and DownloadRestrictions is set to block malicious downloads and dangerous file types (value 1), then "exe" downloads from "website1.com" will be exempt from file type extension-based blocking but will still be blocked if they are malicious.

More information about DownloadRestrictions can be found at https://chromeenterprise.google/policies/?policy=DownloadRestrictions.

Schema:
{
  "items": {
    "id": "DomainFiletypePair", 
    "properties": {
      "domains": {
        "items": {
          "type": "string"
        }, 
        "type": "array"
      }, 
      "file_extension": {
        "type": "string"
      }
    }, 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    ExplicitlyAllowedNetworkPorts = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Explicitly allowed network ports

There is a list of restricted ports built into Google Chrome. Connections to these ports will fail. This setting permits bypassing that list. The value is a comma-separated list of zero or more ports that outgoing connections will be permitted on.

Ports are restricted to prevent Google Chrome being used as a vector to exploit various network vulnerabilities. Setting this policy may expose your network to attacks. This policy is intended as a temporary workaround for errors with code "ERR_UNSAFE_PORT" while migrating a service running on a blocked port to a standard port (ie. port 80 or 443).

Malicious websites can easily detect that this policy is set, and for what ports, and use that information to target attacks.

Each port here is labelled with a date that it can be unblocked until. After that date the port will be restricted regardless of this setting.

Leaving the value empty or unset means that all restricted ports will be blocked. If there is a mixture of valid and invalid values, the valid ones will be applied.

This policy overrides the "--explicitly-allowed-ports" command-line option.
* "554" = port 554 (can be unblocked until 2021/10/15)
* "10080" = port 10080 (can be unblocked until 2022/04/01)
* "6566" = port 6566 (can be unblocked until 2021/10/15)
* "989" = port 989 (can be unblocked until 2022/02/01)
* "990" = port 990 (can be unblocked until 2022/02/01)
    '';
    };

    ExtensionAllowedTypes = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure allowed app/extension types

Setting the policy controls which apps and extensions may be installed in Google Chrome, which hosts they can interact with, and limits runtime access.

Leaving the policy unset results in no restrictions on the acceptable extension and app types.

Extensions and apps which have a type that's not on the list won't be installed. Each value should be one of these strings:

* "extension"

* "theme"

* "user_script"

* "hosted_app"

* "legacy_packaged_app"

* "platform_app"

See the Google Chrome extensions documentation for more information on these types.

Versions earlier than 75 that use multiple comma separated extension IDs aren't supported and are skipped. The rest of the policy applies.

Note: This policy also affects extensions and apps to be force-installed using ExtensionInstallForcelist.

Note: This policy only applies to platforms that support extensions.
* "extension" = Extension
* "theme" = Theme
* "user_script" = User script
* "hosted_app" = Hosted app
* "legacy_packaged_app" = Legacy packaged app
* "platform_app" = Platform app
    '';
    };

    ExtensionDeveloperModeSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control the availability of developer mode on extensions page

Control if users can turn on Developer Mode on chrome://extensions.

If the policy is not set, users can turn on developer mode on extension page unless DeveloperToolsAvailability policy is set to DeveloperToolsDisallowed (2).
If the policy is set to Allow (0), users can turn on developer mode on extensions page.
If the policy is set to Disallow (1), users can not turn on developer mode on extensions page.

If this policy is set, DeveloperToolsAvailability can no longer control extensions developer mode.

Note: This policy only applies to platforms that support extensions.
* 0 = Allow the usage of developer mode on extensions page
* 1 = Do not allow the usage of developer mode on extensions page
    '';
    };

    ExtensionExtendedBackgroundLifetimeForPortConnectionsToUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure a list of origins that grant extended background lifetime to the connecting extensions.

Extensions that connect to one of these origins will be be kept running as long as the port is connected.

If unset, the policy's default values will be used. These are app origins that offer SDKs that are known to not offer the possibility to restart a closed connection to a previous state:
- Smart Card Connector
- Citrix Receiver (stable, beta, back-up)
- VMware Horizon (stable, beta)

If set, the default value list is extended with the newly configured values. Both defaults and the policy-provided entries will grant the exception to the connecting extensions, as long as the port is connected.
    '';
    };

    ExtensionInstallAllowlist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure extension installation allow list

Setting the policy specifies which extensions are not subject to the blocklist.

A blocklist value of * means all extensions are blocked and users can only install extensions listed in the allow list.

By default, all extensions are allowed. But, if you prohibited extensions by policy, use the list of allowed extensions to change that policy.

Note: This policy only applies to platforms that support extensions.
    '';
    };

    ExtensionInstallBlocklist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure extension installation blocklist

Allows you to specify which extensions the users can NOT install. Extensions already installed will be disabled if blocked, without a way for the user to enable them. Once an extension disabled due to the blocklist is removed from it, it will automatically get re-enabled.

A blocklist value of '*' means all extensions are blocked by default. Extensions that are explicitly listed in the allowlist are allowed if they are signed (packed). All unpacked extensions are blocked.

If this policy is left not set the user can install any extension in Google Chrome.

Note: This policy only applies to platforms that support extensions.
    '';
    };

    ExtensionInstallForcelist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure the list of force-installed apps and extensions

Setting the policy specifies a list of apps and extensions that install silently, without user interaction, and which users can't uninstall or turn off through the Google Chrome interface. Permissions are granted implicitly, including for the enterprise.deviceAttributes and enterprise.platformKeys extension APIs. (These 2 APIs aren't available to apps and extensions that aren't force-installed.)

Although Google Chrome aims to prevent users from uninstalling these extensions, some operating systems make it impossible for Google Chrome to defend robustly against extensions being modified externally, so this prevention is best efforts.

Leaving the policy unset means no apps or extensions are autoinstalled, and users can uninstall any app or extension in Google Chrome.

This policy supersedes ExtensionInstallBlocklist policy. If a previously force-installed app or extension is removed from this list, Google Chrome automatically uninstalls it.

The source code of any extension may be altered by users through developer tools, potentially rendering the extension dysfunctional. If this is a concern, set the DeveloperToolsDisabled policy.

Each list item of the policy is a string that contains an extension ID and, optionally, an update URL separated by a semicolon (;). The extension ID is the 32-letter string found, for example, on chrome://extensions when in Developer mode. If specified, the update URL should point to an Update Manifest XML document ( https://developer.chrome.com/extensions/autoupdate ). The update URL should use one of the following schemes: http, https or file. By default, the Chrome Web Store's update URL is used. The update URL set in this policy is only used for the initial installation; subsequent updates of the extension use the update URL in the extension's manifest. The update url for subsequent updates can be overridden using the ExtensionSettings policy, see http://support.google.com/chrome/a?p=Configure_ExtensionSettings_policy.

On Microsoft® Windows® instances, apps and extensions from outside the Chrome Web Store can only be forced installed if the instance is joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS instances, apps and extensions from outside the Chrome Web Store can only be force installed if the instance is managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.

Note: This policy doesn't apply to Incognito mode. Read about hosting extensions ( https://developer.chrome.com/extensions/hosting ).

Note: This policy only applies to platforms that support extensions.
    '';
    };

    ExtensionInstallSources = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure extension, app, and user script install sources

Setting the policy specifies which URLs may install extensions, apps, and themes. Before Google Chrome 21, users could click on a link to a *.crx file, and Google Chrome would offer to install the file after a few warnings. Afterwards, such files must be downloaded and dragged to the Google Chrome settings page. This setting allows specific URLs to have the old, easier installation flow.

Each item in this list is an extension-style match pattern (see https://developer.chrome.com/extensions/match_patterns). Users can easily install items from any URL that matches an item in this list. Both the location of the *.crx file and the page where the download is started from (the referrer) must be allowed by these patterns.

ExtensionInstallBlocklist takes precedence over this policy. That is, an extension on the blocklist won't be installed, even if it happens from a site on this list.

Note: This policy only applies to platforms that support extensions.
    '';
    };

    ExtensionInstallTypeBlocklist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Blocklist for install types of extensions

The blocklist controls which extensions install types are disallowed.

Setting "command_line" will block extension from being loaded from
command line.
* "command_line" = Blocks extensions from being loaded from command line
    '';
    };

    ExtensionSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Extension management settings

Setting the policy controls extension management settings for Google Chrome, including any controlled by existing extension-related policies. The policy supersedes any legacy policies that might be set.

This policy maps an extension ID or an update URL to its specific setting only. A default configuration can be set for the special ID "*", which applies to all extensions without a custom configuration in this policy. With an update URL, configuration applies to extensions with the exact update URL stated in the extension manifest ( http://support.google.com/chrome/a?p=Configure_ExtensionSettings_policy ). If the 'override_update_url' flag is set to true, the extension is installed and updated using the "update" URL specified in the ExtensionInstallForcelist policy or in 'update_url' field in this policy. The flag 'override_update_url' is ignored if the 'update_url' is a Chrome Web Store url.

On Microsoft® Windows® instances, apps and extensions from outside the Chrome Web Store can only be forced installed if the instance is joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS instances, apps and extensions from outside the Chrome Web Store can only be force installed if the instance is managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.

Note: This policy only applies to platforms that support extensions.

Schema:
{
  "patternProperties": {
    "^[a-p]{32}(?:,[a-p]{32})*,?$": {
      "properties": {
        "allowed_permissions": {
          "id": "ListOfPermissions", 
          "items": {
            "pattern": "^[a-z][a-zA-Z0-9._]*$", 
            "type": "string"
          }, 
          "type": "array"
        }, 
        "blocked_install_message": {
          "description": "text that will be displayed to the user in the chrome webstore if installation is blocked.", 
          "type": "string"
        }, 
        "blocked_permissions": {
          "items": {
            "pattern": "^[a-z][a-zA-Z0-9._]*$", 
            "type": "string"
          }, 
          "type": "array"
        }, 
        "file_url_navigation_allowed": {
          "type": "boolean"
        }, 
        "installation_mode": {
          "enum": [
            "blocked", 
            "allowed", 
            "force_installed", 
            "normal_installed", 
            "removed"
          ], 
          "type": "string"
        }, 
        "minimum_version_required": {
          "pattern": "^[0-9]+([.][0-9]+)*$", 
          "type": "string"
        }, 
        "override_update_url": {
          "type": "boolean"
        }, 
        "runtime_allowed_hosts": {
          "id": "ListOfUrlPatterns", 
          "items": {
            "type": "string"
          }, 
          "type": "array"
        }, 
        "runtime_blocked_hosts": {
          "items": {
            "type": "string"
          }, 
          "type": "array"
        }, 
        "toolbar_pin": {
          "enum": [
            "force_pinned", 
            "default_unpinned", 
            "default_pinned"
          ], 
          "type": "string"
        }, 
        "update_url": {
          "type": "string"
        }
      }, 
      "type": "object"
    }, 
    "^update_url:": {
      "properties": {
        "allowed_permissions": {
          "items": {
            "pattern": "^[a-z][a-zA-Z0-9._]*$", 
            "type": "string"
          }, 
          "type": "array"
        }, 
        "blocked_permissions": {
          "items": {
            "pattern": "^[a-z][a-zA-Z0-9._]*$", 
            "type": "string"
          }, 
          "type": "array"
        }, 
        "installation_mode": {
          "enum": [
            "blocked", 
            "allowed", 
            "removed"
          ], 
          "type": "string"
        }
      }, 
      "type": "object"
    }
  }, 
  "properties": {
    "*": {
      "properties": {
        "allowed_types": {
          "items": {
            "enum": [
              "extension", 
              "theme", 
              "user_script", 
              "hosted_app", 
              "legacy_packaged_app", 
              "platform_app"
            ], 
            "type": "string"
          }, 
          "type": "array"
        }, 
        "blocked_install_message": {
          "type": "string"
        }, 
        "blocked_permissions": {
          "items": {
            "pattern": "^[a-z][a-zA-Z0-9._]*$", 
            "type": "string"
          }, 
          "type": "array"
        }, 
        "install_sources": {
          "items": {
            "type": "string"
          }, 
          "type": "array"
        }, 
        "installation_mode": {
          "enum": [
            "blocked", 
            "allowed", 
            "removed"
          ], 
          "type": "string"
        }, 
        "runtime_allowed_hosts": {
          "items": {
            "type": "string"
          }, 
          "type": "array"
        }, 
        "runtime_blocked_hosts": {
          "items": {
            "type": "string"
          }, 
          "type": "array"
        }
      }, 
      "type": "object"
    }
  }, 
  "type": "object"
}
    '';
    };

    ExtensionUnpublishedAvailability = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control availability of extensions unpublished on the Chrome Web Store.

If this policy is enabled, extensions that are unpublished on the Chrome Web
Store will be disabled in Google Chrome.
This policy only applies to extensions that are installed and updated from the
Chrome Web Store.

Off-store extensions such as unpacked extensions installed using developer
mode and extensions installed using the command-line switch are ignored.
Force-installed extensions that are self-hosted are ignored. All
version-pinned extensions are also ignored.

If the policy is set to AllowUnpublished (0) or not set, extensions that are unpublished on the Chrome Web Store are allowed.
If the policy is set to DisableUnpublished (1), extensions that are unpublished on the Chrome Web Store are disabled.
* 0 = Allow unpublished extensions
* 1 = Disable unpublished extensions
    '';
    };

    ExternalProtocolDialogShowAlwaysOpenCheckbox = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show an "Always open" checkbox in external protocol dialog.

This policy controls whether or not the "Always open" checkbox is shown on external protocol launch confirmation prompts.

     If this policy is set to True or not set, when an external protocol confirmation is shown, the user can select "Always allow" to skip all future confirmation prompts for the protocol on this site.

     If this policy is set to False, the "Always allow" checkbox is not displayed and the user will be prompted each time an external protocol is invoked.
    '';
    };

    FeedbackSurveysEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Specifies whether in-product Google Chrome surveys are shown to users.

Google Chrome in-product surveys collect user feedback for the browser. Survey responses are not associated with user accounts.
When this policy is Enabled or not set, in-product surveys may be shown to users.
When this policy is Disabled, in-product surveys are not shown to users.

This policy has no effect if MetricsReportingEnabled is set to Disabled, which disables in-product surveys as well.
    '';
    };

    FetchKeepaliveDurationSecondsOnShutdown = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Fetch keepalive duration on Shutdown

Controls the duration (in seconds) allowed for keepalive requests on browser shutdown.

When specified, browser shutdown can be blocked up to the specified seconds,
to process keepalive (https://fetch.spec.whatwg.org/#request-keepalive-flag) requests.

The default value (0) means this feature is disabled.
    '';
    };

    FileOrDirectoryPickerWithoutGestureAllowedForOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow file or directory picker APIs to be called without prior user gesture

For security reasons, the
showOpenFilePicker(),
showSaveFilePicker() and
showDirectoryPicker() web APIs
require a prior user gesture ("transient activation") to be called or will
otherwise fail.

With this policy set, admins can specify origins on which these APIs can be
called without prior user gesture.

For detailed information on valid url patterns, please see
https://chromeenterprise.google/policies/url-patterns/. * is
not an accepted value for this policy.

If this policy is unset, all origins will require a prior user gesture to call
these APIs.
    '';
    };

    FileSystemReadAskForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow read access via the File System API on these sites

Setting the policy lets you list the URL patterns that specify which sites can ask users to grant them read access to files or directories in the host operating system's file system via the File System API.

Leaving the policy unset means DefaultFileSystemReadGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

URL patterns must not conflict with FileSystemReadBlockedForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    FileSystemReadBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block read access via the File System API on these sites

Setting the policy lets you list the URL patterns that specify which sites can't ask users to grant them read access to files or directories in the host operating system's file system via the File System API.

Leaving the policy unset means DefaultFileSystemReadGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

URL patterns can't conflict with FileSystemReadAskForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    FileSystemWriteAskForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow write access to files and directories on these sites

Setting the policy lets you list the URL patterns that specify which sites can ask users to grant them write access to files or directories in the host operating system's file system.

Leaving the policy unset means DefaultFileSystemWriteGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

URL patterns must not conflict with FileSystemWriteBlockedForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    FileSystemWriteBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block write access to files and directories on these sites

Setting the policy lets you list the URL patterns that specify which sites can't ask users to grant them write access to files or directories in the host operating system's file system.

Leaving the policy unset means DefaultFileSystemWriteGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

URL patterns can't conflict with FileSystemWriteAskForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    ForceEphemeralProfiles = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Ephemeral profile

If set to enabled this policy forces the profile to be switched to ephemeral mode. If this policy is specified as an OS policy (e.g. GPO on Windows) it will apply to every profile on the system; if the policy is set as a Cloud policy it will apply only to a profile signed in with a managed account.

In this mode the profile data is persisted on disk only for the length of the user session. Features like browser history, extensions and their data, web data like cookies and web databases are not preserved after the browser is closed. However this does not prevent the user from downloading any data to disk manually, save pages or print them.

If the user has enabled sync all this data is preserved in their sync profile just like with regular profiles. Incognito mode is also available if not explicitly disabled by policy.

If the policy is set to disabled or left not set signing in leads to regular profiles.
    '';
    };

    ForceForegroundPriorityForAllTabs = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Force foreground priority for all tabs

This policy controls whether background web content is forced to run at
foreground priority.

By default, the browser optimizes resources by deprioritizing content in
background tabs. Enabling this policy overrides that behavior, causing
background tabs to be scheduled the same way as the active tab.

Note that forcing background content to run at foreground priority may
slightly impact the responsiveness of the active tab.

If this policy is set to Enabled, all web content runs at foreground priority
regardless of its visibility state.

If this policy is set to Disabled or not set, the browser determines priority
based on standard heuristics (e.g., deprioritizing content that is not
visible, not playing audio, not participating in video calls...).
    '';
    };

    ForceGoogleSafeSearch = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Force Google SafeSearch

Setting the policy to Enabled means SafeSearch in Google Search is always active, and users can't change this setting.

Setting the policy to Disabled or leaving it unset means SafeSearch in Google Search is not enforced.
    '';
    };

    ForcePermissionPolicyUnloadDefaultEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Controls whether unload event handlers can be disabled.

unload event handlers are being deprecated. Whether they fire depends on the unload Permissions-Policy. Currently, they are allowed by policy by default. In the future they will gradually move to being disallowed by default and sites must explicitly enable them using Permissions-Policy headers. This enterprise policy can be used to opt out of this gradual deprecation by forcing the default to remain as enabled.

Pages may depend on unload event handlers to save data or signal the end of a user session to the server. This is not recommended as it is unreliable and impacts performance by blocking use of BackForwardCache. Recommended alternatives exist, however the unload event has been used for a long time. Some applications may still rely on them.

If this policy is set to false or not set, then unload events handlers will be gradually deprecated in-line with the deprecation rollout and sites which do not set Permissions-Policy header will stop firing `unload` events.

If this policy is set to true then unload event handlers will continue to work by default.

NOTE: This policy had an incorrectly documented default of `true` in M117. The unload event did and will not change in M117, so this policy has no effect in that version.
    '';
    };

    ForceYouTubeRestrict = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Force minimum YouTube Restricted Mode

Setting the policy enforces a minimum Restricted mode on YouTube and prevents users from picking a less restricted mode. If you set it to:

* Strict, Strict Restricted mode on YouTube is always active.

* Moderate, the user may only pick Moderate Restricted mode and Strict Restricted mode on YouTube, but can't turn off Restricted mode.

* Off or if no value is set, Restricted mode on YouTube isn't enforced by Chrome. External policies such as YouTube policies might still enforce Restricted mode.
* 0 = Do not enforce Restricted Mode on YouTube
* 1 = Enforce at least Moderate Restricted Mode on YouTube
* 2 = Enforce Strict Restricted Mode for YouTube
    '';
    };

    ForcedLanguages = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure the content and order of preferred languages

This policy allows admins to configure the order of the preferred languages in Google Chrome's settings.

The order of the list will appear in the same order under the "Order languages based on your preference" section in chrome://settings/languages. Users won't be able to remove or reorder languages set by the policy, but will be able to add languages underneath those set by the policy. Users will also have full control over the browser's UI language and translation/spell check settings, unless enforced by other policies.

Leaving the policy unset lets users manipulate the entire list of preferred languages.
    '';
    };

    FullscreenAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow fullscreen mode

Setting the policy to True or leaving it unset means that, with appropriate permissions, users, apps, and extensions can enter Fullscreen mode (in which only web content appears).

Setting the policy to False means users, apps, and extensions can't enter Fullscreen mode.
    '';
    };

    GSSAPILibraryName = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      GSSAPI library name

Setting the policy specifies which GSSAPI library to use for HTTP authentication. Set the policy to either a library name or a full path.

Leaving the policy unset means Google Chrome uses a default library name.
    '';
    };

    GeminiActOnWebAllowedForURLs = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow Gemini app integrations to directly act on specified sites

Allows to set a list of URL patterns that specify on which sites Gemini app integrations can directly act on web pages.

URLs matching neither the allowlist or the blocklist use GeminiActOnWebSettings.

URLs matching both the allowlist and the blocklist are allowed.

For detailed information on valid url patterns, please see https://support.google.com/chrome/a?p=url_blocklist_filter_format.
    '';
    };

    GeminiActOnWebBlockedForURLs = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block Gemini app integrations to directly act on specified sites

Allows to set a list of URL patterns that specify on which sites Gemini app integrations cannot directly act on web pages.

URLs matching neither the allowlist or the blocklist use GeminiActOnWebSettings.

URLs matching both the allowlist and the blocklist are allowed.

For detailed information on valid url patterns, please see https://support.google.com/chrome/a?p=url_blocklist_filter_format.
    '';
    };

    GeminiActOnWebSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Allows Gemini app integrations to directly act on web pages

Controls if the Gemini app is allowed to take action on the web pages on behalf of the user.

0/unset  = Gemini app is allowed to take action on the web pages.

1 = Gemini app is not allowed to take action on the web pages.

This policy has no effect when the Gemini app is disabled. For example, the Gemini app can be disabled by GeminiSettings policy.

For more information on Gemini in Chrome, please see https://support.google.com/chrome/a/answer/16291696.

Gemini's actuation is not available in all countries or all languages. Setting this policy does not guarantee the feature will be enabled; it remains subject to availability. For more info on the roll-out, check the Enterprise Release Notes: https://support.google.com/chrome/a/answer/7679408?hl=en
* 0 = Allow the Gemini app to take action on the web pages.
* 1 = Disallow the Gemini app to take action on the web pages.
    '';
    };

    GenAILocalFoundationalModelSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for GenAI local foundational model

Configure how Google Chrome downloads the foundational GenAI model and uses for inference locally.

When the policy is set to Allowed (0) or not set, the model is downloaded automatically, and used for inference.

When the policy is set to Disabled (1), the model will not be downloaded, and the existing model (if already downloaded) will be deleted.

On desktop platforms, model downloading can also be disabled by ComponentUpdatesEnabled.
* 0 = Downloads model automatically
* 1 = Do not download model
    '';
    };

    GeolocationBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block geolocation on these sites

Setting the policy lets you set a list of URL patterns that specify sites that are not allowed to access the user's geolocation, and are also prevented from requesting user permission to do so.

Leaving the policy unset means DefaultGeolocationSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    GloballyScopeHTTPAuthCacheEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable globally scoped HTTP auth cache

This policy configures a single global per profile cache with HTTP server authentication credentials.

If this policy is unset or disabled, the browser will use the default behavior of cross-site auth, this behavior will be to scope HTTP server authentication credentials by top-level site, so if two sites use resources from the same authenticating domain, credentials will need to be provided independently in the context of both sites. Cached proxy credentials will be reused across sites.

If the policy is enabled, HTTP auth credentials entered in the context of one site will automatically be used in the context of another.

Enabling this policy leaves sites open to some types of cross-site attacks, and allows users to be tracked across sites even without cookies by adding entries to the HTTP auth cache using credentials embedded in URLs.

This policy is intended to give enterprises depending on the legacy behavior a chance to update their login procedures, and will be removed in the future.
    '';
    };

    GoogleSearchSidePanelEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Google Search Side Panel

If set to Enabled or not set, Google Search Side Panel is allowed on all web pages.

If set to Disabled, Google Search Side Panel is not available on any webpage.

GenAI capabilities that are part of this feature are not available for Educational or Enterprise accounts.
    '';
    };

    HSTSPolicyBypassList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      List of names that will bypass the HSTS policy check

Setting the policy specifies a list of hostnames that bypass preloaded HSTS upgrades from http to https.

Only single-label hostnames are allowed in this policy, and this policy only applies to "static" HSTS-preloaded entries (for instance, "app", "new", "search", "play"). This policy does not prevent HSTS upgrades for servers that have "dynamically" requested HSTS upgrades using a Strict-Transport-Security response header.

Supplied hostnames must be canonicalized: Any IDNs must be converted to their A-label format, and all ASCII letters must be lowercase. This policy only applies to the specific single-label hostnames specified, not to subdomains of those names.
    '';
    };

    HappyEyeballsV3Enabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use the Happy Eyeballs V3 algorithm

This feature enables the Happy Eyeballs V3 algorithm to make connection attempts. See https://datatracker.ietf.org/doc/draft-pauly-happy-happyeyeballs-v3 for details.

Setting the policy to Enabled means Google Chrome will use the Happy Eyeballs V3 algorithm for connection attempts.

Setting the policy to Disabled turns off the Happy Eyeballs V3 algorithm.

Not setting the policy, Google Chrome will turn on or off the Happy Eyeballs V3 algorithm based on chrome://flags/#happy-eyeballs-v3.

This policy supports dynamic refresh.

This policy is a temporary measure and will be removed in future versions of Google Chrome.
    '';
    };

    HardwareAccelerationModeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use graphics acceleration when available

Setting the policy to Enabled or leaving it unset turns on graphics acceleration, if available.

Setting the policy to Disabled turns off graphics acceleration.
    '';
    };

    HeadlessMode = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control use of the Headless Mode

Setting this policy to Enabled or leaving the policy unset allows use of the headless mode. Setting this policy to Disabled denies use of the headless mode.
* 1 = Allow use of the Headless Mode
* 2 = Do not allow use of the Headless Mode
    '';
    };

    HelpMeWriteSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for Help Me Write

Help Me Write is an AI-based writing assistant for short-form content on the web. Suggested content is based on prompts entered by the user and the content of the web page.

0 = Allow the feature to be used, while allowing Google to use relevant data to improve its AI models. Relevant data may include prompts, inputs, outputs, source materials, and written feedback, depending on the feature. It may also be reviewed by humans to improve AI models. 0 is the default value, except when noted below.

1 = Allow the feature to be used, but does not allow Google to improve models using users' content (including prompts, inputs, outputs, source materials, and written feedback). 1 is the default value for Enterprise users managed by Google Admin console and for Education accounts managed by Google Workspace.

2 = Do not allow the feature.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow Help Me Write and improve AI models.
* 1 = Allow Help Me Write without improving AI models.
* 2 = Do not allow Help Me Write.
    '';
    };

    HideWebStoreIcon = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Hide the web store from the New Tab Page and app launcher

Hide the Chrome Web Store app and footer link from the New Tab Page and Google ChromeOS app launcher.

When this policy is set to true, the icons are hidden.

When this policy is set to false or is not configured, the icons are visible.
    '';
    };

    HighEfficiencyModeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable High Efficiency Mode

This policy enables or disables the High Efficiency Mode setting. This setting makes it so that tabs are discarded after some period of time in the background to reclaim memory.
If this policy is unset, the end user can control this setting in chrome://settings/performance.
    '';
    };

    HistoryClustersVisible = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show a view of Chrome history with groups of pages

This policy controls the visibility of the Chrome history page organized into groups of pages.

If the policy is set to Enabled, a Chrome history page organized into groups will be visible at chrome://history/grouped.

If the policy is set to Disabled, a Chrome history page organized into groups will not be visible at chrome://history/grouped.

If the policy is left unset, a Chrome history page organized into groups will be visible at chrome://history/grouped by default.

Please note, if ComponentUpdatesEnabled policy is set to Disabled, but HistoryClustersVisible is set to Enabled or unset, a Chrome history page organized into groups will still be available at chrome://history/grouped, but may be less relevant to the user.
    '';
    };

    HistorySearchSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for AI-powered History Search

AI History Search is a feature that allows users to search their browsing history and receive generated answers based on page contents and not just the page title and URL.

0 = Allow the feature to be used, while allowing Google to use relevant data to improve its AI models. Relevant data may include prompts, inputs, outputs, source materials, and written feedback, depending on the feature. It may also be reviewed by humans to improve AI models. 0 is the default value, except when noted below.

1 = Allow the feature to be used, but does not allow Google to improve models using users' content (including prompts, inputs, outputs, source materials, and written feedback). 1 is the default value for Enterprise users managed by Google Admin console and for Education accounts managed by Google Workspace.

2 = Do not allow the feature.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow AI History Search and improve AI models.
* 1 = Allow AI History Search without improving AI models.
* 2 = Do not allow AI History Search.
    '';
    };

    HomepageIsNewTabPage = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use New Tab Page as homepage

Setting the policy to Enabled makes the New Tab page the user's homepage, ignoring any homepage URL location. Setting the policy to Disabled means that their homepage is never the New Tab page, unless the user's homepage URL is set to chrome://newtab.

If you set the policy, users can't change their homepage type in Google Chrome. If not set, the user decides whether or not the New Tab page is their homepage.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    HomepageLocation = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Configure the home page URL

Setting the policy sets the default homepage URL in Google Chrome. You open the homepage using the Home button. On desktop, the RestoreOnStartup policies control the pages that open on startup.

If the homepage is set to the New Tab Page, by the user or HomepageIsNewTabPage, this policy has no effect.

The URL needs a standard scheme, such as http://example.com or https://example.com. When this policy is set, users can't change their homepage URL in Google Chrome.

Leaving both HomepageLocation and HomepageIsNewTabPage unset lets users choose their homepage.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    HttpAllowlist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      HTTP Allowlist

Setting the policy specifies a list of hostnames or hostname patterns (such as
'[*.]example.com') that will not be upgraded to HTTPS and will not show an
error interstitial if HTTPS-First Mode is enabled. Organizations can use this
policy to maintain access to servers that do not support HTTPS, without
needing to disable HTTPS Upgrades and/or HTTPS-First Mode.

Supplied hostnames must be canonicalized: Any IDNs must be converted to their
A-label format, and all ASCII letters must be lowercase.

Blanket host wildcards (i.e., "*" or "[*]") are not allowed. Instead,
HTTPS-First Mode and HTTPS Upgrades should be explicitly disabled via their
specific policies.

Note: This policy does not apply to HSTS upgrades.
    '';
    };

    HttpsOnlyMode = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Allow HTTPS-Only Mode to be enabled

This policy controls whether users can enable HTTPS-Only Mode (Always Use Secure Connections) in Settings. HTTPS-Only Mode upgrades all navigations to HTTPS.

If this setting is not set or set to "allowed", users will be allowed to enable HTTPS-Only Mode.

If this setting is set to "disallowed", HTTPS-Only Mode will be disabled.

If this setting is set to "force_enabled", HTTPS-Only Mode will be enabled in Strict mode.

If this setting is set to "force_balanced_enabled", HTTPS-Only Mode will be enabled in Balanced mode.

"force_enabled" is supported from M112 onwards, "force_balanced_enabled" is supported from M129 onwards.

"force_enabled" and "force_balanced_enabled" can be recommended to users too.
HTTPS-Only Mode will be set Strict or Balanced initially but users are allowed to
change it.

If you set this policy to a value that is not supported by the version of Chrome that receives the policy, Chrome will default to the allowed setting.

The separate HttpAllowlist policy
can be used to exempt specific hostnames or hostname patterns from being
upgraded to HTTPS by this feature.
* "allowed" = Do not restrict users' HTTPS-Only Mode setting
* "disallowed" = Disable HTTPS-Only Mode
* "force_enabled" = Enable HTTPS-Only Mode in Strict mode
* "force_balanced_enabled" = Enable HTTPS-Only Mode in Balanced Mode
    '';
    };

    HttpsUpgradesEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable automatic HTTPS upgrades

Google Chrome attempts to upgrade some
navigations from HTTP to HTTPS, when possible. This policy can be used to
disable this behavior. If set to "true" or left unset, this feature will be
enabled by default.

The separate HttpAllowlist policy
can be used to exempt specific hostnames or hostname patterns from being
upgraded to HTTPS by this feature.

See also the HttpsOnlyMode policy.
    '';
    };

    IPv6ReachabilityOverrideEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable IPv6 reachability check override

Setting the policy to true overrides the IPv6 reachability check. This means that the
system will always query AAAA records when resolving host names. It applies to
all users and interfaces on the device.

Setting the policy to false or leaving it unset does not overrides the IPv6 reachability check.
The system only queries AAAA records when it is reachable to a global IPv6 host.
    '';
    };

    IdleDetectionAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow idle detection on these sites

Allows you to set a list of URL patterns that specify the sites that are allowed to use the Idle Detection API witout asking the user. Blocklist entries have higher priority than allowlist entries, which in turn have higher priority than the configured default value.

For detailed information on valid site url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed. This policy only matches based on origin, so any path in the URL pattern is ignored.

If this policy is not set, the global default value will be used for all sites, which is configured by the DefaultIdleDetectionSetting (Default idle detection setting) policy, if set, or by the user's personal configuration otherwise.
    '';
    };

    IdleDetectionBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block idle detection on these sites

Allows you to set a list of URL patterns that specify the sites that are not allowed to use the Idle Detection API.

For detailed information on valid site url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed. This policy only matches based on origin, so any path in the URL pattern is ignored.

If this policy is not set, the global default value will be used for all sites, which is configured by the DefaultIdleDetectionSetting (Default idle detection setting) policy, if set, or by the user's personal configuration otherwise.
    '';
    };

    IdleTimeout = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Delay before running idle actions

Triggers an action when the computer is idle.

If this policy is set, it specifies the length of time without user input (in minutes) before the browser runs actions configured via the IdleTimeoutActions policy.

If this policy is not set, no action will be ran.

The minimum threshold is 1 minute.

"User input" is defined by Operating System APIs, and includes things like moving the mouse or typing on the keyboard.
    '';
    };

    IdleTimeoutActions = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Actions to run when the computer is idle

List of actions to run when the timeout from the IdleTimeout policy is reached.

Warning: Setting this policy can impact and permanently remove local personal data. It is recommended to test your settings before deploying to prevent accidental deletion of personal data.

If the IdleTimeout policy is unset, this policy has no effect.

When the timeout from the IdleTimeout policy is reached, the browser runs the actions configured in this policy.

If this policy is empty or left unset, the IdleTimeout policy has no effect.

Supported actions are:

'close_browsers': close all browser windows and PWAs for this profile. Not supported on Android and iOS.

'close_tabs': close all open tabs in open windows. Only supported on iOS.

'show_profile_picker': show the Profile Picker window. Not supported on Android and iOS.

'sign_out': Signs out the current signed in user. Only supported on iOS.

'clear_browsing_history', 'clear_download_history', 'clear_cookies_and_other_site_data', 'clear_cached_images_and_files', 'clear_password_signing', 'clear_autofill', 'clear_site_settings', 'clear_hosted_app_data': clear the corresponding browsing data. See the ClearBrowsingDataOnExitList policy for more details. The types supported on iOS are 'clear_browsing_history', 'clear_cookies_and_other_site_data', 'clear_cached_images_and_files', 'clear_password_signing', and 'clear_autofill'

'reload_pages': reload all webpages. For some pages, the user may be prompted for confirmation first. Not supported on iOS.

The user will stay signed into their Google account when deleting cookies using 'clear_cookies_and_other_site_data'.

Setting 'clear_browsing_history', 'clear_password_signing', 'clear_autofill', and 'clear_site_settings' will disable sync for the respective data types if neither `Chrome Sync` is disabled by setting the SyncDisabled policy nor BrowserSignin is disabled.
* "close_browsers" = Close Browsers
* "show_profile_picker" = Show Profile Picker
* "clear_browsing_history" = Clear Browsing History
* "clear_download_history" = Clear Download History
* "clear_cookies_and_other_site_data" = Clear Cookies and Other Site Data
* "clear_cached_images_and_files" = Clear Cached Images and Files
* "clear_password_signin" = Clear Password Signin
* "clear_autofill" = Clear Autofill
* "clear_site_settings" = Clear Site Settings
* "clear_hosted_app_data" = Clear Hosted App Data
* "reload_pages" = Reload Pages
* "sign_out" = Sign Out
* "close_tabs" = Close Tabs
    '';
    };

    ImagesAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow images on these sites

Setting the policy lets you set a list of URL patterns that specify sites that may display images.

Leaving the policy unset means DefaultImagesSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.

Note that previously this policy was erroneously enabled on Android, but this functionality has never been fully supported on Android.
    '';
    };

    ImagesBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block images on these sites

Setting the policy lets you set a list of URL patterns that specify sites that can't display images.

Leaving the policy unset means DefaultImagesSetting applies for all sites, if it's set. If not, the user's personal setting applies.

 For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.

 Note that previously this policy was erroneously enabled on Android, but this functionality has never been fully supported on Android.
    '';
    };

    ImportAutofillFormData = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Import autofill form data from default browser on first run

Setting the policy to Enabled imports autofill form data from the previous default browser on first run. Setting the policy to Disabled or leaving it unset means no autofill form data is imported on first run.

Users can trigger an import dialog and the autofill form data checkbox will be checked or unchecked to match this policy's value.
    '';
    };

    ImportBookmarks = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Import bookmarks from default browser on first run

Setting the policy to Enabled imports bookmarks from the previous default browser on first run. Setting the policy to Disabled or leaving it unset means no bookmarks are imported on first run.

Users can trigger an import dialog and the bookmarks checkbox will be checked or unchecked to match this policy's value.
    '';
    };

    ImportHistory = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Import browsing history from default browser on first run

Setting the policy to Enabled imports browsing history from the previous default browser on first run. Setting the policy to Disabled or leaving it unset means no browsing history is imported on first run.

Users can trigger an import dialog and the browsing history checkbox will be checked or unchecked to match this policy's value.
    '';
    };

    ImportHomepage = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Import of homepage from default browser on first run

Setting the policy to Enabled imports the homepage from the previous default browser on first run. Setting the policy to Disabled or leaving it unset means the homepage isn't imported on first run.

Users can trigger an import dialog and the homepage checkbox will be checked or unchecked to match this policy's value.
    '';
    };

    ImportSavedPasswords = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Import saved passwords from default browser on first run

This policy controls only the first run import behavior after installation. It enables more seamless transition to Google Chrome in environments where a different browser was extensively used prior to installing the browser. This policy does not affect password manager capabilities for Google accounts.

Setting the policy to Enabled imports saved passwords from the previous default browser on first run and manual importing from the settings page is also possible.
Setting the policy to Disabled means no saved passwords are imported on first run and manual importing from the Settings page is blocked.
Leaving the policy unset means no saved passwords are imported on first run but the user can choose to do that from the settings page.
    '';
    };

    ImportSearchEngine = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Import search engines from default browser on first run

Setting the policy to Enabled imports the default search engine from the previous default browser on first run. Setting the policy to Disabled or leaving it unset means the default search engine isn't imported on first run.

Users can trigger an import dialog and the default search engine checkbox will be checked or unchecked to match this policy's value.
    '';
    };

    IncognitoModeAvailability = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Incognito mode availability

Specifies whether the user may open pages in Incognito mode in Google Chrome.

If 'Enabled' is selected or the policy is left unset, pages may be opened in Incognito mode.

If 'Disabled' is selected, pages may not be opened in Incognito mode.

If 'Forced' is selected, pages may be opened ONLY in Incognito mode. Note that 'Forced' does not work for Android-on-Chrome

The IncognitoModeUrlAllowlist policy takes precedence over this policy and can re-enable Incognito mode for specific URLs. When Incognito mode is disabled by this policy when an allowlist is provided, Incognito mode is available only for URLs matching the allowlist, while all other pages are blocked.

Note: On iOS, if the policy is changed during a session, it will only take effect on relaunch.
* 0 = Incognito mode available
* 1 = Incognito mode disabled
* 2 = Incognito mode forced
    '';
    };

    InsecureContentAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow insecure content on these sites

Allows you to set a list of url patterns that specify sites which are allowed to display blockable (i.e. active) mixed content (i.e. HTTP content on HTTPS sites) and for which optionally blockable mixed content upgrades will be disabled.

If this policy is left not set blockable mixed content will be blocked and optionally blockable mixed content will be upgraded, and users will be allowed to set exceptions to allow it for specific sites.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    InsecureContentBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block insecure content on these sites

Allows you to set a list of url patterns that specify sites which are not allowed to display blockable (i.e. active) mixed content (i.e. HTTP content on HTTPS sites), and for which optionally blockable (i.e. passive) mixed content will be upgraded.

If this policy is left not set blockable mixed content will be blocked and optionally blockable mixed content will be upgraded, but users will be allowed to set exceptions to allow it for specific sites.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    IntensiveWakeUpThrottlingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Control the IntensiveWakeUpThrottling feature.

When enabled the IntensiveWakeUpThrottling feature causes JavaScript timers in background tabs to be aggressively throttled and coalesced, running no more than once per minute after a page has been backgrounded for 5 minutes or more.

This is a web standards compliant feature, but it may break functionality
on some websites by causing certain actions to be delayed by up to a
minute. However, it results in significant CPU and battery savings when
enabled. See https://bit.ly/30b1XR4 for more details.

If this policy is set to enabled then the feature will be force enabled, and
users will not be able to override this.

If this policy is set to disabled then the feature will be force disabled, and
users will not be able to override this.

If this policy is left unset then the feature will be controlled by its
own internal logic, which can be manually configured by users.

Note that the policy is applied per renderer process, with the most recent
value of the policy setting in force when a renderer process starts. A full
restart is required to ensure that all loaded tabs receive a consistent
policy setting. It is harmless for processes to be running with different
values of this policy.
    '';
    };

    IntranetRedirectBehavior = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Intranet Redirection Behavior

This policy configures behavior for intranet redirection via DNS interception checks. The checks attempt to discover whether the browser is behind a proxy that redirects unknown host names.

If this policy is not set, the browser will use the default behavior of DNS interception checks and intranet redirect suggestions. In M88, they are enabled by default but will be disabled by default in the future release.

DNSInterceptionChecksEnabled is a related policy that may also disable DNS interception checks; this policy is a more flexible version which may separately control intranet redirection infobars and may be expanded in the future.
If either DNSInterceptionChecksEnabled or this policy requests to disable interception checks, the checks will be disabled.
* 0 = Use default browser behavior.
* 1 = Disable DNS interception checks and did-you-mean "http://intranetsite/" infobars.
* 2 = Disable DNS interception checks; allow did-you-mean "http://intranetsite/" infobars.
* 3 = Allow DNS interception checks and did-you-mean "http://intranetsite/" infobars.
    '';
    };

    IsolateOrigins = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Enable Site Isolation for specified origins

Setting the policy means each of the named origins in a comma-separated list runs in a dedicated process. Each named origin's process will only be allowed to contain documents from that origin and its subdomains. For example, specifying https://a1.example.com/ allows https://a2.a1.example.com/ in the same process, but not https://example.com or https://b.example.com.

Since Google Chrome 77, you can also specify a range of origins to isolate using a wildcard. For example, specifying https://[*.]corp.example.com will give every origin underneath https://corp.example.com its own dedicated process, including https://corp.example.com itself, https://a1.corp.example.com, and https://a2.a1.corp.example.com.

Note that all sites (i.e., scheme plus eTLD+1, such as https://example.com) are already isolated by default on Desktop platforms, as noted in the SitePerProcess policy. This IsolateOrigins policy is useful to isolate specific origins at a finer granularity (e.g., https://a.example.com).

Also note that origins isolated by this policy will be unable to script other origins in the same site, which is otherwise possible if two same-site documents modify their document.domain values to match. Administrators should confirm this uncommon behavior is not used on an origin before isolating it.

Setting the policy to off or leaving it unset lets users change this setting.

Note: For Android, use the IsolateOriginsAndroid policy instead.
    '';
    };

    JavaScriptAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow JavaScript on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can run JavaScript.

Leaving the policy unset means DefaultJavaScriptSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    JavaScriptBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block JavaScript on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can't run JavaScript.

Leaving the policy unset means DefaultJavaScriptSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.

Note that this policy blocks JavaScript based on whether the origin of the top-level document (usually the page URL that is also displayed in the address bar) matches any of the patterns. Therefore this policy is not appropriate for mitigating web supply-chain attacks. For example, supplying the pattern "https://[*.]foo.com/" will not prevent a page hosted on, say, https://example.com from running a script loaded from https://www.foo.com/example.js. Furthermore, supplying the pattern "https://example.com/" will not prevent a document from https://example.com from running scripts if it is not the top-level document, but embedded as a sub-frame into a page hosted on another origin, say, https://www.bar.com.
    '';
    };

    JavaScriptJitAllowedForSites = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow JavaScript to use JIT on these sites

Allows you to set a list of site url patterns that specify sites which are allowed to run JavaScript with JIT (Just In Time) compiler enabled.

For detailed information on valid site url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.

JavaScript JIT policy exceptions will only be enforced at a site granularity (eTLD+1). A policy set for only subdomain.site.com will not correctly apply to site.com or subdomain.site.com since they both resolve to the same eTLD+1 (site.com) for which there is no policy. In this case, policy must be set on site.com to apply correctly for both site.com and subdomain.site.com.

This policy applies on a frame-by-frame basis and not based on top level origin url alone, so e.g. if site-one.com is listed in the JavaScriptJitAllowedForSites policy but site-one.com loads a frame containing site-two.com then site-one.com will have JavaScript JIT enabled, but site-two.com will use the policy from DefaultJavaScriptJitSetting, if set, or default to JavaScript JIT enabled.

If this policy is not set for a site then the policy from DefaultJavaScriptJitSetting applies to the site, if set, otherwise Javascript JIT is enabled for the site.
    '';
    };

    JavaScriptJitBlockedForSites = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block JavaScript from using JIT on these sites

Allows you to set a list of site url patterns that specify sites which are not allowed to run JavaScript JIT (Just In Time) compiler enabled.

Disabling the JavaScript JIT will mean that Google Chrome may render web content more slowly, and may also disable parts of JavaScript including WebAssembly. Disabling the JavaScript JIT may allow Google Chrome to render web content in a more secure configuration.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.

JavaScript JIT policy exceptions will only be enforced at a site granularity (eTLD+1). A policy set for only subdomain.site.com will not correctly apply to site.com or subdomain.site.com since they both resolve to the same eTLD+1 (site.com) for which there is no policy. In this case, policy must be set on site.com to apply correctly for both site.com and subdomain.site.com.

This policy applies on a frame-by-frame basis and not based on top level origin url alone, so e.g. if site-one.com is listed in the JavaScriptJitBlockedForSites policy but site-one.com loads a frame containing site-two.com then site-one.com will have JavaScript JIT disabled, but site-two.com will use the policy from DefaultJavaScriptJitSetting, if set, or default to JavaScript JIT enabled.

If this policy is not set for a site then the policy from DefaultJavaScriptJitSetting applies to the site, if set, otherwise JavaScript JIT is enabled for the site.
    '';
    };

    JavaScriptOptimizerAllowedForSites = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow JavaScript optimization on these sites

Allows you to set a list of site url patterns that specify sites for which
advanced JavaScript optimizations are enabled.

For detailed information on valid site url patterns, please see
https://chromeenterprise.google/policies/url-patterns.
Wildcards, *, are allowed.

JavaScript optimization policy exceptions will only be enforced at a site
granularity (eTLD+1). A policy set for only subdomain.site.com will not
correctly apply to site.com or subdomain.site.com since they both resolve to
the same eTLD+1 (site.com) for which there is no policy. In this case, policy
must be set on site.com to apply correctly for both site.com and
subdomain.site.com.

This policy applies on a frame-by-frame basis and not based on top level
origin url alone, so e.g. if site-one.com is listed in the JavaScriptOptimizerAllowedForSites policy but site-one.com loads a frame   containing site-two.com then site-one.com will have JavaScript optimizations
enabled, but site-two.com will use the policy from DefaultJavaScriptOptimizerSetting, if set, or default to JavaScript
optimizations enabled. Blocklist entries have higher priority than allowlist
entries, which in turn have higher priority than the configured default value.

If this policy is not set for a site then the policy from DefaultJavaScriptOptimizerSetting applies to the site, if set, otherwise
Javascript optimization is enabled for the site.
    '';
    };

    JavaScriptOptimizerBlockedForSites = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block JavaScript optimizations on these sites

Allows you to set a list of site url patterns that specify sites for which
advanced JavaScript optimizations are disabled.

Disabling JavaScript optimizations will mean that Google Chrome may render web content more slowly.

For detailed information on valid url patterns, please see
https://chromeenterprise.google/policies/url-patterns.
Wildcards, *, are allowed.

JavaScript optimization policy exceptions will only be enforced at a site
granularity (eTLD+1). A policy set for only subdomain.site.com will not
correctly apply to site.com or subdomain.site.com since they both resolve to
the same eTLD+1 (site.com) for which there is no policy. In this case, policy
must be set on site.com to apply correctly for both site.com and
subdomain.site.com.

This policy applies on a frame-by-frame basis and not based on top level
origin url alone, so e.g. if site-one.com is listed in the JavaScriptOptimizerBlockedForSites policy but site-one.com loads a frame
containing site-two.com then site-one.com will have JavaScript optimizations
disabled, but site-two.com will use the policy from DefaultJavaScriptOptimizerSetting, if set, or default to JavaScript
optimizations enabled. Blocklist entries have higher priority than allowlist
entries, which in turn have higher priority than the configured default value.

If this policy is not set for a site then the policy from DefaultJavaScriptOptimizerSetting applies to the site, if set, otherwise
JavaScript optimization is enabled for the site.
    '';
    };

    LensDesktopNTPSearchEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Google Lens button to be shown in the search box on the New Tab page if supported.

Leaving the policy unset or setting it to Enabled allows users to view and use the Google Lens button in the search box on the New Tab page. Setting the policy to Disabled means users will not see the Google Lens button in the search box on the New Tab page.
Starting in Google Chrome 147, this policy will be deprecated. IT Admins can use SearchContentSharingSettings to control this feature going forward.
    '';
    };

    LensOverlaySettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Settings for the Lens Overlay feature

Lens Overlay lets users perform contextual Google searches either via a screenshot or by asking a question about the current page's contents. This feature requires the end user to opt-in.

This feature is available to all users with Google as their default search engine, unless it is disabled by this policy.

When policy is set to 0 - Allow or not set, the feature will be available to users.

When policy is set to 1 - Do not allow, the feature will not be available.

Starting in Google Chrome 140, if the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

Starting in Google Chrome 147, this policy will be deprecated. IT Admins can use SearchContentSharingSettings to control this feature going forward.
* 0 = Allow
* 1 = Do not allow
    '';
    };

    LensRegionSearchEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Google Lens region search menu item to be shown in context menu if supported.

Leaving the policy unset or setting it to Enabled allows users to view and use the Google Lens region search menu item in the context menu. Setting the policy to Disabled means users will not see the Google Lens region search menu item in the context menu when Google Lens region search is supported.
Starting in Google Chrome 147, this policy will be deprecated. IT Admins can use SearchContentSharingSettings to control this feature going forward.
    '';
    };

    LiveCaptionEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Live Caption

Enable the Live Caption feature.

If this policy is set to Enabled, Live Caption will always be turned on.

If this policy is set to Disabled, Live Caption will always be turned off.

If you set this policy as mandatory, users cannot change or override it.

If this policy is left unset, Live Caption is disabled initially but can be enabled by the user anytime.
    '';
    };

    LiveTranslateEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Live Translate

Enable translation of live captions. Captions will be sent to Google for translation.

If this policy is set to Enabled, Live Translate will always be turned on.

If this policy is set to Disabled, Live Translate will always be turned off.

If you set this policy as mandatory, users cannot change or override it.

If this policy is left unset, Live Translate is disabled initially but can be enabled by the user anytime.

In LiveCaptionEnabled is set to Disabled, Live Translate will be disabled regardless of this policy setting.
    '';
    };

    LocalFontsAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow Local Fonts permission on these sites

Sets a list of site url patterns that specify sites which will automatically grant the local fonts permission. This will extend the ability of sites to see information about local fonts.

For detailed information on valid site url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed. This policy only matches based on origin, so any path in the URL pattern is ignored.

If this policy is not set for a site then the policy from DefaultLocalFontsSetting applies to the site, if set, otherwise the permission will follow the browser's defaults and allow users to choose this permission per site.
    '';
    };

    LocalFontsBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block Local Fonts permission on these sites

Sets a list of site url patterns that specify sites which will automatically deny the local fonts permission. This will limit the ability of sites to see information about local fonts.

For detailed information on valid site url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed. This policy only matches based on origin, so any path in the URL pattern is ignored.

If this policy is not set for a site then the policy from DefaultLocalFontsSetting applies to the site, if set, otherwise the permission will follow the browser's defaults and allow users to choose this permission per site.
    '';
    };

    LocalNetworkAccessAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow sites to make network requests to local devices and local network endpoints.

List of URL patterns. Network requests initiated from websites served by matching origins are not subject to Local Network Access checks.

For origins not covered by the patterns specified here, the user's personal configuration will apply.

For detailed information on valid URL patterns, please see https://chromeenterprise.google/policies/url-patterns/.

See https://wicg.github.io/local-network-access/ for Local Network Access restrictions.

There are multiple policies listing origins that impact requests to local device and local network endpoints. If an origin is matched by more than one of the following policies, the policies take precedence in the following order:

- LocalNetworkBlockedForUrls
- LocalNetworkAllowedForUrls
- LoopbackNetworkAccessBlockedForUrls
- LoopbackNetworkAccessAllowedForUrls
- LocalNetworkAccessBlockedForUrls
- LocalNetworkAccessAllowedForUrls
    '';
    };

    LocalNetworkAccessBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block sites from making network requests to local devices and local network endpoints.

List of URL patterns. Network requests initiated from websites served by matching origins are blocked from issuing Local Network Access requests.

For origins not covered by the patterns specified here, the user's personal configuration will apply.

For detailed information on valid URL patterns, please see https://chromeenterprise.google/policies/url-patterns/.

See https://wicg.github.io/local-network-access/ for Local Network Access restrictions.

There are multiple policies listing origins that impact requests to local device and local network endpoints. If an origin is matched by more than one of the following policies, the policies take precedence in the following order:

- LocalNetworkBlockedForUrls
- LocalNetworkAllowedForUrls
- LoopbackNetworkAccessBlockedForUrls
- LoopbackNetworkAccessAllowedForUrls
- LocalNetworkAccessBlockedForUrls
- LocalNetworkAccessAllowedForUrls
    '';
    };

    LocalNetworkAccessIpAddressSpaceOverrides = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Override IP address space mappings

This can be used to treat certain internal address ranges as "public" and thus not subject to Local Network Access checks. Conversely, this can be used to treat certain public address ranges that might be used internally as "local" so that they are protected by Local Network Access checks.

IP address space overrides have two forms:

[cidr]=[public|local|loopback]

where [cidr] is a IP address range in CIDR notation (see section 3.1 of https://tools.ietf.org/html/rfc4632 for IPv4 and section 2.3 of https://tools.ietf.org/html/rfc4291 for IPv6). IPv6 addresses must be specified in URL-safe (bracketed) format. CIDR overrides apply to all ports.

or

[ip-address]:[port]=[public|local|loopback]

For more information on Local Network Access, see https://wicg.github.io/local-network-access/ and https://developer.chrome.com/blog/local-network-access.

This policy does not support dynamic refresh.

Overrides from the command-line switch --ip-address-space-overrides take precedence over overrides set by this policy.
    '';
    };

    LocalNetworkAccessPermissionsPolicyDefaultEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Local Network Access (LNA) requests in subframes without explicit delegation

By default, the permissions for Local Network Access (LNA) are only allowed to be requested in cross-origin subframes if they are explicitly delegated. This policy can be used to override this default behavior so that LNA permissions are default inherited into subframes, unless explicitly denied in permissions policy.

If this policy is set to enabled, then subframes are by default delegated all LNA permissions policy features and can make local network requests (triggering the permission prompt).

If this policy is set to disabled or not set, then subframes must be explicitly delegated the permissions policy feature in order make local network requests and trigger the permission prompt.

This policy applies to the permissions policy features "local-network-access", "loopback-network", and "local-network".

For more information on Local Network Access, see https://wicg.github.io/local-network-access/ and https://developer.chrome.com/blog/local-network-access.

For more information on permissions policy, see https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Permissions_Policy.
    '';
    };

    LocalNetworkAccessRestrictionsTemporaryOptOut = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Specifies whether to (temporarily) opt out of Local Network Access restrictions

When this policy is set to Enabled, Local Network Access
requests will only display warnings in Chrome DevTools due to Local Network Access checks failing.

When this policy is set to Disabled or unset, Local Network Access requests will use the
default handling of these requests.

See https://wicg.github.io/local-network-access/ for Local Network Access restrictions.

This enterprise policy is temporary, and will be removed after M152.

Long term, the policy LocalNetworkAccessAllowedForUrls
can be used to allowlist URL patterns that should be automatically granted
the Local Network Access permission.
    '';
    };

    LocalNetworkAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow sites to make network requests to local network endpoints.

List of URL patterns. Network requests initiated from websites served by matching origins to local network endpoints are not subject to Local Network Access checks.

For origins not covered by the patterns specified here, the user's personal configuration will apply.

For detailed information on valid URL patterns, please see https://chromeenterprise.google/policies/url-patterns/.

See https://wicg.github.io/local-network-access/ for Local Network Access restrictions.

There are multiple policies listing origins that impact requests to local network endpoints. If an origin is matched by more than one of the following policies, the policies take precedence in the following order:

- LocalNetworkBlockedForUrls
- LocalNetworkAllowedForUrls
- LocalNetworkAccessBlockedForUrls
- LocalNetworkAccessAllowedForUrls
    '';
    };

    LocalNetworkBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block sites from making network requests to local network endpoints.

List of URL patterns. Network requests initiated from websites served by matching origins to local network endpoints are blocked from issuing Local Network Access requests.

For origins not covered by the patterns specified here, the user's personal configuration will apply.

For detailed information on valid URL patterns, please see https://chromeenterprise.google/policies/url-patterns/.

See https://wicg.github.io/local-network-access/ for Local Network Access restrictions.

There are multiple policies listing origins that impact requests to local network endpoints. If an origin is matched by more than one of the following policies, the policies take precedence in the following order:

- LocalNetworkBlockedForUrls
- LocalNetworkAllowedForUrls
- LocalNetworkAccessBlockedForUrls
- LocalNetworkAccessAllowedForUrls
    '';
    };

    LookalikeWarningAllowlistDomains = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Suppress lookalike domain warnings on domains

This policy prevents the display of lookalike URL warnings on the sites listed. These warnings are typically shown on sites that Google Chrome believes might be trying to spoof another site the user is familiar with.

If the policy is enabled and set to one or more domains, no lookalike warnings pages will be shown when the user visits pages on that domain.

If the policy is not set, or set to an empty list, warnings may appear on any site the user visits.

A hostname can be allowed with a complete host match, or any domain match. For example, a URL like "https://foo.example.com/bar" may have warnings suppressed if this list includes either "foo.example.com" or "example.com".
    '';
    };

    LoopbackNetworkAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow sites to make network requests to the local device.

List of URL patterns. Network requests initiated from websites served by matching origins to the local device are not subject to Local Network Access checks.

For origins not covered by the patterns specified here, the user's personal configuration will apply.

For detailed information on valid URL patterns, please see https://chromeenterprise.google/policies/url-patterns/.

See https://wicg.github.io/local-network-access/ for Local Network Access restrictions.

There are multiple policies listing origins that impact requests to the local device. If an origin is matched by more than one of the following policies, the policies take precedence in the following order:

- LoopbackNetworkBlockedForUrls
- LoopbackNetworkAllowedForUrls
- LocalNetworkAccessBlockedForUrls
- LocalNetworkAccessAllowedForUrls
    '';
    };

    LoopbackNetworkBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block sites from making network requests to the local device.

List of URL patterns. Network requests initiated from websites served by matching origins to the local device are blocked from issuing Local Network Access requests.

For origins not covered by the patterns specified here, the user's personal configuration will apply.

For detailed information on valid URL patterns, please see https://chromeenterprise.google/policies/url-patterns/.

See https://wicg.github.io/local-network-access/ for Local Network Access restrictions.

There are multiple policies listing origins that impact requests to the local device. If an origin is matched by more than one of the following policies, the policies take precedence in the following order:

- LoopbackNetworkBlockedForUrls
- LoopbackNetworkAllowedForUrls
- LocalNetworkAccessBlockedForUrls
- LocalNetworkAccessAllowedForUrls
    '';
    };

    ManagedBookmarks = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Managed Bookmarks

Setting the policy sets up a list of bookmarks where each one is a dictionary with the keys "name" and "url". These keys hold the bookmark's name and target. Admins can set up a subfolder by defining a bookmark without a "url" key, but with an additional "children" key. This key also has a list of bookmarks, some of which can also be folders. Chrome amends incomplete URLs as if they were submitted through the address bar. For example, "google.com" becomes "https://google.com/".

Users can't change the folders the bookmarks are placed in (though they can hide it from the bookmark bar). The default folder name for managed bookmarks is "Managed bookmarks" but it can be changed by adding a new sub-dictionary to the policy with a single key named "toplevel_name" with the desired folder name as its value. Managed bookmarks are not synced to the user account and extensions can't modify them.

Schema:
{
  "items": {
    "id": "BookmarkType", 
    "properties": {
      "children": {
        "items": {
          "$ref": "BookmarkType"
        }, 
        "type": "array"
      }, 
      "name": {
        "type": "string"
      }, 
      "toplevel_name": {
        "type": "string"
      }, 
      "url": {
        "type": "string"
      }
    }, 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    ManagedConfigurationPerOrigin = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Sets managed configuration values to websites to specific origins

Setting the policy defines the return value of Managed Configuration API for given origin.

 Managed configuration API is a key-value configuration that can be accessed via navigator.managed.getManagedConfiguration() javascript call. This API is only available to origins which correspond to force-installed web applications via WebAppInstallForceList.

Schema:
{
  "items": {
    "properties": {
      "managed_configuration_hash": {
        "type": "string"
      }, 
      "managed_configuration_url": {
        "type": "string"
      }, 
      "origin": {
        "type": "string"
      }
    }, 
    "required": [
      "origin", 
      "managed_configuration_url", 
      "managed_configuration_hash"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    MaxConnectionsPerProxy = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Maximal number of concurrent connections to the proxy server

Setting the policy specifies the maximal number of simultaneous connections to the proxy server. Some proxy servers can't handle a high number of concurrent connections per client, which is solved by setting this policy to a lower value. The value should be lower than 100 and higher than 6. Some web apps are known to consume many connections with hanging GETs, so setting a value below 32 may lead to browser networking hangs if there are too many web apps with hanging connections open. Lower below the default at your own risk.

Leaving the policy unset means a default of 32 is used.
    '';
    };

    MaxInvalidationFetchDelay = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Maximum fetch delay after a policy invalidation

Setting the policy specifies the maximum delay in milliseconds between receiving a policy invalidation and fetching the new policy from the device management service. Valid values range from 1,000 (1 second) to 300,000 (5 minutes). Values outside this range will be clamped to the respective boundary.

Leaving the policy unset means Google Chrome uses the default value of 10 seconds.
    '';
    };

    MediaRecommendationsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Media Recommendations

By default the browser will show media recommendations that are personalized to the user. Setting this policy to Disabled will result in these recommendations being hidden from the user. Setting this policy to Enabled or leaving it unset will result in the media recommendations being shown to the user.
    '';
    };

    MediaRouterCastAllowAllIPs = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Google Cast to connect to Cast devices on all IP addresses.

Unless EnableMediaRouter is set to Disabled, setting MediaRouterCastAllowAllIPs to Enabled connects Google Cast to Cast devices on all IP addresses, not just RFC1918/RFC4193 private addresses.

Setting the policy to Disabled connects Google Cast to Cast devices only on RFC1918/RFC4193.

Leaving the policy unset connects Google Cast to Cast devices only on RFC1918/RFC4193, unless the CastAllowAllIPs feature is turned on.
    '';
    };

    MemorySaverModeSavings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Change Memory Saver Mode Savings

This policy changes the savings level of Memory Saver.

This only takes effect when Memory Saver is enabled through settings or through the HighEfficiencyModeEnabled policy, and will affect how heuristics are used to determine when to discard tabs. For example, reducing the lifetime of an inactive tab before discarding it can save memory, but it also means that tabs will be reloaded more frequently which can lead to bad user experience and cost more network traffic.

Setting the policy to 0 - Memory Saver will get moderate memory savings. Tabs become inactive after a longer period of time

Setting the policy to 1 - Memory Saver will get balanced memory savings. Tabs become inactive after an optimal period of time.

Setting the policy to 2 - Memory Saver will get maximum memory savings. Tabs become inactive after a shorter period of time.

If this policy is unset, the end user can control this setting in chrome://settings/performance.
* 0 = Moderate memory savings.
* 1 = Balanced memory savings.
* 2 = Maximum memory savings.
    '';
    };

    MetricsReportingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable reporting of usage and crash-related data

When this policy is Enabled, anonymous reporting of usage and crash-related data about Google Chrome to Google is recommended to be enabled by default. Users will still be able to change this setting.

When this policy is Disabled, anonymous reporting is disabled and no usage or crash data is sent to Google. Users won't be able to change this setting.

When this policy is not set, users can choose the anonymous reporting behavior at installation or first run, and can change this setting later.

(For Google ChromeOS, see DeviceMetricsReportingEnabled.)

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    NTPCardsVisible = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show cards on the New Tab Page

This policy controls the visibility of cards on the New Tab Page. Cards surface entry points to launch common user journeys based on the user's browsing behavior.

If the policy is set to Enabled, the New Tab Page will show cards if content is available.

If the policy is set to Disabled, the New Tab Page won't show cards.

If the policy is not set, the user can control the card visibility. The default is visible.
    '';
    };

    NTPCustomBackgroundEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow users to customize the background on the New Tab page

If the policy is set to false, the New Tab page won't allow users to customize the background. Any existing custom background will be permanently removed even if the policy is set to true later.

If the policy is set to true or unset, users can customize the background on the New Tab page.
    '';
    };

    NTPFooterExtensionAttributionEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Control the visibility of the extension attribution on the New Tab page

This policy determines whether an attribution to the extension modifying the New Tab Page (NTP) is displayed in the NTP's footer.

By default, if an extension has overridden the standard NTP, a message attributing this change to the specific extension will appear in the footer. This attribution typically includes a link to the relevant extension in the Chrome Web Store.

If this policy is left unset or set to true, the extension attribution will be visible on the NTP footer when an extension is controlling the NTP.

If this policy is set to false, the attribution to the extension in the NTP footer will be suppressed.
    '';
    };

    NTPFooterManagementNoticeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Control the visibility of the management notice on the New Tab Page for managed browsers

This policy controls the visibility of the management notice within the footer of the New Tab Page (NTP). By default, the NTP footer displays information when the browser is managed by an organization (indicated by a building icon and "Managed by [domain name]"). This can be customized using the EnterpriseCustomLabelForBrowser and EnterpriseLogoUrlForBrowser policies.

If this policy is left unset or set to true, managed browsers will display a “Managed by…” notice with an icon.

If this policy is set to false, the management notice will be hidden.

Note that this policy is only applied for managed browsers, so it will have no effect for managed users on unmanaged browsers.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    NTPMiddleSlotAnnouncementVisible = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show the middle slot announcement on the New Tab Page

This policy controls the visibility of the middle slot announcement on the New Tab Page.

If the policy is set to Enabled, the New Tab Page will show the middle slot announcement if it is available.

If the policy is set to Disabled, the New Tab Page will not show the middle slot announcement even if it is available.
    '';
    };

    NTPOutlookCardVisible = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show Outlook Calendar card on the New Tab Page

This policy controls the visibility of the Outlook Card on the New Tab Page. The card will only be displayed on the New Tab Page if the policy is enabled and your organization authorized the usage of the Outlook Calendar data in the browser.

Outlook data will not be stored by the browser.

The Outlook card shows the next calendar event, along with a glanceable look at the rest of the day's meetings. It aims to address the issue of context switching and enhance productivity by giving users a shortcut to their next meeting.

The Microsoft Outlook card will require additional admin configuration. For detailed information on connecting the Chrome New Tab Page Card to Outlook, please see https://support.google.com/chrome/a?p=chrome_ntp_microsoft_cards.

If the NTPCardsVisible is disabled, the Outlook Card will not be shown. If NTPCardsVisible is enabled, the Outlook card will be shown if this policy is also enabled and there is data to be shown. If NTPCardsVisible is unset, the Outlook card will be shown if this policy is also enabled, the user has the card enabled in Customize Chrome, and there is data to be shown.
    '';
    };

    NTPSharepointCardVisible = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show SharePoint and OneDrive File Card on the New Tab Page

This policy controls the visibility of the SharePoint and OneDrive File Card on the New Tab Page. The card will only be displayed on the New Tab Page if the policy is enabled and your organization authorized the usage of the SharePoint and OneDrive File data in the browser.

SharePoint and OneDrive data will not be stored by the browser.

The SharePoint and OneDrive Files recommendation card shows a list of recommended files.  It aims to address the issue of context switching and enhance productivity by giving users a shortcut to their most important documents.

The Microsoft SharePoint and OneDrive card will require additional admin configuration. For detailed information on connecting the Chrome New Tab Page Card to Sharepoint, please see https://support.google.com/chrome/a?p=chrome_ntp_microsoft_cards.

If the NTPCardsVisible is disabled, the SharePoint and OneDrive Card will not be shown. If NTPCardsVisible is enabled, the SharePoint and OneDrive card will be shown if this policy is also enabled and there is data to be shown. If NTPCardsVisible is unset, the SharePoint and OneDrive card will be shown if this policy is also enabled, the user has the card enabled in Customize Chrome, and there is data to be shown.
    '';
    };

    NTPShortcuts = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Setting shortcuts on the New Tab Page

Setting the policy pre-configures up to 10 custom shortcuts on the Google Chrome New Tab page.

If set, users will see these shortcuts by default, in addition to their personal shortcuts. Users can control visibility of their organization's shortcuts on the "Customize Chrome" panel.

Shortcut URLs must be unique.

If allow_user_edit is set to true, users can change the name of the shortcut. If set to false or unset, users cannot edit the name.

If allow_user_delete is set to true, users can remove the shortcut. If set to false or unset, users cannot remove the shortcut.

Schema:
{
  "items": {
    "properties": {
      "allow_user_delete": {
        "type": "boolean"
      }, 
      "allow_user_edit": {
        "type": "boolean"
      }, 
      "name": {
        "type": "string"
      }, 
      "url": {
        "type": "string"
      }
    }, 
    "required": [
      "name", 
      "url"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    NativeMessagingAllowlist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure native messaging allowlist

Setting the policy specifies which native messaging hosts aren't subject to the deny list. A deny list value of * means all native messaging hosts are denied, unless they're explicitly allowed.

All native messaging hosts are allowed by default. But, if all native messaging hosts are denied by policy, the admin can use the allow list to change that policy.
    '';
    };

    NativeMessagingBlocklist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure native messaging blocklist

Setting the policy specifies which native messaging hosts shouldn't be loaded. A deny list value of * means all native messaging hosts are denied, unless they're explicitly allowed.

Leaving the policy unset means Google Chrome loads all installed native messaging hosts.
    '';
    };

    NativeMessagingUserLevelHosts = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow user-level Native Messaging hosts (installed without admin permissions)

Setting the policy to Enabled or leaving it unset means Google Chrome can use native messaging hosts installed at the user level.

Setting the policy to Disabled means Google Chrome can only use these hosts if installed at the system level.
    '';
    };

    NetworkPredictionOptions = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Enable network prediction

This policy controls network prediction in Google Chrome. It controls DNS prefetching, TCP, and SSL preconnection and prerendering of webpages.

If you set the policy, users can't change it. Leaving it unset turns on network prediction, but the user can change it.
* 0 = Predict network actions on any network connection
* 1 = Predict network actions on any network that is not cellular.
(Deprecated in 50, removed in 52. After 52, if value 1 is set, it will be treated as 0 - predict network actions on any network connection.)
* 2 = Do not predict network actions on any network connection
    '';
    };

    NetworkServiceSandboxEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable the network service sandbox

This policy controls whether or not the network service process runs sandboxed.
If this policy is enabled, the network service process will run sandboxed.
If this policy is disabled, the network service process will run unsandboxed. This leaves users open to additional security risks related to running the network service unsandboxed.
If this policy is not set, the default configuration for the network sandbox will be used. This may vary depending on Google Chrome release, currently running field trials, and platform.
This policy is intended to give enterprises flexibility to disable the network sandbox if they use third party software that interferes with the network service sandbox.
    '';
    };

    NewTabPageLocation = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Configure the New Tab page URL

Setting the policy configures the default New Tab page URL and prevents users from changing it.

The New Tab page opens with new tabs and windows.

This policy doesn't decide which pages open on start up. Those are controlled by the RestoreOnStartup policies. This policy does affect the homepage, if that's set to open the New Tab page, as well as the startup page if it's set to open the New Tab page.

It is a best practice to provide fully canonicalized URL, if the URL is not fully canonicalized Google Chrome will default to https://.

Leaving the policy unset or empty puts the default New Tab page in use.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    NotificationsAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow notifications on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can display notifications.

Leaving the policy unset means DefaultNotificationsSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    NotificationsBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block notifications on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can't display notifications.

Leaving the policy unset means DefaultNotificationsSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    NtlmV2Enabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable NTLMv2 authentication.

Setting the policy to Enabled or leaving it unset turns NTLMv2 on.

Setting the policy to Disabled turns NTLMv2 off.

All recent versions of Samba and Microsoft® Windows® servers support NTLMv2. This should only be turned off for backward compatibility as it reduces the security of authentication.
    '';
    };

    OopPrintDriversAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Out-of-process print drivers allowed

Controls if Google Chrome interacts with printer drivers from a separate service process. Platform printing calls to query available printers, get print driver settings, and submit documents for printing to local printers are made from a service process. Moving such calls out of the browser process helps improve stability and reduce frozen UI behavior in Print Preview.

When this policy is set to Enabled or not set, Google Chrome will use a separate service process for platform printing tasks.

When this policy is set to Disabled, Google Chrome will use the browser process for platform printing tasks.

This policy will be removed in the future, after the out-of-process print drivers feature has fully rolled out.
    '';
    };

    OriginAgentClusterDefaultEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allows origin-keyed agent clustering by default.

This policy allows origin-keyed agent clustering by default.

The Origin-Agent-Cluster HTTP header controls whether a document is
isolated in an origin-keyed agent cluster, or in a site-keyed agent
cluster. This has security implications since an origin-keyed agent
cluster allows isolating documents by origin. The developer-visible
consequence of this is that the document.domain accessor can no longer
be set.

The default behaviour - when no Origin-Agent-Cluster header has been set -
changes in M111 from site-keyed to origin-keyed.

If this policy is enabled or not set, the browser will follow this
new default from that version on.

If this policy is disabled this change is reversed and
documents without Origin-Agent-Cluster headers will be assigned to
site-keyed agent clusters. As a consequence, the document.domain accessor
remains settable by default. This matches the legacy behaviour.

See https://developer.chrome.com/blog/immutable-document-domain/ for
additional details.
    '';
    };

    OriginKeyedProcessesEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable origin-keyed process isolation by default.

Enables origin-keyed process isolation for most pages (i.e., those assigned to an origin-keyed agent cluster by default). This improves security but also increases the number of processes created. Users are allowed to override the set policy value via the command-line flags or chrome://flags (both to turn this feature on or off).

Setting the policy to Enabled results in most origins being isolated, even from other origins in the same site. See also the IsolateOrigins and SitePerProcess policies.

Setting the policy to Disabled results in no origins being isolated from the rest of their site unless an origin explicitly asks to.

Not setting the policy results in the browser determining which origins to isolate and when to isolate them.
    '';
    };

    OutOfProcessSystemDnsResolutionEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable system DNS resolution outside of the network service

Setting this policy to true causes system DNS resolution (getaddrinfo()) to possibly run outside of the network process, depending on system configuration and feature flags.

Setting this policy to false causes system DNS resolution (getaddrinfo()) to run in the network process rather than the browser process. This may force the network service sandbox to be disabled, degrading the security of Google Chrome.

If this policy is not set, system DNS resolution may run in the network service, outside of the network service, or partially inside and partially outside, depending on system configuration and feature flags.
    '';
    };

    OverrideSecurityRestrictionsOnInsecureOrigin = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Origins or hostname patterns for which restrictions on insecure origins should not apply

Setting the policy specifies a list of origins (URLs) or hostname patterns (such as *.example.com) for which security restrictions on insecure origins won't apply. Patterns are only accepted for hostnames; URLs/origins with schemes must be exact strings. Organizations can specify origins for legacy applications that can't deploy TLS or set up a staging server for internal web development, so developers can test out features requiring secure contexts without having to deploy TLS on the staging server. This policy also prevents the origin from being labeled "Not Secure" in the address bar.

Setting a list of URLs in this policy amounts to setting the command-line flag --unsafely-treat-insecure-origin-as-secure to a comma-separated list of the same URLs. The policy overrides the command-line flag and UnsafelyTreatInsecureOriginAsSecure, if present.

For more information on secure contexts, see Secure Contexts ( https://www.w3.org/TR/secure-contexts ).
    '';
    };

    PartitionedBlobUrlUsage = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Choose whether Blob URLs are partitioned during fetching and navigations

This policy controls whether Blob URLs are partitioned during fetching and navigation.
If this policy is set to Enabled or not set, Blob URLs will be partitioned.
If this policy is set to Disabled, Blob URLs won't be partitioned.

If you must use the policy, please file a bug at
Google Chrome
explaining your use case. The policy is scheduled to be offered through
Google Chrome version 146, after which
the old implementation will be removed.

NOTE: Only newly-started renderer processes will reflect changes to this
policy while the browser is running.

For detailed information on third-party storage partitioning, please see
https://developers.google.com/privacy-sandbox/cookies/storage-partitioning.
    '';
    };

    PasswordDismissCompromisedAlertEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable dismissing compromised password alerts for entered credentials

Setting the policy to Enabled or leaving it unset gives the user the option to dismiss/restore compromised password alerts.

If you disable this setting, users will not be able to dismiss alerts about compromised passwords. If enabled, users will be able to dismiss alerts about compromised passwords.
    '';
    };

    PasswordLeakDetectionEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable leak detection for entered credentials

Setting the policy to Enabled lets users have Google Chrome check whether usernames and passwords entered were part of a leak.

Setting the policy to Disabled does not let users have this functionality.

If the policy is set, users can't change it in Google Chrome. If not set, credential leak checking is allowed, but the user can turn it off.
    '';
    };

    PasswordManagerBlocklist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure the list of domains for which the Password Manager (Save and Fill) will be disabled

Configure the list of domains where Google Chrome should disable the Password Manager. This means that Save and Fill workflows will be disabled, ensuring that passwords for those websites can't be saved or auto filled into web forms.

If a domain is present in the list, the Password Manager will be disabled for it.

If a domain is not present in the list, the Password Manager will be available for it.

If the policy is unset, the Password Manager will be available for all domains.

For detailed information on valid URL patterns, please see https://support.google.com/chrome/a?p=url_blocklist_filter_format.
    '';
    };

    PasswordManagerEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable saving passwords to the password manager

This policy controls the browser's ability to automatically remember passwords on websites and save them in the built-in password manager. It does not limit access or change the contents of passwords saved in the password manager and possibly synchronized to the Google account profile and Android.

Setting the policy to Enabled means users have Google Chrome remember passwords and provide them the next time they sign in to a site.

Setting the policy to Disabled means users can't save new passwords, but previously saved passwords will still work.

If the policy is set, users can't change it in Google Chrome. If not set, the user can turn off password saving.
    '';
    };

    PasswordManagerPasskeysEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable saving passkeys to the password manager

This policy controls the browser's ability to save passkeys in the built-in password manager. It does not limit access to, or change the contents of, passkeys already saved in the password manager. If the PasswordManagerEnabled policy is set to Disabled then saving in the built-in password manager is disabled in general, including passkeys and passwords, and thus this policy is not applicable.

Setting the policy to Enabled or leaving unset means that users can save passkeys in the built-in password manager if signed into Google Chrome.

Setting the policy to Disabled means users can't save passkeys to the built-in password manager, but previously saved passkeys will still work.
    '';
    };

    PasswordProtectionChangePasswordURL = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Configure the change password URL.

Setting the policy sets the URL for users to change their password after seeing a warning in the browser. The password protection service sends users to the URL (HTTP and HTTPS protocols only) you designate through this policy. For Google Chrome to correctly capture the salted hash of the new password on this change password page, make sure your change password page follows these guidelines ( https://www.chromium.org/developers/design-documents/create-amazing-password-forms ).

Turning the policy off or leaving it unset means the service sends users to https://myaccount.google.com to change their password.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    PasswordProtectionLoginURLs = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure the list of enterprise login URLs where password protection service should capture salted hashes of passwords.

Setting the policy sets the list of enterprise login URLs (HTTP and HTTPS protocols only). Password protection service will capture salted hashes of passwords on these URLs and use them for password reuse detection. For Google Chrome to correctly capture password salted hashes, ensure your sign-in pages follow these guidelines ( https://www.chromium.org/developers/design-documents/create-amazing-password-forms ).

Turning this setting off or leaving it unset means the password protection service only captures the password salted hashes on https://accounts.google.com.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    PasswordProtectionWarningTrigger = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Password protection warning trigger

Setting the policy lets you control the triggering of password protection warning. Password protection alerts users when they reuse their protected password on potentially suspicious sites.

Use PasswordProtectionLoginURLs and PasswordProtectionChangePasswordURL to set which password to protect.

If this policy is set to:

* PasswordProtectionWarningOff, no password protection warning will be shown.

* PasswordProtectionWarningOnPasswordReuse, password protection warning will be shown when the user reuses their protected password on a non-allowed site.

* PasswordProtectionWarningOnPhishingReuse, password protection warning will be shown when the user reuses their protected password on a phishing site.

Leaving the policy unset has the password protection service only protect Google passwords, but users can change this setting.
* 0 = Password protection warning is off
* 1 = Password protection warning is triggered by password reuse
* 2 = Password protection warning is triggered by password reuse on phishing page
    '';
    };

    PasswordSharingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable sharing user credentials with other users

Setting the policy to Enabled lets users send to and receive from family members (according to Family Service) their passwords.
When the policy is Enabled or not set, there is a button in the Password Manager allowing to send a password.
The received passwords are stored into user's account and are available in the Password Manager.

Setting the policy to Disabled means users can't send passwords from Password Manager to other users, and can't receive passwords from other users.

The feature is not available if synchronization of Passwords is turned off (either via user settings or SyncDisabled policy is Enabled).

Managed accounts aren't eligible to join or create a family group and therefore cannot share passwords.
    '';
    };

    PaymentMethodQueryEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow websites to query for available payment methods.

Allows you to set whether websites are allowed to check if the user has payment methods saved.

If this policy is set to disabled, websites that use PaymentRequest.canMakePayment or PaymentRequest.hasEnrolledInstrument API will be informed that no payment methods are available.

If the setting is enabled or not set then websites are allowed to check if the user has payment methods saved.
    '';
    };

    PdfAnnotationsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable PDF Annotations

Controls if the PDF viewer in Google Chrome can annotate PDFs.

When this policy is not set, or is set to true, then the PDF viewer will be able to annotate PDFs.

When this policy is set to false, then the PDF viewer will not be able to annotate PDFs.
    '';
    };

    PdfLocalFileAccessAllowedForDomains = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow local file access to file:// URLs on these sites in the PDF Viewer

Setting this policy allows the domains listed to access file:// URLs in the PDF Viewer.
Adding to the policy allows the domain to access file:// URLs in the PDF Viewer.
Removing from the policy disallows the domain from accessing file:// URLs in the PDF Viewer.
Leaving the policy unset disallows all domains from accessing file:// URLs in the PDF Viewer.
    '';
    };

    PdfUseSkiaRendererEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use Skia renderer for PDF rendering

Controls whether the PDF viewer in Google Chrome uses Skia renderer.

When this policy is enabled, the PDF viewer uses Skia renderer.

When this policy is disabled, the PDF viewer uses its current AGG renderer.

When this policy is not set, the PDF renderer will be chosen by the browser.
    '';
    };

    PdfViewerOutOfProcessIframeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use out-of-process iframe PDF Viewer

Controls whether the PDF viewer in Google Chrome uses an out-of-process iframe (OOPIF). This will be the new PDF viewer architecture in the future, as it is simpler and makes adding new features easier. The existing GuestView PDF viewer is an outdated, complex architecture that is being deprecated.

When this policy is set to Enabled or not set, Google Chrome will be able to use the OOPIF PDF viewer architecture. Once Enabled or not set, the default behavior will be decided by Google Chrome.

When this policy is set to Disabled, Google Chrome will strictly use the existing GuestView PDF viewer. It embeds a web page with a separate frame tree into another web page.

This policy will be removed in the future, after the OOPIF PDF viewer feature has fully rolled out.
    '';
    };

    PolicyAtomicGroupsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enables the concept of policy atomic groups

Setting the policy to Enabled means policies coming from an atomic group that don't share the source with the highest priority from that group get ignored.

Setting the policy to Disabled means no policy is ignored because of its source. Policies are ignored only if there's a conflict, and the policy doesn't have the highest priority.

If this policy is set from a cloud source, it can't target a specific user.
    '';
    };

    PolicyDictionaryMultipleSourceMergeList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow merging dictionary policies from different sources

Setting the policy allows merging of selected policies when they come from different sources, with the same scopes and level. This merging is in the first level keys of the dictionary from each source. The key coming from the highest priority source takes precedence.

Use the wildcard character '*' to allow merging of all supported dictionary policies.

If a policy is in the list and there's conflict between sources with:

* The same scopes and level: The values merge into a new policy dictionary.

* Different scopes or level: The policy with the highest priority applies.

If a policy isn't in the list and there's conflict between sources, scopes, or level, the policy with the highest priority applies.
* "ContentPackManualBehaviorURLs" = Managed user manual exception URLs
* "DeviceLoginScreenPowerManagement" = Power management on the login screen
* "ExtensionSettings" = Extension management settings
* "KeyPermissions" = Key Permissions
* "PowerManagementIdleSettings" = Power management settings when the user becomes idle
* "ScreenBrightnessPercent" = Screen brightness percent
* "ScreenLockDelays" = Screen lock delays
    '';
    };

    PolicyListMultipleSourceMergeList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow merging list policies from different sources

Setting the policy allows merging of selected policies when they come from different sources, with the same scopes and level.

Use the wildcard character '*' to allow merging of all list policies.

If a policy is in the list and there's conflict between sources with:

* The same scopes and level: The values merge into a new policy list.

* Different scopes or level: The policy with the highest priority applies.

If a policy isn't in the list and there's conflict between sources, scopes, or level, the policy with the highest priority applies.
    '';
    };

    PolicyRefreshRate = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Refresh rate for user policy

Setting the policy specifies the period in milliseconds at which the device management service is queried for user policy information. Valid values range from 1,800,000 (30 minutes) to 86,400,000 (1 day). Values outside this range will be clamped to the respective boundary.

Leaving the policy unset uses the default value of 3 hours.

Note: Policy notifications force a refresh when the policy changes, making frequent refreshes unnecessary. So, if the platform supports these notifications, the refresh delay is 24 hours (ignoring defaults and the value of this policy).
    '';
    };

    PopupsAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow pop-ups on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can open pop-ups.

Leaving the policy unset means DefaultPopupsSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    PopupsBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block pop-ups on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can't open pop-ups.

Leaving the policy unset means DefaultPopupsSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    PostQuantumKeyAgreementEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable post-quantum key agreement for TLS

This policy configures whether Google Chrome will offer a post-quantum key agreement algorithm in TLS, using the ML-KEM NIST standard. Prior to Google Chrome 131, the algorithm was Kyber, an earlier draft iteration of the standard. This allows supporting servers to protect user traffic from being later decrypted by quantum computers.

If this policy is Enabled or not set, Google Chrome will offer a post-quantum key agreement in TLS connections. User traffic will then be protected from quantum computers when communicating with compatible servers.

If this policy is Disabled, Google Chrome will not offer a post-quantum key agreement in TLS connections. User traffic will then be unprotected from quantum computers.

Offering a post-quantum key agreement is backwards-compatible. Existing TLS servers and networking middleware are expected to ignore the new option and continue selecting previous options.

However, devices that do not correctly implement TLS may malfunction when offered the new option. For example, they may disconnect in response to unrecognized options or the resulting larger messages. Such devices are not post-quantum-ready and will interfere with an enterprise's post-quantum transition. If encountered, administrators should contact the vendor for a fix.

This policy is a temporary measure and will be removed sometime after Google Chrome version 145. It may be Enabled to allow you to test for issues, and may be Disabled while issues are being resolved.
    '';
    };

    PreciseGeolocationAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow precise geolocation on these sites

Setting the policy lets you set a list of URL patterns that specify sites that are allowed to access the user's high accuracy geolocation without first having to request the user's permission to do so.

Leaving the policy unset means DefaultGeolocationSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    PreferSlowCiphers = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Prefer specific encryption cipher algorithms for TLS

This policy configures Google Chrome to order its preferred encryption ciphers in TLS 1.3 to reflect a preference for algorithms that have been approved by a specific compliance regime.

Setting this policy does not guarantee that any specific algorithms will be negotiated.

This policy exists to allow server operators who wish to support clients with and without compliance requirements to differentiate between those clients, and only use certain non-default algorithms with increased cryptographic strength for those explicitly configured to prefer them.

Setting the policy to 'cnsa' configures Google Chrome to prefer ciphers required for compliance with the Commercial National Security Algorithm Suite versions 1.0 and 2.0 (CNSA 1.0 and 2.0).

Not setting the policy, or setting it to 'default', configures Google Chrome to use its default ciphers.

Setting this policy is not required for security. The default cryptography used by Google Chrome is strong enough to withstand a brute force attack using the entire power of the Sun.

Setting this policy will cause Google Chrome to be slower when accessing websites.

This policy only affects TLS 1.3 and QUIC; it does not affect earlier versions of TLS.
* "cnsa" = Prefer ciphers satisfying the requirements of CNSA 1.0 and 2.0
* "default" = Use Google Chrome's default cipher order
    '';
    };

    PreferSlowKexAlgorithms = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Prefer specific key exchange algorithms for TLS

This policy configures Google Chrome to order its preferred key agreement algorithms (supported groups) in TLS 1.3 to reflect a preference for algorithms that have been approved by a specific compliance regime.

Setting this policy does not guarantee that any specific algorithms will be negotiated.

This policy exists to allow server operators who wish to support clients with and without compliance requirements to differentiate between those clients, and only use certain non-default algorithms with increased cryptographic strength for those explicitly configured to prefer them.

Setting the policy to 'cnsa2' configures Google Chrome to prefer key exchange methods required for compliance with the Commercial National Security Algorithm Suite 2.0 (CNSA 2.0).

Not setting the policy, or setting it to 'default', configures Google Chrome to use its default key exchange methods.

If this policy is set to a value that would configure Google Chrome to prefer a post-quantum key agreement algorithm but PostQuantumKeyAgreementEnabled is Disabled, the setting of PostQuantumKeyAgreementEnabled takes precedence.

Setting this policy is not required for security. The default cryptography used by Google Chrome is strong enough to withstand a brute force attack using the entire power of the Sun.

Setting this policy will cause Google Chrome to be slower when accessing websites.

This policy only affects TLS 1.3 and QUIC; it does not affect earlier versions of TLS.
* "cnsa2" = Prefer key exchange methods satisfying the requirements of CNSA 2.0
* "default" = Use Google Chrome's default supported groups
    '';
    };

    PrefetchWithServiceWorkerEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow SpeculationRules prefetch to ServiceWorker-controlled URLs

SpeculationRules prefetch can be issued to URLs that are controlled by
ServiceWorker. However, legacy code did not allow it and canceled the prefetch
requests. This policy enables to control the behavior.

Setting this policy to Enabled or not set allows SpeculationRules prefetch to
ServiceWorker-controlled URLs (if the PrefetchServiceWorker feature flag is
enabled). This is the current default behavior and is aligned with the
specifications.

Setting this policy to Disabled disallows SpeculationRules prefetch to
ServiceWorker-controlled URLs. This is the legacy behavior.

This policy is intended to be temporary and will be removed in the future.
    '';
    };

    PrintHeaderFooter = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Print Headers and Footers

Setting the policy to Enabled turns headers and footers on in print preview. Setting the policy to Disabled turns them off in print preview.

If you set the policy, users can't change it. If unset, users decides whether headers and footers appear.
    '';
    };

    PrintPdfAsImageDefault = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Print PDF as Image Default

Controls if Google Chrome makes the Print as image option default to set when printing PDFs.

When this policy is set to Enabled, Google Chrome will default to setting the Print as image option in the Print Preview when printing a PDF.

When this policy is set to Disabled or not set Google Chrome then the user selection for Print as image option will be initially unset.  The user will be allowed to select it for each individual PDFs print job, if the option is available.

For Microsoft® Windows® or macOS this policy only has an effect if PrintPdfAsImageAvailability is also enabled.
    '';
    };

    PrintPreviewUseSystemDefaultPrinter = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Use System Default Printer as Default

Setting the policy to Enabled means Google Chrome uses the OS default printer as the default destination for print preview.

Setting the policy to Disabled or leaving it unset means Google Chrome uses the most recently used printer as the default destination for print preview.
    '';
    };

    PrintRasterizePdfDpi = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Print Rasterize PDF DPI

Controls print image resolution when Google Chrome prints PDFs with rasterization.

When printing a PDF using the Print to image option, it can be beneficial to specify a print resolution other than a device's printer setting or the PDF default.  A high resolution will significantly increase the processing and printing time while a low resolution can lead to poor imaging quality.

This policy allows a particular resolution to be specified for use when rasterizing PDFs for printing.

If this policy is set to zero or not set at all then the system default resolution will be used during rasterization of page images.
    '';
    };

    PrinterTypeDenyList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Disable printer types on the deny list

The printers of types placed on the deny list will be disabled from being discovered or having their capabilities fetched.

Placing all printer types on the deny list effectively disables printing, as there would be no available destinations to send a document for printing.

In versions before 102, including cloud on the deny list has the same effect as setting the CloudPrintSubmitEnabled policy to false. In order to keep Google Cloud Print destinations discoverable, the CloudPrintSubmitEnabled policy must be set to true and cloud must not be on the deny list. Beginning in version 102, Google Cloud Print destinations are not supported and will not appear regardless of policy values.

If the policy is not set, or is set to an empty list, all printer types will be available for discovery.

Extension printers are also known as print provider destinations, and include any destination that belongs to a Google Chrome extension.

Local printers are also known as native printing destinations, and include destinations available to the local machine and shared network printers.
* "privet" = Zeroconf-based (mDNS + DNS-SD) protocol destinations (Deprecated)
* "extension" = Extension-based destinations
* "pdf" = The 'Save as PDF' destination, as well as the 'Save to Google Drive' destination on Google ChromeOS devices
* "local" = Local printer destinations
* "cloud" = Google Cloud Print (Deprecated)
    '';
    };

    PrintingAllowedBackgroundGraphicsModes = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Restrict background graphics printing mode

Restricts background graphics printing mode. Unset policy is treated as no restriction.
* "any" = Allow printing both with and without background graphics
* "enabled" = Allow printing only with background graphics
* "disabled" = Allow printing only without background graphics
    '';
    };

    PrintingBackgroundGraphicsDefault = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Default background graphics printing mode

Overrides default background graphics printing mode.
* "enabled" = Enable background graphics printing mode by default
* "disabled" = Disable background graphics printing mode by default
    '';
    };

    PrintingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable printing

Setting the policy to Enabled or leaving it unset lets users print in Google Chrome, and users can't change this setting.

Setting the policy to Disabled means users can't print from Google Chrome. Printing is off in the three dots menu, extensions, and JavaScript applications.
    '';
    };

    PrintingPaperSizeDefault = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Default printing page size

Overrides default printing page size.

name should contain one of the listed formats or 'custom' if required paper size is not in the list. If 'custom' value is provided custom_size property should be specified. It describes the desired height and width in micrometers. Otherwise custom_size property shouldn't be specified. Policy that violates these rules is ignored.

If the page size is unavailable on the printer chosen by the user this policy is ignored.

Schema:
{
  "properties": {
    "custom_size": {
      "properties": {
        "height": {
          "description": "Height of the page in micrometers", 
          "type": "integer"
        }, 
        "width": {
          "description": "Width of the page in micrometers", 
          "type": "integer"
        }
      }, 
      "required": [
        "width", 
        "height"
      ], 
      "type": "object"
    }, 
    "name": {
      "enum": [
        "custom", 
        "asme_f_28x40in", 
        "iso_2a0_1189x1682mm", 
        "iso_a0_841x1189mm", 
        "iso_a10_26x37mm", 
        "iso_a1_594x841mm", 
        "iso_a2_420x594mm", 
        "iso_a3_297x420mm", 
        "iso_a4-extra_235.5x322.3mm", 
        "iso_a4-tab_225x297mm", 
        "iso_a4_210x297mm", 
        "iso_a5-extra_174x235mm", 
        "iso_a5_148x210mm", 
        "iso_a6_105x148mm", 
        "iso_a7_74x105mm", 
        "iso_a8_52x74mm", 
        "iso_a9_37x52mm", 
        "iso_b0_1000x1414mm", 
        "iso_b10_31x44mm", 
        "iso_b1_707x1000mm", 
        "iso_b2_500x707mm", 
        "iso_b3_353x500mm", 
        "iso_b4_250x353mm", 
        "iso_b5-extra_201x276mm", 
        "iso_b5_176x250mm", 
        "iso_b6_125x176mm", 
        "iso_b6c4_125x324mm", 
        "iso_b7_88x125mm", 
        "iso_b8_62x88mm", 
        "iso_b9_44x62mm", 
        "iso_c0_917x1297mm", 
        "iso_c10_28x40mm", 
        "iso_c1_648x917mm", 
        "iso_c2_458x648mm", 
        "iso_c3_324x458mm", 
        "iso_c4_229x324mm", 
        "iso_c5_162x229mm", 
        "iso_c6_114x162mm", 
        "iso_c6c5_114x229mm", 
        "iso_c7_81x114mm", 
        "iso_c7c6_81x162mm", 
        "iso_c8_57x81mm", 
        "iso_c9_40x57mm", 
        "iso_dl_110x220mm", 
        "jis_exec_216x330mm", 
        "jpn_chou2_111.1x146mm", 
        "jpn_chou3_120x235mm", 
        "jpn_chou4_90x205mm", 
        "jpn_hagaki_100x148mm", 
        "jpn_kahu_240x322.1mm", 
        "jpn_kaku2_240x332mm", 
        "jpn_oufuku_148x200mm", 
        "jpn_you4_105x235mm", 
        "na_10x11_10x11in", 
        "na_10x13_10x13in", 
        "na_10x14_10x14in", 
        "na_10x15_10x15in", 
        "na_11x12_11x12in", 
        "na_11x15_11x15in", 
        "na_12x19_12x19in", 
        "na_5x7_5x7in", 
        "na_6x9_6x9in", 
        "na_7x9_7x9in", 
        "na_9x11_9x11in", 
        "na_a2_4.375x5.75in", 
        "na_arch-a_9x12in", 
        "na_arch-b_12x18in", 
        "na_arch-c_18x24in", 
        "na_arch-d_24x36in", 
        "na_arch-e_36x48in", 
        "na_b-plus_12x19.17in", 
        "na_c5_6.5x9.5in", 
        "na_c_17x22in", 
        "na_d_22x34in", 
        "na_e_34x44in", 
        "na_edp_11x14in", 
        "na_eur-edp_12x14in", 
        "na_f_44x68in", 
        "na_fanfold-eur_8.5x12in", 
        "na_fanfold-us_11x14.875in", 
        "na_foolscap_8.5x13in", 
        "na_govt-legal_8x13in", 
        "na_govt-letter_8x10in", 
        "na_index-3x5_3x5in", 
        "na_index-4x6-ext_6x8in", 
        "na_index-4x6_4x6in", 
        "na_index-5x8_5x8in", 
        "na_invoice_5.5x8.5in", 
        "na_ledger_11x17in", 
        "na_legal-extra_9.5x15in", 
        "na_legal_8.5x14in", 
        "na_letter-extra_9.5x12in", 
        "na_letter-plus_8.5x12.69in", 
        "na_letter_8.5x11in", 
        "na_number-10_4.125x9.5in", 
        "na_number-11_4.5x10.375in", 
        "na_number-12_4.75x11in", 
        "na_number-14_5x11.5in", 
        "na_personal_3.625x6.5in", 
        "na_super-a_8.94x14in", 
        "na_super-b_13x19in", 
        "na_wide-format_30x42in", 
        "om_dai-pa-kai_275x395mm", 
        "om_folio-sp_215x315mm", 
        "om_invite_220x220mm", 
        "om_italian_110x230mm", 
        "om_juuro-ku-kai_198x275mm", 
        "om_large-photo_200x300", 
        "om_pa-kai_267x389mm", 
        "om_postfix_114x229mm", 
        "om_small-photo_100x150mm", 
        "prc_10_324x458mm", 
        "prc_16k_146x215mm", 
        "prc_1_102x165mm", 
        "prc_2_102x176mm", 
        "prc_32k_97x151mm", 
        "prc_3_125x176mm", 
        "prc_4_110x208mm", 
        "prc_5_110x220mm", 
        "prc_6_120x320mm", 
        "prc_7_160x230mm", 
        "prc_8_120x309mm", 
        "roc_16k_7.75x10.75in", 
        "roc_8k_10.75x15.5in", 
        "jis_b0_1030x1456mm", 
        "jis_b1_728x1030mm", 
        "jis_b2_515x728mm", 
        "jis_b3_364x515mm", 
        "jis_b4_257x364mm", 
        "jis_b5_182x257mm", 
        "jis_b6_128x182mm", 
        "jis_b7_91x128mm", 
        "jis_b8_64x91mm", 
        "jis_b9_45x64mm", 
        "jis_b10_32x45mm"
      ], 
      "type": "string"
    }
  }, 
  "required": [
    "name"
  ], 
  "type": "object"
}
    '';
    };

    PrivacySandboxPromptEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Choose whether the Privacy Sandbox prompt can be shown to your users

A policy to control whether your users see the Privacy Sandbox prompt.
The prompt is a user-blocking flow which informs your users of the Privacy Sandbox settings. See https://privacysandbox.com for details about Chrome’s effort to deprecate third-party cookies.

If you set this policy to Disabled, then Google Chrome won’t show the Privacy Sandbox prompt.
If you set this policy to Enabled or keep it unset, then Google Chrome determines whether the Privacy Sandbox prompt can be shown or not and then show it if possible.

If any of the following policies are set, it’s required to set this policy to Disabled:
PrivacySandboxAdTopicsEnabled
PrivacySandboxSiteEnabledAdsEnabled
PrivacySandboxAdMeasurementEnabled
    '';
    };

    ProfilePickerOnStartupAvailability = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Profile picker availability on startup

Specifies whether the profile picker is enabled, disabled or forced at the browser startup.

By default the profile picker is not shown if the browser starts in guest or incognito mode, a profile directory and/or urls are specified by command line, an app is explicitly requested to open, the browser was launched by a native notification, there is only one profile available or the policy ForceBrowserSignin is set to true.

If 'Enabled' (0) is selected or the policy is left unset, the profile picker will be shown at startup by default, but users will be able to enable/disable it.

If 'Disabled' (1) is selected, the profile picker will never be shown, and users will not be able to change the setting.

If 'Forced' (2) is selected, the profile picker cannot be suppressed by the user. The profile picker will be shown even if there is only one profile available.
* 0 = Profile picker available at startup
* 1 = Profile picker disabled at startup
* 2 = Profile picker forced at startup
    '';
    };

    ProfileReauthPrompt = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Prompt users to re-authenticate to the profile

When set to DoNotPrompt or left unset, Google Chrome does not automatically prompt the user to re-authenticate to the browser.

When set to PromptInTab, when the user's authentication expires, immediately open a new tab with the Google login page. This only happens if using Chrome Sync.
* 0 = Do not prompt for reauth
* 1 = Prompt for reauth in a tab
    '';
    };

    ProfileSeparationDomainExceptionList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Enterprise profile separation secondary domain allowlist

If this policy is unset, account logins will not be required to create a new separate profile.

If this policy is set, account logins from the listed domains will not be required to create a new separate profile.

This policy can be set to an empty string so that all account logins are required to create a new separate profile.
    '';
    };

    PromotionsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable showing promotional content

Setting the policy to True or leaving it unset lets Google Chrome show users product promotional content.

Setting the policy to False prevents Google Chrome from showing product promotional content.

Setting the policy controls the presentation of promotional content, including the welcome pages that help users sign in to Google Chrome, set Google Chrome as users' default browser, or otherwise inform them of product features.
    '';
    };

    PromptForDownloadLocation = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Ask where to save each file before downloading

Setting the policy to Enabled means users are asked where to save each file before downloading. Setting the policy to Disabled has downloads start immediately, and users aren't asked where to save the file.

Leaving the policy unset lets users change this setting.
    '';
    };

    PromptOnMultipleMatchingCertificates = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Prompt when multiple certificates match

This policy controls whether the user is prompted to select a client certificate when more than one certificate matches AutoSelectCertificateForUrls.
If this policy is set to Enabled, the user is prompted to select a client certificate whenever the auto-selection policy matches multiple certificates.
If this policy is set to Disabled or not set, the user may only be prompted when no certificate matches the auto-selection.
    '';
    };

    ProxySettings = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Proxy settings

Setting the policy configures the proxy settings for Chrome and ARC-apps, which ignore all proxy-related options specified from the command line.

Leaving the policy unset lets users choose their proxy settings.

Setting the ProxySettings policy accepts the following fields:

* ProxyMode, which lets you specify the proxy server Chrome uses and prevents users from changing proxy settings

* ProxyPacUrl, a URL to a proxy .pac file, or a PAC script encoded as a data URL with MIME type application/x-ns-proxy-autoconfig

* ProxyPacMandatory, which prevents the network stack from falling back to direct connections with invalid or unavailable PAC script

* ProxyServer, a URL of the proxy server

* ProxyBypassList, a list of hosts for which the proxy will be bypassed

The ProxyServerMode field is deprecated in favor of the ProxyMode field. For ProxyMode, if you choose the value:

* direct, a proxy is never used and all other fields are ignored.

* system, the systems's proxy is used and all other fields are ignored.

* auto_detect, all other fields are ignored.

* fixed_servers, the ProxyServer and ProxyBypassList fields are used.

* pac_script, the ProxyPacUrl, ProxyPacMandatory and ProxyBypassList fields are used.

Note: For more detailed examples, visit The Chromium Projects ( https://www.chromium.org/developers/design-documents/network-settings/#command-line-options-for-proxy-settings ).

Schema:
{
  "properties": {
    "ProxyBypassList": {
      "type": "string"
    }, 
    "ProxyMode": {
      "enum": [
        "direct", 
        "auto_detect", 
        "pac_script", 
        "fixed_servers", 
        "system"
      ], 
      "type": "string"
    }, 
    "ProxyPacMandatory": {
      "type": "boolean"
    }, 
    "ProxyPacUrl": {
      "type": "string"
    }, 
    "ProxyServer": {
      "type": "string"
    }, 
    "ProxyServerMode": {
      "enum": [
        0, 
        1, 
        2, 
        3
      ], 
      "type": "integer"
    }
  }, 
  "type": "object"
}
    '';
    };

    QRCodeGeneratorEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable QR Code Generator

This policy enables the QR Code generator feature in Google Chrome.

If you enable this policy or don't configure it, the QR Code Generator feature is enabled.

If you disable this policy, the QR Code Generator feature is disabled.
    '';
    };

    QuicAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow QUIC protocol

Setting the policy to Enabled or leaving it unset allows the use of QUIC protocol in Google Chrome.

Setting the policy to Disabled disallows the use of QUIC protocol.
    '';
    };

    ReduceAcceptLanguageEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Control Accept-Language Reduction

The Accept-Language HTTP request header and the JavaScript navigator.languages getter are planned for reduction for privacy reasons.
To facilitate testing and ensure compatibility, this policy allows you to enable or disable the Accept-Language Reduction feature.

If this policy is set to enabled or left unset, Accept-Language Reduction will be applied through field trials.
If this policy is set to disabled, field trials will not be able to activate Accept-Language Reduction.

For more information about this feature, please visit: https://github.com/explainers-by-googlers/reduce-accept-language.

NOTE: Only newly-started renderer processes will reflect changes to this policy while the browser is running.
    '';
    };

    RegisteredProtocolHandlers = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Register protocol handlers

Setting the policy (as recommended only) lets you register a list of protocol handlers, which merge with the ones that the user registers, putting both sets in use. Set the property "protocol" to the scheme, such as "mailto", and set the property "URL" to the URL pattern of the application that handles the scheme specified in the "protocol" field. The pattern can include a "%s" placeholder, which the handled URL replaces.

Users can't remove a protocol handler registered by policy. However, by installing a new default handler, they can change the protocol handlers installed by policy.

Schema:
{
  "items": {
    "properties": {
      "default": {
        "description": "A boolean flag indicating if the protocol handler should be set as the default.", 
        "type": "boolean"
      }, 
      "protocol": {
        "description": "The protocol for the protocol handler.", 
        "type": "string"
      }, 
      "url": {
        "description": "The URL of the protocol handler.", 
        "type": "string"
      }
    }, 
    "required": [
      "protocol", 
      "url"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    RelaunchFastIfOutdated = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Relaunch fast if outdated

Specifies the minimum release age beyond which relaunch notifications are more aggressive. The age is calculated from the time the currently-running version was last served to clients.

If a browser relaunch or device restart is needed to finalize a pending update and the current version has been outdated for more than the number of days specified by this setting, the RelaunchNotificationPeriod policy is overridden to 2 hours. If the RelaunchNotification policy is set to 1 ('Required'), users will be forced to relaunch or restart at the end of the period.

If not set, or if the release age cannot be determined, the RelaunchNotificationPeriod policy will be used for all updates.
    '';
    };

    RelaunchNotification = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Notify a user that a browser relaunch or device restart is recommended or required

Notify users that Google Chrome must be relaunched or Google ChromeOS must be restarted to apply a pending update.

This policy setting enables notifications to inform the user that a browser relaunch or device restart is recommended or required. If not set, Google Chrome indicates to the user that a relaunch is needed via subtle changes to its menu, while Google ChromeOS indicates such via a notification in the system tray. If set to 'Recommended', a recurring warning will be shown to the user that a relaunch is recommended. The user can dismiss this warning to defer the relaunch. If set to 'Required', a recurring warning will be shown to the user indicating that a browser relaunch will be forced once the notification period passes. The default period is seven days for Google Chrome and four days for Google ChromeOS, and may be configured via the RelaunchNotificationPeriod policy setting.

The user's session is restored following the relaunch/restart.
* 1 = Show a recurring prompt to the user indicating that a relaunch is recommended
* 2 = Show a recurring prompt to the user indicating that a relaunch is required
    '';
    };

    RelaunchNotificationPeriod = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Set the time period for update notifications

Allows you to set the time period, in milliseconds, over which users are notified that Google Chrome must be relaunched or that a Google ChromeOS device must be restarted to apply a pending update.

Over this time period, the user will be repeatedly informed of the need for an update. For Google ChromeOS devices, a restart notification appears in the system tray according to the RelaunchHeadsUpPeriod policy. For Google Chrome browsers, the app menu changes to indicate that a relaunch is needed once one third of the notification period passes. This notification changes color once two thirds of the notification period passes, and again once the full notification period has passed. The additional notifications enabled by the RelaunchNotification policy follow this same schedule.

If not set, the default period of 604800000 milliseconds (one week) is used.
    '';
    };

    RelaunchWindow = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Set the time interval for relaunch

Specify a target time window for the end of the relaunch notification period.

Users are notified of the need for a browser relaunch or device restart based on the RelaunchNotification and RelaunchNotificationPeriod policy settings. Browsers and devices are forcibly restarted at the end of the notification period when the RelaunchNotification policy is set to 'Required'. This RelaunchWindow policy can be used to defer the end of the notification period so that it falls within a specific time window.

If this policy is not set, the default target time window for Google ChromeOS is between 2 AM and 4 AM. The default target time window for Google Chrome is the whole day (i.e., the end of the notification period is never deferred).

Note: Though the policy can accept multiple items in entries, all but the first item are ignored.
Warning: Setting this policy may delay application of software updates.

Schema:
{
  "properties": {
    "entries": {
      "items": {
        "properties": {
          "duration_mins": {
            "description": "Time period (minutes) that specifies the length of the relaunch window.", 
            "maximum": 1440, 
            "minimum": 1, 
            "type": "integer"
          }, 
          "start": {
            "description": "Time interpreted in local wall-clock 24h format.", 
            "properties": {
              "hour": {
                "maximum": 23, 
                "minimum": 0, 
                "type": "integer"
              }, 
              "minute": {
                "maximum": 59, 
                "minimum": 0, 
                "type": "integer"
              }
            }, 
            "required": [
              "hour", 
              "minute"
            ], 
            "type": "object"
          }
        }, 
        "required": [
          "start", 
          "duration_mins"
        ], 
        "type": "object"
      }, 
      "type": "array"
    }
  }, 
  "type": "object"
}
    '';
    };

    RemoteAccessHostAllowClientPairing = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable or disable PIN-less authentication for remote access hosts

Setting the policy to Enabled or leaving it unset lets users pair clients and hosts at connection time, eliminating the need to enter a PIN every time.

Setting the policy to Disabled makes this feature unavailable.
    '';
    };

    RemoteAccessHostAllowFileTransfer = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow remote access users to transfer files to/from the host

Setting the policy to Enabled or leaving it unset allows users connected to a remote access host to transfer files between the client and the host. This doesn't apply to remote assistance connections, which don't support file transfer.

Setting the policy to Disabled disallows file transfer.
    '';
    };

    RemoteAccessHostAllowPinAuthentication = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow PIN and pairing authentication methods for remote access hosts

Setting the policy to Enabled allows the remote access host to use PIN and pairing authentications when accepting client connections.

Setting the policy to Disabled disallows PIN or pairing authentications.

Leaving it unset lets the host decide whether PIN and/or pairing authentications can be used.

Note: If the setting results in no mutually supported authentication methods by both the host and the client, then the connection will be rejected.
    '';
    };

    RemoteAccessHostAllowRelayedConnection = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable the use of relay servers by the remote access host

If RemoteAccessHostFirewallTraversal is set to Enabled, setting RemoteAccessHostAllowRelayedConnection to Enabled or leaving it unset allows the use of remote clients to use relay servers to connect to this machine when a direct connection is not available, for example, because of firewall restrictions.

Setting the policy to Disabled doesn't turn remote access off, but only allows connections from the same network (not NAT traversal or relay).
    '';
    };

    RemoteAccessHostAllowRemoteAccessConnections = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow remote access connections to this machine

If this policy is Disabled, the remote access host service cannot be started or configured to accept incoming connections.  This policy does not affect remote support scenarios.

This policy has no effect if it is set to Enabled, left empty, or is not set.
    '';
    };

    RemoteAccessHostAllowRemoteSupportConnections = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow remote support connections to this machine

If this policy is disabled, the remote support host cannot be started or configured to accept incoming connections.

This policy does not affect remote access scenarios.

This policy does not prevent enterprise admins from connecting to managed Google ChromeOS devices.

This policy has no effect if enabled, left empty, or is not set.
    '';
    };

    RemoteAccessHostAllowUrlForwarding = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow remote access users to open host-side URLs in their local client browser

Setting the policy to Enabled or leaving it unset may allow users connected to a remote access host to open host-side URLs in their local client browser.

Setting the policy to Disabled will prevent the remote access host from sending URLs to the client.

This setting doesn't apply to remote assistance connections as the feature is not supported for that connection mode.

Note: This feature is not yet generally available so enabling it does not mean that the feature will be visible in the client UI.
    '';
    };

    RemoteAccessHostClientDomainList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure the required domain names for remote access clients

Setting the policy specifies the client domain names that are imposed on remote access clients, and users can't change them. Only clients from one of the specified domains can connect to the host.

Setting the policy to an empty list or leaving it unset applies the default policy for the connection type. For remote assistance, this allows clients from any domain to connect to the host. For anytime remote access, only the host owner can connect.

See also RemoteAccessHostDomainList.

Note: This setting overrides RemoteAccessHostClientDomain, if present.
    '';
    };

    RemoteAccessHostClipboardSizeBytes = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      The maximum size, in bytes, that can be transferred between client and host via clipboard synchronization

If this policy is set, clipboard data sent to and from the host will be truncated to the limit set by this policy.

If a value of 0 is set, then clipboard sync is disabled.

This policy affects both remote access and remote support scenarios.

This policy has no effect if it is not set.

Setting the policy to a value that is not within the min/max range may prevent the host from starting.

Please note that the actual upper bound for the clipboard size is based on the maximum WebRTC data channel message size which this policy does not control.
    '';
    };

    RemoteAccessHostDomainList = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure the required domain names for remote access hosts

Setting the policy specifies the host domain names that are imposed on remote access hosts, and users can't change them. Hosts can be shared only using accounts registered on one of the specified domain names.

Setting the policy to an empty list or leaving it unset means hosts can be shared using any account.

See also RemoteAccessHostClientDomainList.

Note: This setting will override RemoteAccessHostDomain, if present.
    '';
    };

    RemoteAccessHostFirewallTraversal = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable firewall traversal from remote access host

Setting the policy to Enabled or leaving it unset allows the usage of STUN servers, letting remote clients discover and connect to this machine, even if separated by a firewall.

Setting the policy to Disabled when outgoing UDP connections are filtered by the firewall means the machine only allows connections from client machines within the local network.
    '';
    };

    RemoteAccessHostMatchUsername = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Require that the name of the local user and the remote access host owner match

Setting the policy to Enabled has the remote access host compare the name of the local user the host is associated with and the name of the Google Account registered as the host owner ("johndoe," if the host is owned by "johndoe@example.com"). This host won't start if the host owner's name differs from the name of the local user that the host is associated with. To enforce that the owner's Google Account is associated with a specific domain, use the policy with RemoteAccessHostDomain.

Setting the policy to Disabled or leaving it unset means the remote access host can be associated with any local user.
    '';
    };

    RemoteAccessHostMaximumSessionDurationMinutes = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Maximum session duration allowed for remote access connections

If this policy is set, remote access connections will automatically disconnect after the number of minutes defined in the policy have elapsed. This does not prevent the client from reconnecting after the maximum session duration has been reached. Setting the policy to a value that is not within the min/max range may prevent the host from starting. This policy does not affect remote support scenarios.

This policy has no effect if it is not set. In this case, remote access connections will have no maximum duration on this machine.
    '';
    };

    RemoteAccessHostRequireCurtain = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable curtaining of remote access hosts

Setting the policy to Enabled turns off remote access hosts' physical input and output devices during a remote connection.

Setting the policy to Disabled or leaving it unset lets both local and remote users interact with the host while it's shared.
    '';
    };

    RemoteAccessHostUdpPortRange = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Restrict the UDP port range used by the remote access host

Setting the policy restricts the UDP port range used by the remote access host in this machine.

Leaving the policy unset or set to an empty string means the remote access host can use any available port.

Note: If RemoteAccessHostFirewallTraversal is Disabled, the remote access host will use UDP ports in the 12400-12409 range.
    '';
    };

    RemoteDebuggingAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow remote debugging

Controls whether users may use remote debugging.

If this policy is set to Enabled or not set, users may use remote debugging by specifying --remote-debugging-port and --remote-debugging-pipe command line switches.

If this policy is set to Disabled, users are not allowed to use remote debugging.
    '';
    };

    RequireOnlineRevocationChecksForLocalAnchors = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Require online OCSP/CRL checks for local trust anchors

Setting the policy to True means Google Chrome always performs revocation checking for successfully validated server certificates signed by locally installed CA certificates. If Google Chrome can't get revocation status information, Google Chrome treats these certificates as revoked (hard-fail).

Setting the policy to False or leaving it unset means Google Chrome uses existing online revocation-checking settings.

On macOS, this policy has no effect if the ChromeRootStoreEnabled policy is set to False.
    '';
    };

    RestoreOnStartup = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Action on startup

Setting the policy lets you specify system behavior on startup. Turning this setting off amounts to leaving it unset as Google Chrome must have specified start up behavior.

If you set the policy, users can't change it in Google Chrome. If not set, users can change it.

Setting this policy to RestoreOnStartupIsLastSession or RestoreOnStartupIsLastSessionAndURLs turns off some settings that rely on sessions or that perform actions on exit, such as clearing browsing data on exit or session-only cookies.

If this policy is set to RestoreOnStartupIsLastSessionAndURLs, browser will restore previous session and open a separate window to show URLs that are set from RestoreOnStartupURLs. Note that users can choose to keep those URLs open and they will also be restored in the future session.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
* 5 = Open New Tab Page
* 1 = Restore the last session
* 4 = Open a list of URLs
* 6 = Open a list of URLs and restore the last session
    '';
    };

    RestoreOnStartupURLs = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      URLs to open on startup

If RestoreOnStartup is set to RestoreOnStartupIsURLs, then setting RestoreOnStartupURLs to a list of URLs specify which URLs open.

If not set, the New Tab page opens on start up.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    RestrictPdfSaveToGoogleDriveAccountsToPattern = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Restrict eligible Google accounts for saving PDF files to Google Drive from the Google Chrome PDF Viewer

Contains a regular expression to determine eligible Google accounts for saving PDF files to Google Drive from the Google Chrome PDF Viewer.

An error is displayed if a user tries to upload a PDF file to Google Drive using an account that does not match this pattern.

If this policy is left not set or blank, then the user can use any Google account to save PDF files to Google Drive.
    '';
    };

    RestrictSigninToPattern = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Restrict which Google accounts are allowed to be set as browser primary accounts in Google Chrome

Contains a regular expression which is used to determine which Google accounts can be set as browser primary accounts in Google Chrome (i.e. the account that is chosen during the Sync opt-in flow).

An appropriate error is displayed if a user tries to set a browser primary account with a username that does not match this pattern.

If this policy is left not set or blank, then the user can set any Google account as a browser primary account in Google Chrome.
    '';
    };

    RoamingProfileLocation = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Set the roaming profile directory

Configures the directory that Google Chrome will use for storing the roaming copy of the profiles.

If you set this policy, Google Chrome will use the provided directory to store the roaming copy of the profiles if the RoamingProfileSupportEnabled policy has been enabled. If the RoamingProfileSupportEnabled policy is disabled or left unset the value stored in this policy is not used.

See https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables for a list of variables that can be used.

On non-Windows platforms, this policy must be set for roaming profiles to work.

On Windows, if this policy is left unset, the default roaming profile path will be used.
    '';
    };

    RoamingProfileSupportEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable the creation of roaming copies for Google Chrome profile data

If you enable this setting, the settings stored in Google Chrome profiles like bookmarks, autofill data, passwords, etc. will also be written to a file stored in the Roaming user profile folder or a location specified by the Administrator through the RoamingProfileLocation policy. Enabling this policy disables cloud sync.

If this policy is disabled or left not set only the regular local profiles will be used.
    '';
    };

    SSLErrorOverrideAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow proceeding from the SSL warning page

Setting the policy to Enabled or leaving it unset lets users click through warning pages Google Chrome shows when users navigate to sites that have SSL errors.

Setting the policy to Disabled prevent users from clicking through any warning pages.
    '';
    };

    SSLErrorOverrideAllowedForOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow proceeding from the SSL warning page on specific origins

If SSLErrorOverrideAllowed is Disabled, setting the policy lets you set a list of origin patterns that specify the sites where a user can click through warning pages Google Chrome shows when users navigate to sites that have SSL errors. Users will not be able to click through SSL warning pages on origins that are not on this list.

If SSLErrorOverrideAllowed is Enabled or unset, this policy does nothing.

Leaving the policy unset means SSLErrorOverrideAllowed applies for all sites.

For detailed information on valid input patterns, please see https://chromeenterprise.google/policies/url-patterns/. * is not an accepted value for this policy. This policy only matches based on origin, so any path in the URL pattern is ignored.
    '';
    };

    SafeBrowsingAllowlistDomains = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Configure the list of domains on which Safe Browsing will not trigger warnings.

Setting the policy to Enabled means Safe Browsing will trust the domains you designate. It won't check them for dangerous resources such as phishing, malware, or unwanted software. Safe Browsing's download protection service won't check downloads hosted on these domains. Its password protection service won't check for password reuse.

Leaving the policy unset means default Safe Browsing protection applies to all resources.

This policy does not support regular expressions; however, subdomains of a given domain are allowlisted. Fully qualified domain names (FQDNs) are not required.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.
    '';
    };

    SafeBrowsingDeepScanningEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow download deep scanning for Safe Browsing-enabled users

When this policy is enabled or left unset, Google Chrome can send suspicious downloads from Safe Browsing-enabled users to Google to scan for malware, or prompt users to provide a password for encrypted archives.
When this policy is disabled, this scanning will not be performed.
This policy does not impact download content analysis configured by Chrome Enterprise Connectors.
    '';
    };

    SafeBrowsingExtendedReportingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Safe Browsing Extended Reporting

Setting the policy to Enabled turns on Google Chrome's Safe Browsing Extended Reporting, which sends some system information and page content to Google servers to help detect dangerous apps and sites.

Setting the policy to Disabled means reports are never sent.

If you set this policy, users can't change it. If not set, users can decide whether to send reports or not.

See more about Safe Browsing ( https://developers.google.com/safe-browsing ).
    '';
    };

    SafeBrowsingProtectionLevel = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Safe Browsing Protection Level

Allows you to control whether Google Chrome's Safe Browsing feature is enabled and the mode it operates in.

If this policy is set to 'NoProtection' (value 0), Safe Browsing is never active.

If this policy is set to 'StandardProtection' (value 1, which is the default), Safe Browsing is always active in the standard mode.

If this policy is set to 'EnhancedProtection' (value 2), Safe Browsing is always active in the enhanced mode, which provides better security, but requires sharing more browsing information with Google.

If you set this policy as mandatory, users cannot change or override the Safe Browsing setting in Google Chrome.

If this policy is left not set, Safe Browsing will operate in Standard Protection mode but users can change this setting.

See https://support.google.com/chrome?p=safe_browsing_preferences for more info on Safe Browsing.
* 0 = Safe Browsing is never active.
* 1 = Safe Browsing is active in the standard mode.
* 2 = Safe Browsing is active in the enhanced mode. This mode provides better security, but requires sharing more browsing information with Google.
    '';
    };

    SafeBrowsingProxiedRealTimeChecksAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Safe Browsing Proxied Real Time Checks

This controls whether Safe Browsing's standard protection mode is allowed to
send partial hashes of URLs to Google through a proxy via Oblivious HTTP
in order to determine whether they are safe to visit.

The proxy allows browsers to upload partial hashes of URLs to Google
without them being linked to the user's IP address. The policy also allows
browsers to upload the partial hashes of URLs with higher frequency for
better Safe Browsing protection quality.

This policy will be ignored if Safe Browsing is disabled or set to enhanced
protection mode.

Setting the policy to Enabled or leaving it unset allows the
higher-protection proxied lookups.

Setting the policy to Disabled disallows the higher-protection proxied
lookups. Partial hashes of URLs will be uploaded to Google directly with much
lower frequency, which will degrade protection.
    '';
    };

    SafeBrowsingSurveysEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Safe Browsing Surveys

When this policy is enabled or left unset, the user may receive surveys related to Safe Browsing.
When this policy is disabled, the user will not receive surveys related to Safe Browsing.
    '';
    };

    SafeSitesFilterBehavior = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Control SafeSites adult content filtering.

Setting the policy controls the SafeSites URL filter, which uses the Google Safe Search API to classify URLs as pornographic or not.

When this policy is set to:

* Do not filter sites for adult content, or not set, sites aren't filtered

* Filter sites for adult content, pornographic sites are filtered

The policy applies to both the URL the user navigates to and to iframes. The URLAllowlist policy takes precedence over this policy and can be used to override verdicts from the Google Safe Search API.
* 0 = Do not filter sites for adult content
* 1 = Filter sites for adult content
    '';
    };

    SameOriginTabCaptureAllowedByOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow Same Origin Tab capture by these origins

Setting the policy lets you set a list of URL patterns that can capture tabs with their same Origin.

Leaving the policy unset means that sites will not be considered for an override at this level of capture.

Note that windowed Chrome Apps with the same origin as this site will still be allowed to be captured.

If a site matches a URL pattern in this policy, the following policies will not be considered: TabCaptureAllowedByOrigins, WindowCaptureAllowedByOrigins, ScreenCaptureAllowedByOrigins, ScreenCaptureAllowed.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns/.  This policy only matches based on origin, so any path in the URL pattern is ignored.
    '';
    };

    SandboxExternalProtocolBlocked = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Chrome to block navigations toward external protocols in sandboxed iframes

Chrome will block navigations toward external protocols inside
sandboxed iframe. See https://chromestatus.com/features/5680742077038592.

When True, this lets Chrome blocks those navigations.

When False, this prevents Chrome from blocking those navigations.

This defaults to True: security feature enabled.

This can be used by administrators who need more time to update their internal website affected by this new restriction. This Enterprise policy is temporary; it's intended to be removed after Google Chrome version 117.
    '';
    };

    SavingBrowserHistoryDisabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Disable saving browser history

Setting the policy to Enabled means browsing history is not saved, tab syncing is off and users can't change this setting.

Setting the policy to Disabled or leaving it unset saves browsing history.
    '';
    };

    ScreenCaptureAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow or deny screen capture

If enabled or not configured (default), a Web page can use
screen-share APIs (e.g., getDisplayMedia() or the Desktop Capture extension API)
to prompt the user to select a tab, window or desktop to capture.

When this policy is disabled, any calls to screen-share APIs will fail
with an error; however this policy is not considered (and a site will be
allowed to use screen-share APIs) if the site matches an origin pattern in
any of the following policies:
ScreenCaptureAllowedByOrigins,
WindowCaptureAllowedByOrigins,
TabCaptureAllowedByOrigins,
SameOriginTabCaptureAllowedByOrigins.
    '';
    };

    ScreenCaptureAllowedByOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow Desktop, Window, and Tab capture by these origins

Setting the policy lets you set a list of URL patterns that can use Desktop, Window, and Tab Capture.

Leaving the policy unset means that sites will not be considered for an override at this level of Capture.

This policy is not considered if a site matches a URL pattern in any of the following policies: WindowCaptureAllowedByOrigins, TabCaptureAllowedByOrigins, SameOriginTabCaptureAllowedByOrigins.

If a site matches a URL pattern in this policy, the ScreenCaptureAllowed will not be considered.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns/.  This policy only matches based on origin, so any path in the URL pattern is ignored.
    '';
    };

    ScreenCaptureWithoutGestureAllowedForOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow screen capture without prior user gesture

For security reasons, the
getDisplayMedia() web API requires
a prior user gesture ("transient activation") to be called or will otherwise
fail.

With this policy set, admins can specify origins on which this API can be
called without prior user gesture.

For detailed information on valid url patterns, please see
https://chromeenterprise.google/policies/url-patterns/. * is
not an accepted value for this policy.

If this policy is unset, all origins will require a prior user gesture to call
this API.
    '';
    };

    ScrollToTextFragmentEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable scrolling to text specified in URL fragments

This feature allows for hyperlinks and address bar URL navigations to target specific text within a web page, which will be scrolled to once the loading of the web page is complete.

If you enable or don't configure this policy, web page scrolling to specific text fragments via URL will be enabled.

If you disable this policy, web page scrolling to specific text fragments via URL will be disabled.
    '';
    };

    SearchContentSharingSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Enable content sharing with Google AI Mode and Lens integrations

This policy controls sharing of page and file content with Google AI Mode and Lens through Google Chrome side panel or tabs.

Note that this policy doesn't affect Google AI Mode on the web. It only controls how users can share information with it when using Google Chrome.

0/unset = users can share page or file content with Google AI Mode.

1 = users cannot share page or file content with Google AI Mode. The entry points for sharing context and the side panel will be disabled or hidden.

This policy will be ignored when Google Search is not users' default search engine as the feature is disabled.

This policy is independent of the AIModeSettings policy. The AIModeSettings policy only controls entry points on omnibox or NTP search box, while this policy controls context sharing through side panel or tabs.

This policy also doesn't control Google Gemini integration which can be disabled by GeminiSettings.

If this policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow content sharing with Google AI Mode integrations.
* 1 = Do not allow content sharing with Google AI Mode integrations.
    '';
    };

    SearchSuggestEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable search suggestions

Setting the policy to True turns on search suggestions in Google Chrome's address bar. Setting the policy to False turns off these search suggestions.

Suggestions based on bookmarks or history are unaffected by the policy.

If you set the policy, users can't change it. If not set, search suggestions are on at first, but users can turn them off any time.
    '';
    };

    SecurityKeyPermitAttestation = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      URLs/domains automatically permitted direct Security Key attestation

Setting the policy specifies WebAuthn RP IDs for which no prompt appears when attestation certificates from security keys are requested. A signal is also sent to the security key indicating that enterprise attestation may be used. Without this, when sites request attestation of security keys, users are prompted in Google Chrome version 65 and later.
    '';
    };

    SensorsAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow access to sensors on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can access sensors like motion and light sensors.

Leaving the policy unset means DefaultSensorsSetting applies for all sites, if it's set. If not, the user's personal setting applies.

If the same URL pattern exists in both this policy and the SensorsBlockedForUrls policy, the latter is prioritized and access to motion or light sensors will be blocked.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    SensorsBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block access to sensors on these sites

Setting the policy lets you set a list of URL patterns that specify the sites that can't access sensors like motion and light sensors.

Leaving the policy unset means DefaultSensorsSetting applies for all sites, if it's set. If not, the user's personal setting applies.

If the same URL pattern exists in both this policy and the SensorsAllowedForUrls policy, this policy is prioritized and access to motion or light sensors will be blocked.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed.
    '';
    };

    SerialAllowAllPortsForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Automatically grant permission to sites to connect all serial ports.

Setting the policy allows you to list sites which are automatically granted permission to access all available serial ports.

The URLs must be valid, otherwise the policy is ignored. Only the origin (scheme, host and port) of the URL is considered.

On Google ChromeOS, this policy only applies to affiliated users.

This policy overrides DefaultSerialGuardSetting, SerialAskForUrls, SerialBlockedForUrls and the user's preferences.
    '';
    };

    SerialAllowUsbDevicesForUrls = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Automatically grant permission to sites to connect to USB serial devices.

Setting the policy allows you to list sites which are automatically granted permission to access USB serial devices with vendor and product IDs matching the vendor_id and product_id fields. Omitting the product_id field allows the given sites permission to access devices with a vendor ID matching the vendor_id field and any product ID.

The URLs must be valid, otherwise the policy is ignored. Only the origin (scheme, host and port) of the URL is considered.

On ChromeOS, this policy only applies to affiliated users.

This policy overrides DefaultSerialGuardSetting, SerialAskForUrls, SerialBlockedForUrls and the user's preferences.

This policy only affects access to USB devices through the Web Serial API. To grant access to USB devices through the WebUSB API see the WebUsbAllowDevicesForUrls policy.

Schema:
{
  "items": {
    "properties": {
      "devices": {
        "items": {
          "properties": {
            "product_id": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }, 
            "vendor_id": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }
          }, 
          "required": [
            "vendor_id"
          ], 
          "type": "object"
        }, 
        "type": "array"
      }, 
      "urls": {
        "items": {
          "type": "string"
        }, 
        "type": "array"
      }
    }, 
    "required": [
      "devices", 
      "urls"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    SerialAskForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow the Serial API on these sites

Setting the policy lets you list the URL patterns that specify which sites can ask users to grant them access to a serial port.

Leaving the policy unset means DefaultSerialGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

For URL patterns which do not match the policy SerialBlockedForUrls (if there is a match), DefaultSerialGuardSetting (if set), or the users' personal settings take precedence, in that order.

If URL patterns conflict with SerialBlockedForUrls they will be ignored.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    SerialBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block the Serial API on these sites

Setting the policy lets you list the URL patterns that specify which sites can't ask users to grant them access to a serial port.

Leaving the policy unset means DefaultSerialGuardSetting applies for all sites, if it's set. If not, the user's personal setting applies.

For URL patterns which do not match the policy SerialAskForUrls (if there is a match), DefaultSerialGuardSetting (if set), or the users' personal settings take precedence, in that order.

If URL patterns conflict with SerialAskForUrls this policy will take precedence.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    ServiceWorkerAutoPreloadEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow ServiceWorker to dispatch navigation requests without waiting for its startup

https://github.com/WICG/service-worker-auto-preload
The ServiceWorkerAutoPreload feature dispatches a network request for a main resource at the same time it begins the ServiceWorker bootstrap process.

Setting the policy to Enabled or leaving it unset means
Google Chrome enables ServiceWorkerAutoPreload. The navigation request is automatically dispatched while starting the ServiceWorker in some scenarios, e.g. ServiceWorker is not running,

If it is disabled, Google Chrome will not enable ServiceWorkerAutoPreload. The navigation request is dispatched always after starting the ServiceWorker.

This policy is a temporary measure to control the feature and will be removed in M144.
    '';
    };

    ServiceWorkerToControlSrcdocIframeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow ServiceWorker to control srcdoc iframes

https://github.com/w3c/ServiceWorker/issues/765 asks srcdoc iframe with
the "allow-same-origin" sandbox attribute to be under ServiceWorker control.

Setting the policy to Enabled or leaving it unset means
Google Chrome makes srcdoc iframes
with "allow-same-origin" sandbox attributes to be under ServiceWorker control.

Setting the policy to Disabled leaves the srcdoc iframe not controlled by
ServiceWorker.

This policy is intended to be temporary and will be removed in 2026.
    '';
    };

    SharedArrayBufferUnrestrictedAccessAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Specifies whether SharedArrayBuffers can be used in a non cross-origin-isolated context

Specifies whether SharedArrayBuffers can be used in a non cross-origin-isolated context. Google Chrome will require cross-origin isolation when using SharedArrayBuffers from Google Chrome 91 onward (2021-05-25) for Web Compatibility reasons. Additional details can be found on: https://developer.chrome.com/blog/enabling-shared-array-buffer/.

When set to Enabled, sites can use SharedArrayBuffer with no restrictions.

When set to Disabled or not set, sites can only use SharedArrayBuffers when cross-origin isolated.
    '';
    };

    SharedClipboardEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable the Shared Clipboard Feature

Enable the Shared Clipboard feature which allows users to send text between Chrome Desktops and an Android device when Sync is enabled and the user is Signed-in.

If this policy is set to true, the capability of sending text, cross device, for chrome user is enabled.

If this policy is set to false, the capability of sending text, cross device, for chrome user is disabled.

If you set this policy, users cannot change or override it.

If this policy is left unset, the shared clipboard feature is enabled by default.

It is up to the admins to set policies in all platforms they care about. It's recommended to set this policy to one value in all platforms.
    '';
    };

    SharedWorkerBlobURLFixEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Make SharedWorker blob URL behavior aligned with the specification

Upon https://w3c.github.io/ServiceWorker/#control-and-use-worker-client,
workers should inherit controllers for the blob URL.  However, existing code
allows only DedicatedWorkers to inherit the controller, and SharedWorkers do
not inherit the controller.

Setting the policy to Enabled or leaving it unset means
Google Chrome inherit the controller
if a blob URL is used as a SharedWorker URL.

Setting the policy to Disabled leaves the behavior not aligned with the
specification as-is.

This policy is intended to be temporary and will be removed in the future.
    '';
    };

    ShoppingListEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow the shopping list feature to be enabled

This policy controls the availability of the shopping list feature.
If enabled, users will be presented with UI to track the price of the product displayed on the current page. The tracked product will be shown in the bookmarks side panel.
If this policy is set to Enabled or not set, the shopping list feature will be available to users.
If this policy is set to Disabled, the shopping list feature will be unavailable.
    '';
    };

    ShowAppsShortcutInBookmarkBar = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show the apps shortcut in the bookmark bar

Setting the policy to True displays the apps shortcut. Setting the policy to False means this shortcut never appears.

If you set the policy, users can't change it. If not set, users decide to show or hide the apps shortcut from the bookmark bar context menu.
    '';
    };

    ShowCastIconInToolbar = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show the Google Cast toolbar icon

Setting the policy to Enabled displays the Cast toolbar icon on the toolbar or the overflow menu, and users can't remove it.

Setting the policy to Disabled or leaving it unset lets users pin or remove the icon through its contextual menu.

If the policy EnableMediaRouter is set to Disabled, then this policy's value has no effect, and the toolbar icon doesn't appear.
    '';
    };

    ShowCastSessionsStartedByOtherDevices = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show media controls for Google Cast sessions started by other devices on the local network

When this policy is enabled, media playback controls UI is available for Google Cast sessions started by other devices on the local network.

When this policy is unset for enterprise users or is disabled, media playback controls UI is unavailable for Google Cast sessions started by other devices on the local network.

If the policy EnableMediaRouter is disabled, then this policy's value has no effect, as the entire Google Cast functionality is disabled.
    '';
    };

    ShowFullUrlsInAddressBar = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show Full URLs

This feature enables display of the full URL in the address bar.
If this policy is set to True, then the full URL will be shown in the address bar, including schemes and subdomains.
If this policy is set to False, then the default URL display will apply.
If this policy is left unset, then the default URL display will apply and the user will be able to toggle between default and full URL display with a context menu option.
    '';
    };

    ShowHomeButton = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Show Home button on toolbar

Setting the policy to Enabled shows the Home button on Google Chrome's toolbar. Setting the policy to Disabled keeps the Home button from appearing.

If you set the policy, users can't change it in Google Chrome. If not set, users chooses whether to show the Home button.
    '';
    };

    SideSearchEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow showing the most recent default search engine results page in a Browser side panel

Setting the policy to Enabled or leaving the policy unset means that users can bring up their most recent default search engine results page in a side panel via toggling an icon in the toolbar.

Setting the policy to Disabled removes the icon from the toolbar that opens the side panel with the default search engine results page.
    '';
    };

    SignedHTTPExchangeEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Signed HTTP Exchange (SXG) support

Setting the policy to True or leaving it unset means Google Chrome will accept web contents served as Signed HTTP Exchanges.

Setting the policy to False prevents Signed HTTP Exchanges from loading.
    '';
    };

    SigninInterceptionEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable signin interception

This settings enables or disables signin interception.

When this policy not set or is enabled, the signin interception dialog triggers when a Google account is added on the web, and the user may benefit from moving this account to another (new or existing) profile.

When this is disabled, the signin interception dialog does not trigger.
When this is disabled, a dialog will still be shown if managed account profile separation is enforced by ManagedAccountsSigninRestriction.
    '';
    };

    SilentPrintingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Silent Printing

Setting this policy to true enables silent printing, which immediately closes
print preview window when opened and prints to the default printer with
default options. If the default printer is 'Save as PDF', the file will be
saved to the Downloads folder.

Not setting this policy or setting this policy to false disables silent
printing, which doesn't automatically close print preview window and requires
the user to make a selection as usual.
    '';
    };

    SitePerProcess = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Require Site Isolation for every site

Since Google Chrome 67, site isolation has been enabled by default on all Desktop platforms, causing every site to run in its own process. A site is a scheme plus eTLD+1 (e.g., https://example.com). Setting this policy to Enabled does not change that behavior; it only prevents users from opting out (for example, using Disable site isolation in chrome://flags). Since Google Chrome 76, setting the policy to Disabled or leaving it unset doesn't turn off site isolation, but instead allows users to opt out.

IsolateOrigins might also be useful for isolating specific origins at a finer granularity than site (e.g., https://a.example.com).

On Google ChromeOS version 76 and earlier, set the DeviceLoginScreenSitePerProcess device policy to the same value. (If the values don't match, a delay can occur when entering a user session.)

Note: For Android, use the SitePerProcessAndroid policy instead.
    '';
    };

    SiteSearchSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Site search settings

This policy provides a list of sites that users can quickly search using shortcuts in the address bar. Users can initiate a search by typing the shortcut or @shortcut (e.g. @work), followed by Space or Tab, in the address bar.

The following fields are required for each site: name, shortcut, url.

The name field corresponds to the site or search engine name to be shown to the user in the address bar.

The shortcut can include plain words and characters, but cannot include spaces or start with the @ symbol. Shortcuts must also be unique.

For each entry, the url field specifies the URL of the search engine used during a search with the corresponding keyword. The URL must include the string '{searchTerms}', replaced in the query by the user's search terms. Invalid entries and entries with duplicate shortcuts are ignored.

Site search entries configured as featured are displayed in the address bar when the user types "@". Up to three entries can be selected as featured.

For a site search entry where allow_user_override is true, users have the ability to edit or disable that entry. However, featured engines (beginning with "@") can only be disabled. If a user modifies an entry that was initially created by this policy, it will no longer be managed by policy and will be treated like a user-created shortcut. When allow_user_override is false or unspecified for a site search entry, users cannot edit or disable that entry. The setting to allow user override is only supported on M139 and later; earlier versions will default to disabling user override.

Users cannot create new site search entries with a shortcut previously created via this policy unless allow_user_override is set to true for the site search entry.

In case of a conflict with a shortcut previously created by the user, the user setting takes precedence. However, users can still trigger the option created by the policy by typing "@" in the search bar. For example, if the user already defined "work" as a shortcut to URL1 and the policy defines "work" as a shortcut to URL2, then typing "work" in the search bar will trigger a search to URL1, but typing "@work" in the search bar will trigger a search to URL2.

On Microsoft® Windows®, this policy is only available on instances that are joined to a Microsoft® Active Directory® domain, joined to Microsoft® Azure® Active Directory® or enrolled in Chrome Enterprise Core.

On macOS, this policy is only available on instances that are managed via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise Core.

Schema:
{
  "items": {
    "properties": {
      "allow_user_override": {
        "type": "boolean"
      }, 
      "featured": {
        "type": "boolean"
      }, 
      "name": {
        "type": "string"
      }, 
      "shortcut": {
        "type": "string"
      }, 
      "url": {
        "type": "string"
      }
    }, 
    "required": [
      "shortcut", 
      "name", 
      "url"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    SpellCheckServiceEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable or disable spell checking web service

Setting the policy to Enabled puts a Google web service in use to help resolve spelling errors. This policy only controls the use of the online service. Setting the policy to Disabled means this service is never used.

Leaving the policy unset lets users choose whether to use the spellcheck service.

The spell check can always use a downloaded dictionary locally unless the feature is disabled by SpellcheckEnabled in which case this policy will have no effect.
    '';
    };

    SpellcheckEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable spellcheck

Setting the policy to Enabled turns spellcheck on, and users can't turn it off. On Microsoft® Windows®, Google ChromeOS and Linux®, spellcheck languages can be switched on or off individually, so users can still turn spellcheck off by switching off every spellcheck language. To avoid that, use the SpellcheckLanguage to force-enable specific spellcheck languages.

Setting the policy to Disabled turns off spellcheck from all sources, and users can't turn it on. The SpellCheckServiceEnabled, SpellcheckLanguage and SpellcheckLanguageBlocklist policies have no effect when this policy is set to False.

Leaving the policy unset lets users turn spellcheck on or off in the language settings.
    '';
    };

    SpellcheckLanguage = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Force enable spellcheck languages

Force-enables spellcheck languages. Unrecognized languages in the list will be ignored.

If you enable this policy, spellcheck will be enabled for the languages specified, in addition to the languages for which the user has enabled spellcheck.

If you do not set this policy, or disable it, there will be no change to the user's spellcheck preferences.

If the SpellcheckEnabled policy is set to false, this policy will have no effect.

If a language is included in both this policy and the SpellcheckLanguageBlocklist policy, this policy is prioritized and the spellcheck language is enabled.

The currently supported languages are: af, bg, ca, cs, da, de, el, en-AU, en-CA, en-GB, en-US, es, es-419, es-AR, es-ES, es-MX, es-US, et, fa, fo, fr, he, hi, hr, hu, id, it, ko, lt, lv, nb, nl, pl, pt-BR, pt-PT, ro, ru, sh, sk, sl, sq, sr, sv, ta, tg, tr, uk, vi.
    '';
    };

    SpellcheckLanguageBlocklist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Force disable spellcheck languages

Force-disables spellcheck languages. Unrecognized languages in that list will be ignored.

If you enable this policy, spellcheck will be disabled for the languages specified. The user can still enable or disable spellcheck for languages not in the list.

If you do not set this policy, or disable it, there will be no change to the user's spellcheck preferences.

If the SpellcheckEnabled policy is set to false, this policy will have no effect.

If a language is included in both this policy and the SpellcheckLanguage policy, the latter is prioritized and the spellcheck language will be enabled.

The currently supported languages are: af, bg, ca, cs, da, de, el, en-AU, en-CA, en-GB, en-US, es, es-419, es-AR, es-ES, es-MX, es-US, et, fa, fo, fr, he, hi, hr, hu, id, it, ko, lt, lv, nb, nl, pl, pt-BR, pt-PT, ro, ru, sh, sk, sl, sq, sr, sv, ta, tg, tr, uk, vi.
    '';
    };

    StandardizedBrowserZoomEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Standardized Browser Zoom Behavior

This policy enables conformance to the newly-adopted specification of CSS zoom.

When this policy is Enabled or unset, the CSS "zoom" property will adhere to the specification:

https://drafts.csswg.org/css-viewport/#zoom-property

When Disabled, the CSS "zoom" property will fall back to its legacy pre-standardized behavior.

This policy is a temporary reprieve to allow time to migrate web content to the new behavior. There is also an origin trial ("DisableStandardizedBrowserZoom") that corresponds to the behavior when this policy is Disabled. This policy will be removed and the "Enabled" behavior made permanent in milestone 134.
    '';
    };

    StaticStorageQuotaEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Control whether storage quota APIs will return static values

When enabled, the storage quota APIs will return a static value equal to usage + min(10 GiB, disk rounded up to the nearest 1 GiB).
When disabled, the storage quota APIs will generally return a dynamic value proportional to the total space available on the device, regardless of usage.
If unset, the storage quota APIs will use the default Chrome behavior.
Sites with unlimited storage permissions are unaffected by this setting. Enforced quota is also unaffected.
    '';
    };

    StrictMimetypeCheckForWorkerScriptsEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable strict MIME type checking for worker scripts

This policy enables strict MIME type checking for worker scripts.

When enabled or unset, then worker scripts will use strict MIME type checking for JavaScript, which is the new default behaviour. Worker scripts with legacy MIME types will be rejected.

When disabled, then worker scripts will use lax MIME type checking, so that worker scripts with legacy MIME types, e.g. text/ascii, will continue to be loaded and executed.

Browsers traditionally used lax MIME type checking, so that resources with a number of legacy MIME types were supported. E.g. for JavaScript resources, text/ascii is a legacy supported MIME type. This may cause security issues, by allowing to load resources as scripts that were never intended to be used as such. Chrome will transition to use strict MIME type checking in the near future. The enabled policy will track the default behaviour. Disabling this policy allows administrators to retain the legacy behaviour, if desired.

See https://html.spec.whatwg.org/multipage/scripting.html#scriptingLanguage for details about JavaScript / ECMAScript media types.
    '';
    };

    SuppressDifferentOriginSubframeDialogs = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Suppress JavaScript Dialogs triggered from different origin subframes

As described in https://www.chromestatus.com/feature/5148698084376576 , JavaScript modal dialogs, triggered by window.alert, window.confirm, and window.prompt, will be blocked in Google Chrome if triggered from a subframe whose origin is different from the main frame origin.

This policy allows overriding that change.
If the policy is set to enabled or unset, JavaScript dialogs triggered from a different origin subframe will be blocked.
If the policy is set to disabled, JavaScript dialogs triggered from a different origin subframe will not be blocked.

This policy will be removed from Google Chrome in the future.
    '';
    };

    SuppressUnsupportedOSWarning = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Suppress the unsupported OS warning

Setting the policy to Enabled suppresses the warning that appears when Google Chrome is running on an unsupported computer or operating system.

Setting the policy to Disabled or leaving it unset means the warnings appear on unsupported systems.
    '';
    };

    SyncDisabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Disable synchronization of data with Google

Setting the policy to Enabled turns off data synchronization in Google Chrome using Google-hosted synchronization services.
To fully turn off Chrome Sync services, we recommend that you turn off the service in the Google Admin console.

If the policy is set to Disabled or not set, users are allowed to choose whether to use Chrome Sync.

Note: Do not turn on this policy when RoamingProfileSupportEnabled is Enabled, because that feature shares the same client-side functionality. The Google-hosted synchronization is off completely in this case.
    '';
    };

    SyncTypesListDisabled = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      List of types that should be excluded from synchronization

If this policy is set all specified data types will be excluded from synchronization both for Chrome Sync as well as for roaming profile synchronization. This can be beneficial to reduce the size of the roaming profile or limit the type of data uploaded to the Chrome Sync Servers.

The current data types for this policy are: "apps", "autofill", "bookmarks", "extensions", "preferences", "passwords", "payments", "productComparison", "readingList", "tabs", "themes", "typedUrls", "wifiConfigurations". Those names are case sensitive!

Notes: Dynamic Policy Refresh is supported only in Google Chrome version 123 and later. Disabling "autofill" also disables "payments". "typedUrls" refers to all browsing history.
    '';
    };

    TLS13EarlyDataEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable TLS 1.3 Early Data

TLS 1.3 Early Data is an extension to TLS 1.3 to send an HTTP request simultaneously with the TLS handshake.

If this policy is not configured, Google Chrome will follow the default rollout process for TLS 1.3 Early Data.

If it is enabled, Google Chrome will enable TLS 1.3 Early Data.

If it is disabled, Google Chrome will not enable TLS 1.3 Early Data.

When the feature is enabled, Google Chrome may or may not use TLS 1.3 Early Data depending on server support.

TLS 1.3 Early Data is an established protocol. Existing TLS servers, middleboxes, and security software are expected to either handle or reject TLS 1.3 Early Data without dropping the connection.

However, devices that do not correctly implement TLS may malfunction and disconnect when TLS 1.3 Early Data is in use. If this occurs, administrators should contact the vendor for a fix.

This policy is a temporary measure to control the feature and will be removed afterwards. The policy may be enabled to allow you to test for issues and disabled while issues are being resolved.
    '';
    };

    TabCaptureAllowedByOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow Tab capture by these origins

Setting the policy lets you set a list of URL patterns that can use Tab Capture.

Leaving the policy unset means that sites will not be considered for an override at this level of capture.

Note that windowed Chrome Apps will still be allowed to be captured.

This policy is not considered if a site matches a URL pattern in the SameOriginTabCaptureAllowedByOrigins policy.

If a site matches a URL pattern in this policy, the following policies will not be considered: WindowCaptureAllowedByOrigins, ScreenCaptureAllowedByOrigins, ScreenCaptureAllowed.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns/.  This policy only matches based on origin, so any path in the URL pattern is ignored.
    '';
    };

    TabCompareSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Tab Compare settings

Tab Compare is an AI-powered tool for comparing information across a user's tabs. As an example, the feature can be offered to the user when multiple tabs with products in a similar category are open.

0 = Allow the feature to be used, while allowing Google to use relevant data to improve its AI models. Relevant data may include prompts, inputs, outputs, source materials, and written feedback, depending on the feature. It may also be reviewed by humans to improve AI models. 0 is the default value, except when noted below.

1 = Allow the feature to be used, but does not allow Google to improve models using users' content (including prompts, inputs, outputs, source materials, and written feedback). 1 is the default value for Enterprise users managed by Google Admin console and for Education accounts managed by Google Workspace.

2 = Do not allow the feature.

If the policy is unset, its behavior is determined by the GenAiDefaultSettings policy.

For more information on data handling for generative AI features, please see https://support.google.com/chrome/a?p=generative_ai_settings.
* 0 = Allow Tab Compare and improve AI models.
* 1 = Allow Tab Compare without improving AI models.
* 2 = Do not allow Tab Compare.
    '';
    };

    TabDiscardingExceptions = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      URL pattern Exceptions to tab discarding

This policy makes it so that any URL matching one or more of the patterns it specifies (using the URLBlocklist filter format) will never be discarded by the browser.
This applies to memory pressure and high efficiency mode discarding.
A discarded page is unloaded and its resources fully reclaimed. The tab its associated with remains in the tabstrip, but making it visible will trigger a full reload.
    '';
    };

    TaskManagerEndProcessEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable ending processes in Task Manager

Setting the policy to Disabled prevents users from ending processes in the Task Manager.

Setting the policy to Enabled or leaving it unset lets users end processes in the Task Manager.
    '';
    };

    TranslateEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable Translate

Setting the policy to True provides translation functionality when it's appropriate for users by showing an integrated translate toolbar in Google Chrome and a translate option on the right-click context menu. Setting the policy to False shuts off all built-in translate features.

If you set the policy, users can't change this function. Leaving it unset lets them change the setting.
    '';
    };

    TranslatorAPIAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow Translator API

Setting the policy to Enabled or leaving it unset allows the use of Translator API in Google Chrome.

Setting the policy to Disabled disallows the use of Translator API.
    '';
    };

    URLAllowlist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow access to a list of URLs

Setting the policy provides access to the listed URLs, as exceptions to URLBlocklist. See that policy's description for the format of entries of this list. For example, setting URLBlocklist to * will block all requests, and you can use this policy to allow access to a limited list of URLs. Use it to open exceptions to certain schemes, subdomains of other domains, ports, or specific paths, using the format specified at ( https://support.google.com/chrome/a?p=url_blocklist_filter_format ). The most specific filter determines if a URL is blocked or allowed. The URLAllowlist policy takes precedence over URLBlocklist. This policy is limited to 1,000 entries.

This policy also allows enabling the automatic invocation by the browser of external application registered as protocol handlers for the listed protocols like "tel:" or "ssh:".

Leaving the policy unset allows no exceptions to URLBlocklist.

From Google Chrome version 92, this policy is also supported in the headless mode.
    '';
    };

    URLBlocklist = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block access to a list of URLs

Setting the URLBlocklist policy stops web pages with prohibited URLs from loading. Administrators can specify the list of URL patterns to be blocked. If left unset, no URLs are blocked in the browser. Up to 1,000 exceptions can be defined in URLAllowlist. See how to format a URL pattern ( https://support.google.com/chrome/a?p=url_blocklist_filter_format ).

Note: This policy does not apply to in-page JavaScript URLs with dynamically loaded data. If you blocked example.com/abc, then example.com could still load it using XMLHTTPRequest. Additionally, this policy does not prevent web pages from updating the URL shown in the omnibox to a blocked one using the JavaScript History API.

From Google Chrome version 73, you can block javascript://* URLs. But, this only affects JavaScript entered in the address bar or, for example, bookmarklets.

From Google Chrome version 92, this policy is also supported in the headless mode.

Note: Blocking internal chrome://* and chrome-untrusted://* URLs can lead to unexpected errors or can be circumvented in some cases. Instead of blocking certain internal URLs, see if there are more specific policies available. For example:

- Instead of blocking chrome://settings/certificates, use CACertificateManagementAllowed.

- Instead of blocking chrome-untrusted://crosh, use SystemFeaturesDisableList.
    '';
    };

    UrlKeyedAnonymizedDataCollectionEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable URL-keyed anonymized data collection

Setting the policy to Enabled means URL-keyed anonymized data collection, which sends URLs of pages the user visits to Google to make searches and browsing better, is always active.

Setting the policy to Disabled results in no URL-keyed anonymized data collection.

If this policy is left unset, the user will be able to change this setting manually.

In Google ChromeOS Kiosk, this policy doesn't offer the option to "Allow the user to decide". If this policy is unset for Google ChromeOS Kiosk, URL-keyed anonymized data collection is always active.
When set for Google ChromeOS Kiosk, this policy enables URL-keyed metrics collection for kiosk apps.
    '';
    };

    UserDataSnapshotRetentionLimit = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = ''
      Limits the number of user data snapshots retained for use in case of emergency rollback.

Following each major version update, Chrome will create a snapshot of certain portions of the user's browsing data for use in case of a later emergency version rollback. If an emergency rollback is performed to a version for which a user has a corresponding snapshot, the data in the snapshot is restored. This allows users to retain such settings as bookmarks and autofill data.

If this policy is not set, the default value of 3 is used

If the policy is set, old snapshots are deleted as needed to respect the limit. If the policy is set to 0, no snapshots will be taken
    '';
    };

    UserFeedbackAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow user feedback

Setting the policy to Enabled or leaving it unset lets users send feedback to Google through Menu > Help > Report an Issue or key combination.

Setting the policy to Disabled means users can't send feedback to Google.
    '';
    };

    VideoCaptureAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow or deny video capture

Setting the policy to Enabled or leaving it unset means that, with the exception of URLs set in the VideoCaptureAllowedUrls list, users get prompted for video capture access.

Setting the policy to Disabled turns off prompts, and video capture is only available to URLs set in the VideoCaptureAllowedUrls list.

Note: The policy affects all video input (not just the built-in camera).
    '';
    };

    VideoCaptureAllowedUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      URLs that will be granted access to video capture devices without prompt

Setting the policy means you specify the URL list whose patterns get matched to the security origin of the requesting URL. A match grants access to video capture devices without prompt

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns/. Note, however, that the pattern "*", which matches any URL, is not supported by this policy.
    '';
    };

    WPADQuickCheckEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable WPAD optimization

Setting the policy to Enabled or leaving it unset turns on WPAD (Web Proxy Auto-Discovery) optimization in Google Chrome.

Setting the policy to Disabled turns off WPAD optimization, causing Google Chrome to wait longer for DNS-based WPAD servers.

Whether or not this policy is set, users can't change the WPAD optimization setting.
    '';
    };

    WebAppInstallByUserEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable User Web App Install From Browser

This policy controls whether users can install web apps through the browser.
If you enable or don’t configure this policy, users can install web apps through the browser.
If you disable this policy, users can’t install web apps through the browser and the "apps" data type will be excluded from synchronization for Chrome Sync.
This policy doesn't support dynamic refresh. Any changes, whether enabling, disabling or unsetting, become effective only after the browser is restarted.
This policy doesn't affect the 'WebAppInstallForceList' policy.
    '';
    };

    WebAppInstallForceList = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Configure list of force-installed Web Apps

Setting the policy specifies a list of web apps that install silently, without user interaction, and which users can't uninstall or turn off.

Each list item of the policy is an object with a mandatory member:
url (the URL of the web app to install)

and 6 optional members:
- default_launch_container
(for how the web app opens—a new tab is the default)

- create_desktop_shortcut
(True if you want to create Linux and
Microsoft® Windows® desktop shortcuts).

- fallback_app_name
(Starting with Google Chrome version 90,
allows you to override the app name if it is not a
Progressive Web App (PWA), or the app name that is temporarily
installed if it is a PWA but authentication is required before the
installation can be completed. If both
custom_name and
fallback_app_name are provided,
the latter will be ignored.)

- custom_name
(Starting with Google ChromeOS
version 99, and version 112 on all other desktop operating systems, allows you to
permanently override the app name for all web apps and PWAs.)

- custom_icon
(Starting with Google ChromeOS
version 99, and version 112 on all other desktop operating systems, allows you to
override the app icon of installed apps. The icons have to be square,
maximal 1 MB in size, and in one of the following formats: jpeg, png, gif, webp, ico.
The hash value has to be the SHA256 hash of the icon file. The url
should be accessible without authentication to ensure the icon can be used
upon app installation.)

- install_as_shortcut
(Starting with Google Chrome
version 107). If enabled the given url
will be installed as a shortcut, as if done via the "Create Shortcut..."
option in the desktop browser GUI.
Note that when installed as a shortcut it won't be updated if the
manifest in url changes.
If disabled or unset, the web app at the given
url will be installed normally.

See PinnedLauncherApps for pinning apps to the Google ChromeOS shelf.

Schema:
{
  "items": {
    "properties": {
      "create_desktop_shortcut": {
        "type": "boolean"
      }, 
      "custom_icon": {
        "properties": {
          "hash": {
            "type": "string"
          }, 
          "url": {
            "type": "string"
          }
        }, 
        "required": [
          "url", 
          "hash"
        ], 
        "type": "object"
      }, 
      "custom_name": {
        "type": "string"
      }, 
      "default_launch_container": {
        "enum": [
          "tab", 
          "window"
        ], 
        "type": "string"
      }, 
      "fallback_app_name": {
        "type": "string"
      }, 
      "install_as_shortcut": {
        "type": "boolean"
      }, 
      "url": {
        "type": "string"
      }
    }, 
    "required": [
      "url"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    WebAppSettings = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Web App management settings

This policy allows an admin to specify settings for installed web apps. This policy maps a Web App ID to its specific setting. A default configuration can be set using the special ID *, which applies to all web apps without a custom configuration in this policy.

The manifest_id field is the Manifest ID for the Web App. See https://developer.chrome.com/blog/pwa-manifest-id/ for instructions on how to determine the Manifest ID for an installed web app.
The run_on_os_login field specifies if a web app can be run during OS login. If this field is set to blocked, the web app will not run during OS login and the user will not be able to enable this later. If this field is set to run_windowed, the web app will run during OS login and the user will not be able to disable this later. If this field is set to allowed, the user will be able to configure the web app to run at OS login. The default configuration only allows the allowed and blocked values.
(Since version 117) The prevent_close_after_run_on_os_login field specifies if a web app shall be prevented from closing in any way (e.g. by the user, task manager, web APIs). This behavior can only be enabled if run_on_os_login is set to run_windowed. If the app were already running, this property will only come into effect after the app is restarted. If this field is not defined, apps will be closable by users.
(Since version 118) The force_unregister_os_integration field specifies if all OS integration for a web app, i.e. shortcuts, file handlers, protocol handlers etc will be removed or not. If an app is already running, this property will come into effect after the app has restarted. This should be used with caution, since this can override any OS integration that is set automatically during the startup of the web applications system. Currently only works on Windows, Mac and Linux platforms.

Schema:
{
  "items": {
    "properties": {
      "force_unregister_os_integration": {
        "type": "boolean"
      }, 
      "manifest_id": {
        "type": "string"
      }, 
      "prevent_close_after_run_on_os_login": {
        "type": "boolean"
      }, 
      "run_on_os_login": {
        "enum": [
          "allowed", 
          "blocked", 
          "run_windowed"
        ], 
        "type": "string"
      }
    }, 
    "required": [
      "manifest_id"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    WebAudioOutputBufferingEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable adaptive buffering for Web Audio

This policy controls whether the browser uses adaptive buffering for
Web Audio, which may decrease audio glitches but may increase
latency by a variable amount.

Setting the policy to Enabled will always use adaptive buffering.

Setting the policy to Disabled or not set will allow the browser
feature launch process to decide if adaptive buffering is used.
    '';
    };

    WebAuthenticationRemoteDesktopAllowedOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allowed Origins for Proxied WebAuthn Requests from Remote Desktop Applications.

A list of origins of remote desktop client apps that may execute WebAuthn API
requests that originate from a browsing session on a remote host.

Any origin configured in this policy can make WebAuthn requests for Relying
Party IDs (RP IDs) that it would normally not allowed to be able to claim.

Only valid HTTPS origins are allowed. Wildcards are not supported.
Any invalid entries are ignored.
    '';
    };

    WebHidAllowAllDevicesForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Automatically grant permission to sites to connect to any HID device.

Setting the policy allows you to list sites which are automatically granted permission to access all available devices.

The URLs must be valid, otherwise the policy is ignored. Only the origin (scheme, host and port) of the URL is considered.

On ChromeOS, this policy only applies to affiliated users.

This policy overrides DefaultWebHidGuardSetting, WebHidAskForUrls, WebHidBlockedForUrls and the user's preferences.
    '';
    };

    WebHidAllowDevicesForUrls = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Automatically grant permission to these sites to connect to HID devices with the given vendor and product IDs.

Setting the policy lets you list the URLs that specify which sites are automatically granted permission to access a HID device with the given vendor and product IDs. Each item in the list requires both devices and urls fields for the item to be valid, otherwise the item is ignored. Each item in the devices field must have a vendor_id and may have a product_id field. Omitting the product_id field will create a policy matching any device with the specified vendor ID. An item which has a product_id field without a vendor_id field is invalid and is ignored.

Leaving the policy unset means DefaultWebHidGuardSetting applies, if it's set. If not, the user's personal setting applies.

URLs in this policy shouldn't conflict with those configured through WebHidBlockedForUrls. If they do, this policy takes precedence over WebHidBlockedForUrls.

Schema:
{
  "items": {
    "properties": {
      "devices": {
        "items": {
          "properties": {
            "product_id": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }, 
            "vendor_id": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }
          }, 
          "required": [
            "vendor_id"
          ], 
          "type": "object"
        }, 
        "type": "array"
      }, 
      "urls": {
        "items": {
          "type": "string"
        }, 
        "type": "array"
      }
    }, 
    "required": [
      "devices", 
      "urls"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    WebHidAllowDevicesWithHidUsagesForUrls = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Automatically grant permission to these sites to connect to HID devices containing top-level collections with the given HID usage.

Setting the policy lets you list the URLs that specify which sites are automatically granted permission to access a HID device containing a top-level collection with the given HID usage. Each item in the list requires both usages and urls fields for the policy to be valid. Each item in the usages field must have a usage_page and may have a usage field. Omitting the usage field will create a policy matching any device containing a top-level collection with a usage from the specified usage page. An item which has a usage field without a usage_page field is invalid and is ignored.

Leaving the policy unset means DefaultWebHidGuardSetting applies, if it's set. If not, the user's personal setting applies.

URLs in this policy shouldn't conflict with those configured through WebHidBlockedForUrls. If they do, this policy takes precedence over WebHidBlockedForUrls.

Schema:
{
  "items": {
    "properties": {
      "urls": {
        "items": {
          "type": "string"
        }, 
        "type": "array"
      }, 
      "usages": {
        "items": {
          "properties": {
            "usage": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }, 
            "usage_page": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }
          }, 
          "required": [
            "usage_page"
          ], 
          "type": "object"
        }, 
        "type": "array"
      }
    }, 
    "required": [
      "usages", 
      "urls"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    WebHidAskForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow the WebHID API on these sites

Setting the policy lets you list the URL patterns that specify which sites can ask users to grant them access to a HID device.

Leaving the policy unset means DefaultWebHidGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

For URL patterns which do not match the policy, the following take precedence, in this order:

  * WebHidBlockedForUrls (if there is a match),

  * DefaultWebHidGuardSetting (if set), or

  * Users' personal settings.

URL patterns must not conflict with WebHidBlockedForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    WebHidBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block the WebHID API on these sites

Setting the policy lets you list the URL patterns that specify which sites can't ask users to grant them access to a HID device.

Leaving the policy unset means DefaultWebHidGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

For URL patterns which do not match the policy, the following take precedence, in this order:

  * WebHidAskForUrls (if there is a match),

  * DefaultWebHidGuardSetting (if set), or

  * Users' personal settings.

URL patterns can't conflict with WebHidAskForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    WebRtcEventLogCollectionAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow collection of WebRTC event logs from Google services

Setting the policy to Enabled means Google Chrome can collect WebRTC event logs from Google services such as Hangouts Meet and upload them to Google. These logs have diagnostic information for debugging issues with audio or video meetings in Google Chrome, such as the time and size of RTP packets, feedback about congestion on the network, and metadata about time and quality of audio and video frames. These logs have no audio or video content from the meeting. To make debugging easier, Google might associate these logs, by means of a session ID, with other logs collected by the Google service itself.

Setting the policy to Disabled results in no collection or uploading of such logs.

Leaving the policy unset on versions up to and including M76 means Google Chrome defaults to not being able to collect and upload these logs. Starting at M77, Google Chrome defaults to being able to collect and upload these logs from most profiles affected by cloud-based, user-level enterprise policies. From M77 up to and including M80, Google Chrome can also collect and upload these logs by default from profiles affected by Google Chrome on-premise management.
    '';
    };

    WebRtcIPHandling = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      WebRTC IP handling

This policy allows restricting which IP addresses and interfaces WebRTC uses when attempting to find the best available connection.

Valid values:

* default - WebRTC uses all available network interfaces.

* default_public_and_private_interfaces - WebRTC uses all public and private interfaces.

* default_public_interface_only - WebRTC uses all public interfaces, but not private ones.

* disable_non_proxied_udp - WebRTC uses either UDP SOCKS proxying or will fallback to TCP proxying.

When unset, defaults to using all available network interfaces.

See RFC 8828 section 5.2 (https://tools.ietf.org/html/rfc8828.html#section-5.2) for a detailed description of all the handling values.
* "default" = WebRTC will use all available interfaces when searching for the best path.
* "default_public_and_private_interfaces" = WebRTC will only use the interface connecting to the public Internet, but may connect using private IP addresses.
* "default_public_interface_only" = WebRTC will only use the interface connecting to the public Internet, and will not connect using private IP addresses.
* "disable_non_proxied_udp" = WebRTC will use TCP on the public-facing interface, and will only use UDP if supported by a configured proxy.
    '';
    };

    WebRtcIPHandlingUrl = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      WebRTC per URL IP Handling

This policy allows restricting which IP addresses and interfaces WebRTC uses when attempting to find the best available connection for each specific URL pattern.

It accepts a list of URL patterns and handling type pairs. The URL patterns are checked in order and the first match will configure which handling is used by WebRTC for the domain. When the URL of the current document is not matched against any entry, it uses the configuration set by the policy WebRtcIPHandling.

For detailed information on valid input patterns, please see https://chromeenterprise.google/policies/url-patterns/. Wildcards, *, are allowed. This policy only matches based on origin, so any path in the URL pattern is ignored.

Valid handling values:

* default - WebRTC uses all network interfaces.

* default_public_and_private_interfaces - WebRTC uses all public and private interfaces.

* default_public_interface_only - WebRTC uses all public interfaces, but not private ones.

* disable_non_proxied_udp - WebRTC uses either UDP SOCKS proxying or will fallback to TCP proxying.

See RFC 8828 section 5.2 (https://tools.ietf.org/html/rfc8828.html#section-5.2) for a detailed description of all the handling values.

Schema:
{
  "items": {
    "properties": {
      "handling": {
        "enum": [
          "default", 
          "default_public_and_private_interfaces", 
          "default_public_interface_only", 
          "disable_non_proxied_udp"
        ], 
        "type": "string"
      }, 
      "url": {
        "type": "string"
      }
    }, 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    WebRtcLocalIpsAllowedUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      URLs for which local IPs are exposed in WebRTC ICE candidates

Patterns in this list will be matched against the security origin of the requesting URL.
If a match is found or chrome://flags/#enable-webrtc-hide-local-ips-with-mdns is Disabled, the local IP addresses are shown in WebRTC ICE candidates.
Otherwise, local IP addresses are concealed with mDNS hostnames.
Please note that this policy weakens the protection of local IPs if needed by administrators.
    '';
    };

    WebRtcPostQuantumKeyAgreement = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Enable post-quantum key agreement for WebRTC

This policy allows controlling post-quantum key agreement for WebRTC.

If this policy is set to Enabled, post-quantum key agreement would be offered for
WebRTC.

If this policy is set to Disabled, post-quantum key agreement would not be offered
for WebRTC.

If this policy is not set, the value would be set by the default rollout process
for post-quantum key agreement offered for WebRTC.

Offering a post-quantum key agreement is backwards-compatible. Existing DTLS
peers and networking middleware are expected to ignore the new option and
continue selecting previous options.

However, devices that do not correctly implement DTLS may malfunction when
offered the new option. For example, they may disconnect in response to
unrecognized options or the resulting larger messages. Such devices are not
post-quantum-ready and will interfere with an enterprise's post-quantum
transition. If encountered, administrators should contact the vendor for a fix.

This policy is a temporary measure and will be removed after some milestones.
    '';
    };

    WebRtcTextLogCollectionAllowed = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Allow WebRTC text logs collection from Google Services

Setting the policy to enabled means Google Chrome can collect WebRTC text logs from Google services such as Google Meet and upload them to Google. These logs have diagnostic information for debugging issues with audio or video meetings in Google Chrome, such as textual metadata describing incoming and outgoing WebRTC streams, WebRTC specific log entries and additional system information. These logs have no audio or video content from the meeting.
Setting the policy to disabled results in no uploading of such logs to Google. Logs would still accumulate locally on the user's device.
Leaving the policy unset means Google Chrome defaults to being able to collect and upload these logs.
    '';
    };

    WebRtcUdpPortRange = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
      Restrict the range of local UDP ports used by WebRTC

If the policy is set, the UDP port range used by WebRTC is restricted to the specified port interval (endpoints included).

If the policy is not set, or if it is set to the empty string or an invalid port range, WebRTC is allowed to use any available local UDP port.
    '';
    };

    WebUsbAllowDevicesForUrls = lib.mkOption {
      type = lib.types.nullOr lib.types.anything;
      default = null;
      description = ''
      Automatically grant permission to these sites to connect to USB devices with the given vendor and product IDs.

Setting the policy lets you list the URL patterns that specify which sites are automatically granted permission to access a USB device with the given vendor and product IDs. Each item in the list requires both devices and urls fields for the policy to be valid. Each item in the devices field can have a vendor_id and product_id field. Omitting the vendor_id field will create a policy matching any device. Omitting the product_id field will create a policy matching any device with the given vendor ID. A policy which has a product_id field without a vendor_id field is invalid.

The USB permission model will grant the specified URL permission to access the USB device as a top-level origin. If embedded frames need to access USB devices, the 'usb' feature-policy header should be used to grant access. The URL must be valid, otherwise the policy is ignored.

Deprecated: The USB permission model used to support specifying both the requesting and embedding URLs. This is deprecated and only supported for backwards compatibility in this manner: if both a requesting and embedding URL is specified, then the embedding URL will be granted the permission as top-level origin and the requesting URL will be ignored entirely.

This policy overrides DefaultWebUsbGuardSetting, WebUsbAskForUrls, WebUsbBlockedForUrls and the user's preferences.

This policy only affects access to USB devices through the WebUSB API. To grant access to USB devices through the Web Serial API see the SerialAllowUsbDevicesForUrls policy.

Schema:
{
  "items": {
    "properties": {
      "devices": {
        "items": {
          "properties": {
            "product_id": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }, 
            "vendor_id": {
              "maximum": 65535, 
              "minimum": 0, 
              "type": "integer"
            }
          }, 
          "type": "object"
        }, 
        "type": "array"
      }, 
      "urls": {
        "items": {
          "type": "string"
        }, 
        "type": "array"
      }
    }, 
    "required": [
      "devices", 
      "urls"
    ], 
    "type": "object"
  }, 
  "type": "array"
}
    '';
    };

    WebUsbAskForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow WebUSB on these sites

Setting the policy lets you list the URL patterns that specify which sites can ask users to grant them access to a USB device.

Leaving the policy unset means DefaultWebUsbGuardSetting applies for all sites, if it's set. If not, users' personal settings apply.

URL patterns must not conflict with WebUsbAskForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    WebUsbBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block WebUSB on these sites

Setting the policy lets you list the URL patterns that specify which sites can't ask users to grant them access to a USB device.

Leaving the policy unset means DefaultWebUsbGuardSetting applies for all sites, if it's set. If not, the user's personal setting applies.

URL patterns can't conflict with WebUsbAskForUrls. Neither policy takes precedence if a URL matches with both.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns. * is not an accepted value for this policy.
    '';
    };

    WindowCaptureAllowedByOrigins = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow Window and Tab capture by these origins

Setting the policy lets you set a list of URL patterns that can use Window and Tab Capture.

Leaving the policy unset means that sites will not be considered for an override at this level of Capture.

This policy is not considered if a site matches a URL pattern in any of the following policies: TabCaptureAllowedByOrigins, SameOriginTabCaptureAllowedByOrigins.

If a site matches a URL pattern in this policy, the following policies will not be considered: ScreenCaptureAllowedByOrigins, ScreenCaptureAllowed.

For detailed information on valid url patterns, please see https://chromeenterprise.google/policies/url-patterns/.  This policy only matches based on origin, so any path in the URL pattern is ignored.
    '';
    };

    WindowManagementAllowedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Allow Window Management permission on these sites

Allows you to set a list of site url patterns that specify sites which will automatically grant the window management permission. This will extend the ability of sites to see information about the device's screens and use that information to open and place windows or request fullscreen on specific screens.

For detailed information on valid site url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed. This policy only matches based on origin, so any path in the URL pattern is ignored.

If this policy is not set for a site then the policy from DefaultWindowManagementSetting applies to the site, if set, otherwise the permission will follow the browser's defaults and allow users to choose this permission per site.

This replaces the deprecated WindowPlacementAllowedForUrls policy.
    '';
    };

    WindowManagementBlockedForUrls = lib.mkOption {
      type = lib.types.nullOr (lib.types.listOf lib.types.str);
      default = null;
      description = ''
      Block Window Management permission on these sites

Allows you to set a list of site url patterns that specify sites which will automatically deny the window management permission. This will limit the ability of sites to see information about the device's screens and use that information to open and place windows or request fullscreen on specific screens.

For detailed information on valid site url patterns, please see https://chromeenterprise.google/policies/url-patterns. Wildcards, *, are allowed. This policy only matches based on origin, so any path in the URL pattern is ignored.

If this policy is not set for a site then the policy from DefaultWindowManagementSetting applies to the site, if set, otherwise the permission will follow the browser's defaults and allow users to choose this permission per site.

This replaces the deprecated WindowPlacementBlockedForUrls policy.
    '';
    };

    XSLTEnabled = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = null;
      description = ''
      Control the availability of the XSLT feature

This policy controls the availability of the XSLT feature (the XSLTProcessor Javascript API and the XSL processing instruction).
If this policy is set to Enabled, XSLT will be available, regardless of the default state of the feature in the browser.
If this policy is set to Disabled, XSLT will be unavailable, regardless of the default state of the feature in the browser.
If this policy is left unset, XSLT availability will be determined by the browser's default settings and field trials.
This policy is a temporary measure, and will be removed in M164.
    '';
    };
  };

  config = lib.mkIf (enabledPolicies != {}) {
    xdg.configFile."chromium/policies/managed/policy.json".text =
      builtins.toJSON enabledPolicies;
  };
}
