# kombo

Developer-friendly & type-safe Ruby SDK for the [Kombo Unified API](https://docs.kombo.dev/introduction).

<div align="left">
  <a href="https://www.speakeasy.com/?utm_source=kombo&utm_campaign=ruby">
    <img src="https://custom-icon-badges.demolab.com/badge/-built%20with%20speakeasy-212015?style=flat-square&logoColor=FBE331&logo=speakeasy&labelColor=545454" />
  </a>
  <a href="https://rubygems.org/gems/kombo">
    <img src="https://img.shields.io/gem/v/kombo?style=flat-square" />
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square" />
  </a>
</div>

<br />

> [!NOTE]
> The Kombo Ruby SDK is **currently in beta**. The core API structure, methods, and input/output objects are considered stable. We may still make minor adjustments, but all changes will be clearly documented in the changelog. We **do not foresee** any blockers for production use.

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
- [kombo](#kombo)
  - [Table of Contents](#table-of-contents)
  - [SDK Installation](#sdk-installation)
  - [SDK Example Usage](#sdk-example-usage)
    - [Specifying an integration ID](#specifying-an-integration-id)
  - [Region Selection](#region-selection)
      - [Example](#example)
  - [Available Resources and Operations](#available-resources-and-operations)
    - [Assessment](#assessment)
    - [Ats](#ats)
    - [Connect](#connect)
    - [General](#general)
    - [Hris](#hris)
  - [Pagination](#pagination)
  - [Error Handling](#error-handling)
    - [Example](#example-1)
  - [Retries](#retries)
  - [Standalone functions](#standalone-functions)
  - [Custom HTTP Client](#custom-http-client)
  - [Debugging](#debugging)
  - [Requirements](#requirements)
- [Development](#development)
  - [Contributions](#contributions)
    - [SDK Created by Speakeasy](#sdk-created-by-speakeasy)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

The SDK can be installed using [RubyGems](https://rubygems.org/):

```bash
gem install kombo
```
<!-- End SDK Installation [installation] -->

## SDK Example Usage

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

### Specifying an integration ID

The majority of Kombo API endpoints are for interacting with a single "integration" (i.e., a single connection to one of your customers' systems). For these endpoints, specify the `integration_id` when initializing the SDK:

```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>',
  ),
)

res = s.hris.get_employees()

unless res.get_employees_positive_response.nil?
  # handle response
end
```

## Region Selection

The Kombo platform is available in two regions: Europe and United States.

By default, the SDK uses the EU region. If you use the US region (hosted at `api.us.kombo.dev`), set the `server` option when initializing the SDK:

#### Example

```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  server: :us,
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>',
  ),
)
```

You can also override the server URL with the `server_url` option when initializing the client.

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

## Pagination

Some endpoints in this SDK support pagination. See the documentation for individual methods (e.g. `get_integration_fields`) for usage.
<!-- No Pagination [pagination] -->

<!-- Start Error Handling [errors] -->
## Error Handling

All operations return a response object or raise an error. By default, an API error raises `Errors::APIError`, which has:

| Property       | Type                 | Description           |
|----------------|----------------------|-----------------------|
| `message`      | *string*             | The error message     |
| `status_code`  | *int*                | The HTTP status code  |
| `raw_response` | *Faraday::Response*  | The raw HTTP response |
| `body`         | *string*             | The response content  |

When custom error responses are specified for an operation, the SDK may raise the corresponding exception (e.g. `Models::Errors::KomboGeneralError`). See the *Errors* tables in the SDK docs for each operation.

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

## Retries

Some endpoints support retries. When available, the default retry strategy can be overridden per operation or at SDK initialization. See the method documentation for details.
<!-- No Retries [retries] -->

## Standalone functions

Standalone functions are a TypeScript SDK feature. The Ruby SDK uses a single client instance; see [SDK Example Usage](#sdk-example-usage).
<!-- No Standalone functions [standalone-funcs] -->

## Custom HTTP Client

The Ruby SDK uses [Faraday](https://lostisland.github.io/faraday/) for HTTP. You can pass a custom connection when initializing the client if you need to customize behavior.
<!-- No Custom HTTP Client [http-client] -->

## Debugging

You can enable debug logging by configuring your logger and passing it to the SDK client when supported. Be careful not to log secrets (e.g. API keys) in production.
<!-- No Debugging [debug] -->

## Requirements

This SDK supports Ruby 3.0 and above.
<!-- No Requirements [requirements] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

# Development

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation.
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release.

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=kombo&utm_campaign=ruby)

<!-- No Summary [summary] -->
<!-- No SDK Example Usage [usage] -->
<!-- No Authentication [security] -->
<!-- No Global Parameters [global-parameters] -->
<!-- No Server Selection [server] -->
