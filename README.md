# openapi

Developer-friendly & type-safe Ruby SDK specifically catered to leverage *openapi* API.

[![Built by Speakeasy](https://img.shields.io/badge/Built_by-SPEAKEASY-374151?style=for-the-badge&labelColor=f3f4f6)](https://www.speakeasy.com/?utm_source=openapi&utm_campaign=ruby)
[![License: MIT](https://img.shields.io/badge/LICENSE_//_MIT-3b5bdb?style=for-the-badge&labelColor=eff6ff)](https://opensource.org/licenses/MIT)


<br /><br />
> [!IMPORTANT]
> This SDK is not yet ready for production use. To complete setup please follow the steps outlined in your [workspace](https://app.speakeasy.com/org/kombo-ayg/api). Delete this section before > publishing to a package manager.

<!-- Start Summary [summary] -->
## Summary


<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [openapi](#openapi)
  * [SDK Installation](#sdk-installation)
  * [SDK Example Usage](#sdk-example-usage)
  * [Authentication](#authentication)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Global Parameters](#global-parameters)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
* [Development](#development)
  * [Maturity](#maturity)
  * [Contributions](#contributions)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

The SDK can be installed using [RubyGems](https://rubygems.org/):

```bash
gem install kombo
```
<!-- End SDK Installation [installation] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.general.check_api_key()

unless res.get_check_api_key_positive_response.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->

<!-- Start Authentication [security] -->
## Authentication

### Per-Client Security Schemes

This SDK supports the following security scheme globally:

| Name      | Type | Scheme      |
| --------- | ---- | ----------- |
| `api_key` | http | HTTP Bearer |

You can set the security parameters through the `security` optional parameter when initializing the SDK client instance. For example:
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.general.check_api_key()

unless res.get_check_api_key_positive_response.nil?
  # handle response
end

```
<!-- End Authentication [security] -->

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [Assessment](docs/sdks/assessment/README.md)

* [get_packages](docs/sdks/assessment/README.md#get_packages) - Get packages
* [set_packages](docs/sdks/assessment/README.md#set_packages) - Set packages
* [get_open_orders](docs/sdks/assessment/README.md#get_open_orders) - Get open orders
* [update_order_result](docs/sdks/assessment/README.md#update_order_result) - Update order result

### [Ats](docs/sdks/ats/README.md)

* [get_applications](docs/sdks/ats/README.md#get_applications) - Get applications
* [move_application_to_stage](docs/sdks/ats/README.md#move_application_to_stage) - Move application to stage
* [add_application_result_link](docs/sdks/ats/README.md#add_application_result_link) - Add result link to application
* [add_application_note](docs/sdks/ats/README.md#add_application_note) - Add note to application
* [get_application_attachments](docs/sdks/ats/README.md#get_application_attachments) - Get application attachments
* [add_application_attachment](docs/sdks/ats/README.md#add_application_attachment) - Add attachment to application
* [reject_application](docs/sdks/ats/README.md#reject_application) - Reject application
* [get_candidates](docs/sdks/ats/README.md#get_candidates) - Get candidates
* [create_candidate](docs/sdks/ats/README.md#create_candidate) - Create candidate
* [get_candidate_attachments](docs/sdks/ats/README.md#get_candidate_attachments) - Get candidate attachments
* [add_candidate_attachment](docs/sdks/ats/README.md#add_candidate_attachment) - Add attachment to candidate
* [add_candidate_result_link](docs/sdks/ats/README.md#add_candidate_result_link) - Add result link to candidate
* [add_candidate_tag](docs/sdks/ats/README.md#add_candidate_tag) - Add tag to candidate
* [remove_candidate_tag](docs/sdks/ats/README.md#remove_candidate_tag) - Remove tag from candidate
* [get_tags](docs/sdks/ats/README.md#get_tags) - Get tags
* [get_application_stages](docs/sdks/ats/README.md#get_application_stages) - Get application stages
* [get_jobs](docs/sdks/ats/README.md#get_jobs) - Get jobs
* [create_application](docs/sdks/ats/README.md#create_application) - Create application
* [get_users](docs/sdks/ats/README.md#get_users) - Get users
* [get_offers](docs/sdks/ats/README.md#get_offers) - Get offers
* [get_rejection_reasons](docs/sdks/ats/README.md#get_rejection_reasons) - Get rejection reasons
* [get_interviews](docs/sdks/ats/README.md#get_interviews) - Get interviews
* [import_tracked_application](docs/sdks/ats/README.md#import_tracked_application) - Import tracked application

### [Connect](docs/sdks/connect/README.md)

* [create_connection_link](docs/sdks/connect/README.md#create_connection_link) - Create connection link
* [get_integration_by_token](docs/sdks/connect/README.md#get_integration_by_token) - Get integration by token

### [General](docs/sdks/general/README.md)

* [check_api_key](docs/sdks/general/README.md#check_api_key) - Check API key
* [trigger_sync](docs/sdks/general/README.md#trigger_sync) - Trigger sync
* [send_passthrough_request](docs/sdks/general/README.md#send_passthrough_request) - Send passthrough request
* [delete_integration](docs/sdks/general/README.md#delete_integration) - Delete integration
* [get_integration_details](docs/sdks/general/README.md#get_integration_details) - Get integration details
* [set_integration_enabled](docs/sdks/general/README.md#set_integration_enabled) - Set integration enabled
* [create_reconnection_link](docs/sdks/general/README.md#create_reconnection_link) - Create reconnection link
* [get_integration_fields](docs/sdks/general/README.md#get_integration_fields) - Get integration fields
* [update_integration_field](docs/sdks/general/README.md#update_integration_field) - Updates an integration fields passthrough setting
* [get_custom_fields](docs/sdks/general/README.md#get_custom_fields) - Get custom fields with current mappings
* [update_custom_field_mapping](docs/sdks/general/README.md#update_custom_field_mapping) - Put custom field mappings
* [get_tools](docs/sdks/general/README.md#get_tools) - Get tools

### [Hris](docs/sdks/hris/README.md)

* [get_employees](docs/sdks/hris/README.md#get_employees) - Get employees
* [get_employee_form](docs/sdks/hris/README.md#get_employee_form) - Get employee form
* [create_employee_with_form](docs/sdks/hris/README.md#create_employee_with_form) - Create employee with form
* [add_employee_document](docs/sdks/hris/README.md#add_employee_document) - Add document to employee
* [get_employee_document_categories](docs/sdks/hris/README.md#get_employee_document_categories) - Get employee document categories
* [get_groups](docs/sdks/hris/README.md#get_groups) - Get groups
* [get_employments](docs/sdks/hris/README.md#get_employments) - Get employments
* [get_locations](docs/sdks/hris/README.md#get_locations) - Get work locations
* [get_absence_types](docs/sdks/hris/README.md#get_absence_types) - Get absence types
* [get_time_off_balances](docs/sdks/hris/README.md#get_time_off_balances) - Get time off balances
* [get_absences](docs/sdks/hris/README.md#get_absences) - Get absences
* [create_absence](docs/sdks/hris/README.md#create_absence) - Create absence
* [delete_absence](docs/sdks/hris/README.md#delete_absence) - Delete absence
* [get_legal_entities](docs/sdks/hris/README.md#get_legal_entities) - Get legal entities
* [get_timesheets](docs/sdks/hris/README.md#get_timesheets) - Get timesheets
* [get_performance_review_cycles](docs/sdks/hris/README.md#get_performance_review_cycles) - Get performance review cycles
* [get_performance_reviews](docs/sdks/hris/README.md#get_performance_reviews) - Get performance reviews

</details>
<!-- End Available Resources and Operations [operations] -->

<!-- Start Global Parameters [global-parameters] -->
## Global Parameters

A parameter is configured globally. This parameter may be set on the SDK client instance itself during initialization. When configured as an option during SDK initialization, This global value will be used as the default on the operations that use it. When such operations are called, there is a place in each to override the global value, if needed.

For example, you can set `integration_id` to `'workday:HWUTwvyx2wLoSUHphiWVrp28'` at SDK initialization and then you do not have to pass the same value on calls to operations like `delete_integration`. But if you want to do so you may, which will locally override the global setting. See the example code below for a demonstration.


### Available Globals

The following global parameter is available.

| Name           | Type     | Description                                      |
| -------------- | -------- | ------------------------------------------------ |
| integration_id | ::String | ID of the integration you want to interact with. |

### Example

```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.general.delete_integration(integration_id: '<id>', body: Models::Shared::DeleteIntegrationsIntegrationIdRequestBody.new())

unless res.delete_integrations_integration_id_positive_response.nil?
  # handle response
end

```
<!-- End Global Parameters [global-parameters] -->

<!-- Start Error Handling [errors] -->
## Error Handling

Handling errors in this SDK should largely match your expectations. All operations return a response object or raise an error.

By default an API error will raise a `Errors::APIError`, which has the following properties:

| Property       | Type                                    | Description           |
|----------------|-----------------------------------------|-----------------------|
| `message`     | *string*                                 | The error message     |
| `status_code`  | *int*                                   | The HTTP status code  |
| `raw_response` | *Faraday::Response*                     | The raw HTTP response |
| `body`        | *string*                                 | The response content  |

When custom error responses are specified for an operation, the SDK may also throw their associated exception. You can refer to respective *Errors* tables in SDK docs for more details on possible exception types for each operation. For example, the `check_api_key` method throws the following exceptions:

| Error Type                        | Status Code | Content Type     |
| --------------------------------- | ----------- | ---------------- |
| Models::Errors::KomboGeneralError | default     | application/json |
| Errors::APIError                  | 4XX, 5XX    | \*/\*            |

### Example

```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

begin
    res = s.general.check_api_key()

    unless res.get_check_api_key_positive_response.nil?
      # handle response
    end
rescue Models::Errors::KomboGeneralError => e
  # handle e.container data
  raise e
rescue Errors::APIError => e
  # handle default exception
  raise e
end

```
<!-- End Error Handling [errors] -->

<!-- Start Server Selection [server] -->
## Server Selection

### Select Server by Name

You can override the default server globally by passing a server name to the `server (Symbol)` optional parameter when initializing the SDK client instance. The selected server will then be used as the default on the operations that use it. This table lists the names associated with the available servers:

| Name | Server                        | Description     |
| ---- | ----------------------------- | --------------- |
| `eu` | `https://api.kombo.dev/v1`    | Kombo EU Region |
| `us` | `https://api.us.kombo.dev/v1` | Kombo US Region |

#### Example

```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      server: "eu",
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.general.check_api_key()

unless res.get_check_api_key_positive_response.nil?
  # handle response
end

```

### Override Server URL Per-Client

The default server can also be overridden globally by passing a URL to the `server_url (String)` optional parameter when initializing the SDK client instance. For example:
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      server_url: 'https://api.kombo.dev/v1',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.general.check_api_key()

unless res.get_check_api_key_positive_response.nil?
  # handle response
end

```
<!-- End Server Selection [server] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

# Development

## Maturity

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning usage
to a specific package version. This way, you can install the same version each time without breaking changes unless you are intentionally
looking for the latest version.

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation. 
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release. 

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=openapi&utm_campaign=ruby)
