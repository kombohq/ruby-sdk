# Hris

## Overview

### Available Operations

* [get_employees](#get_employees) - Get employees
* [get_employee_form](#get_employee_form) - Get employee form
* [create_employee_with_form](#create_employee_with_form) - Create employee with form
* [add_employee_document](#add_employee_document) - Add document to employee
* [get_employee_document_categories](#get_employee_document_categories) - Get employee document categories
* [get_groups](#get_groups) - Get groups
* [get_employments](#get_employments) - Get employments
* [get_locations](#get_locations) - Get work locations
* [get_absence_types](#get_absence_types) - Get absence types
* [get_time_off_balances](#get_time_off_balances) - Get time off balances
* [get_absences](#get_absences) - Get absences
* [create_absence](#create_absence) - Create absence
* [delete_absence](#delete_absence) - Delete absence
* [get_legal_entities](#get_legal_entities) - Get legal entities
* [get_timesheets](#get_timesheets) - Get timesheets
* [get_performance_review_cycles](#get_performance_review_cycles) - Get performance review cycles
* [get_performance_reviews](#get_performance_reviews) - Get performance reviews

## get_employees

Retrieve all employees.

<Note>Not interested in most fields? You can use our [our Scopes feature](/scopes) to customize what data points are synced.</Note>

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisEmployees" method="get" path="/hris/employees" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisEmployeesRequest.new()

res = s.hris.get_employees(request: req)

unless res.get_hris_employees_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `request`                                                                                         | [Models::Operations::GetHrisEmployeesRequest](../../models/operations/gethrisemployeesrequest.md) | :heavy_check_mark:                                                                                | The request object to use for the request.                                                        |

### Response

**[T.nilable(Models::Operations::GetHrisEmployeesResponse)](../../models/operations/gethrisemployeesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_employee_form

Get the form for creating an employee. This form can be rendered dynamically on your frontend to allow your customers to create employees in their HRIS.

Follow our [create employee guide here](/hris/features/create-employee) to learn how this form is generated and how you can use it.

### Example Form
```json
{
  "properties": {
    "firstName": {
      "type": "text",
      "label": "First Name",
      "required": true,
      "description": "Employee's first name",
      "unified_key": "first_name",
      "min_length": 1,
      "max_length": 100
    },
    "startDate": {
      "type": "date",
      "label": "Start Date",
      "required": true,
      "description": "Employee's start date",
      "unified_key": "start_date"
    },
    "workLocation": {
      "type": "object",
      "label": "Work Location",
      "required": false,
      "description": "Employee's work location",
      "unified_key": null,
      "properties": {
        "site": {
          "type": "single_select",
          "label": "Site",
          "required": true,
          "description": "Employee's site",
          "unified_key": null,
          "options": {
            "type": "inline",
            "entries": [
              {
                "label": "Site 1",
                "id": "FXrER44xubBqA9DLgZ3PFNNx",
                "unified_value": "1",
                "remote_id": "site_1"
              },
              {
                "label": "Site 2",
                "id": "2rv75UKT2XBoQXsUb9agiTUm",
                "unified_value": "2",
                "remote_id": "site_2"
              }
            ]
          }
        },
        "keyNumbers": {
          "type": "array",
          "label": "Key Numbers",
          "required": false,
          "description": "Employee's key numbers",
          "unified_key": null,
          "min_items": 2,
          "max_items": 5,
          "item_type": {
            "type": "number",
            "label": "Key Number",
            "required": false,
            "description": "The number of the keys which belong to the employee",
            "unified_key": null,
            "min": 0,
            "max": 99
          }
        }
      }
    }
  }
}
```

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisEmployeesForm" method="get" path="/hris/employees/form" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.hris.get_employee_form()

unless res.get_hris_employees_form_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                        | Type                                             | Required                                         | Description                                      | Example                                          |
| ------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------ |
| `integration_id`                                 | *T.nilable(::String)*                            | :heavy_minus_sign:                               | ID of the integration you want to interact with. | workday:HWUTwvyx2wLoSUHphiWVrp28                 |

### Response

**[T.nilable(Models::Operations::GetHrisEmployeesFormResponse)](../../models/operations/gethrisemployeesformresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## create_employee_with_form

Create an employee, based on the form schema.

<Note>
  This endpoint requires the permission **Create and manage employees** to be enabled in [your scope config](/scopes).
</Note>

### Example Request Body

```json
{
  "properties": {
    "firstName": "John",
    "startDate": "2025-01-01",
    "workLocation": {
      "site": "8e422bf8cav",
      "keyNumbers": [
        142,
        525,
        63
      ]
    }
  }
}
```

### Example Usage

<!-- UsageSnippet language="ruby" operationID="PostHrisEmployeesForm" method="post" path="/hris/employees/form" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.hris.create_employee_with_form(body: Models::Shared::PostHrisEmployeesFormRequestBody.new(
  properties: {
    "firstName": 'John',
    "startDate": '2025-01-01T00:00:00Z',
    "workLocation": {
      "site": '8e422bf8cav',
      "keyNumbers": {
        "0": 142.0,
        "1": 525.0,
        "2": 63.0,
      },
    },
  },
))

unless res.post_hris_employees_form_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                   | Type                                                                                                        | Required                                                                                                    | Description                                                                                                 | Example                                                                                                     |
| ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `body`                                                                                                      | [Models::Shared::PostHrisEmployeesFormRequestBody](../../models/shared/posthrisemployeesformrequestbody.md) | :heavy_check_mark:                                                                                          | POST /hris/employees/form Request body                                                                      |                                                                                                             |
| `integration_id`                                                                                            | *T.nilable(::String)*                                                                                       | :heavy_minus_sign:                                                                                          | ID of the integration you want to interact with.                                                            | workday:HWUTwvyx2wLoSUHphiWVrp28                                                                            |

### Response

**[T.nilable(Models::Operations::PostHrisEmployeesFormResponse)](../../models/operations/posthrisemployeesformresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## add_employee_document

Uploads an document file for the specified employee.

<Note>
  This endpoint requires the permission **Manage documents** to be enabled in [your scope config](/scopes).
</Note>

### Example Request Body

```json
{
  "category_id": "3Cjwu7nA7pH5cX5X1NAPmb7M",
  "document": {
    "name": "Frank Doe Employment Contract.txt",
    "data": "SGkgdGhlcmUsIEtvbWJvIGlzIGN1cnJlbnRseSBoaXJpbmcgZW5naW5lZXJzIHRoYXQgbG92ZSB0byB3b3JrIG9uIGRldmVsb3BlciBwcm9kdWN0cy4=",
    "content_type": "text/plain"
  }
}
```

### Example Usage

<!-- UsageSnippet language="ruby" operationID="PostHrisEmployeesEmployeeIdDocuments" method="post" path="/hris/employees/{employee_id}/documents" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.hris.add_employee_document(employee_id: 'GRKdd9dibYKKCrmGRSMJf3wu', body: Models::Shared::PostHrisEmployeesEmployeeIdDocumentsRequestBody.new(
  category_id: '3Cjwu7nA7pH5cX5X1NAPmb7M',
  document: Models::Shared::Document.new(
    name: 'Frank Doe Employment Contract.txt',
    content_type: 'text/plain',
    data: 'SGkgdGhlcmUsIEtvbWJvIGlzIGN1cnJlbnRseSBoaXJpbmcgZW5naW5lZXJzIHRoYXQgbG92ZSB0byB3b3JrIG9uIGRldmVsb3BlciBwcm9kdWN0cy4=',
  ),
))

unless res.post_hris_employees_employee_id_documents_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                 | Type                                                                                                                                      | Required                                                                                                                                  | Description                                                                                                                               | Example                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `employee_id`                                                                                                                             | *::String*                                                                                                                                | :heavy_check_mark:                                                                                                                        | POST /hris/employees/:employee_id/documents Parameter                                                                                     |                                                                                                                                           |
| `body`                                                                                                                                    | [Models::Shared::PostHrisEmployeesEmployeeIdDocumentsRequestBody](../../models/shared/posthrisemployeesemployeeiddocumentsrequestbody.md) | :heavy_check_mark:                                                                                                                        | POST /hris/employees/:employee_id/documents Request body                                                                                  |                                                                                                                                           |
| `integration_id`                                                                                                                          | *T.nilable(::String)*                                                                                                                     | :heavy_minus_sign:                                                                                                                        | ID of the integration you want to interact with.                                                                                          | workday:HWUTwvyx2wLoSUHphiWVrp28                                                                                                          |

### Response

**[T.nilable(Models::Operations::PostHrisEmployeesEmployeeIdDocumentsResponse)](../../models/operations/posthrisemployeesemployeeiddocumentsresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_employee_document_categories

Get employee document categories.

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisEmployeeDocumentCategories" method="get" path="/hris/employee-document-categories" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisEmployeeDocumentCategoriesRequest.new()

res = s.hris.get_employee_document_categories(request: req)

unless res.get_hris_employee_document_categories_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                           | Type                                                                                                                                | Required                                                                                                                            | Description                                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                           | [Models::Operations::GetHrisEmployeeDocumentCategoriesRequest](../../models/operations/gethrisemployeedocumentcategoriesrequest.md) | :heavy_check_mark:                                                                                                                  | The request object to use for the request.                                                                                          |

### Response

**[T.nilable(Models::Operations::GetHrisEmployeeDocumentCategoriesResponse)](../../models/operations/gethrisemployeedocumentcategoriesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_groups

Retrieve all "groups" (teams, departments, and cost centers).

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisGroups" method="get" path="/hris/groups" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisGroupsRequest.new()

res = s.hris.get_groups(request: req)

unless res.get_hris_groups_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::GetHrisGroupsRequest](../../models/operations/gethrisgroupsrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::GetHrisGroupsResponse)](../../models/operations/gethrisgroupsresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_employments

Retrieve all employments.

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisEmployments" method="get" path="/hris/employments" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisEmploymentsRequest.new()

res = s.hris.get_employments(request: req)

unless res.get_hris_employments_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::GetHrisEmploymentsRequest](../../models/operations/gethrisemploymentsrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::GetHrisEmploymentsResponse)](../../models/operations/gethrisemploymentsresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_locations

Retrieve all work locations.

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisLocations" method="get" path="/hris/locations" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisLocationsRequest.new()

res = s.hris.get_locations(request: req)

unless res.get_hris_locations_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `request`                                                                                         | [Models::Operations::GetHrisLocationsRequest](../../models/operations/gethrislocationsrequest.md) | :heavy_check_mark:                                                                                | The request object to use for the request.                                                        |

### Response

**[T.nilable(Models::Operations::GetHrisLocationsResponse)](../../models/operations/gethrislocationsresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_absence_types

Retrieve all absence types.

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisAbsenceTypes" method="get" path="/hris/absence-types" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisAbsenceTypesRequest.new()

res = s.hris.get_absence_types(request: req)

unless res.get_hris_absence_types_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                               | Type                                                                                                    | Required                                                                                                | Description                                                                                             |
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `request`                                                                                               | [Models::Operations::GetHrisAbsenceTypesRequest](../../models/operations/gethrisabsencetypesrequest.md) | :heavy_check_mark:                                                                                      | The request object to use for the request.                                                              |

### Response

**[T.nilable(Models::Operations::GetHrisAbsenceTypesResponse)](../../models/operations/gethrisabsencetypesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_time_off_balances

Retrieve all time off balances.

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisTimeOffBalances" method="get" path="/hris/time-off-balances" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisTimeOffBalancesRequest.new()

res = s.hris.get_time_off_balances(request: req)

unless res.get_hris_time_off_balances_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                     | Type                                                                                                          | Required                                                                                                      | Description                                                                                                   |
| ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                     | [Models::Operations::GetHrisTimeOffBalancesRequest](../../models/operations/gethristimeoffbalancesrequest.md) | :heavy_check_mark:                                                                                            | The request object to use for the request.                                                                    |

### Response

**[T.nilable(Models::Operations::GetHrisTimeOffBalancesResponse)](../../models/operations/gethristimeoffbalancesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_absences

Retrieve all absences.

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisAbsences" method="get" path="/hris/absences" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisAbsencesRequest.new()

res = s.hris.get_absences(request: req)

unless res.get_hris_absences_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Operations::GetHrisAbsencesRequest](../../models/operations/gethrisabsencesrequest.md) | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |

### Response

**[T.nilable(Models::Operations::GetHrisAbsencesResponse)](../../models/operations/gethrisabsencesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## create_absence

Create a new absence.

Check [this page](/hris/features/creating-absences) for a detailed guide.

<Note>
  This endpoint requires the permission **Manage absences** to be enabled in [your scope config](/scopes).
</Note>

### Example Request Body

```json
{
  "employee_id": "wXJMxwDvPAjrJ4CyqdV9",
  "absence_type_id": "3YKtQ7qedsrcCady1jSyAkY1",
  "start_date": "2019-09-17",
  "end_date": "2019-09-21",
  "start_time": "08:30:00",
  "end_time": "16:00:00",
  "start_half_day": false,
  "end_half_day": false,
  "employee_note": "Visiting the aliens"
}
```

### Example Usage

<!-- UsageSnippet language="ruby" operationID="PostHrisAbsences" method="post" path="/hris/absences" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.hris.create_absence(body: Models::Shared::PostHrisAbsencesRequestBody.new(
  employee_id: 'wXJMxwDvPAjrJ4CyqdV9',
  absence_type_id: '3YKtQ7qedsrcCady1jSyAkY1',
  start_date: DateTime.iso8601('2019-09-17T00:00:00Z'),
  end_date: DateTime.iso8601('2019-09-21T00:00:00Z'),
  employee_note: 'Visiting the aliens',
  start_time: '08:30:00',
  end_time: '16:00:00',
))

unless res.post_hris_absences_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       | Example                                                                                           |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `body`                                                                                            | [Models::Shared::PostHrisAbsencesRequestBody](../../models/shared/posthrisabsencesrequestbody.md) | :heavy_check_mark:                                                                                | POST /hris/absences Request body                                                                  |                                                                                                   |
| `integration_id`                                                                                  | *T.nilable(::String)*                                                                             | :heavy_minus_sign:                                                                                | ID of the integration you want to interact with.                                                  | workday:HWUTwvyx2wLoSUHphiWVrp28                                                                  |

### Response

**[T.nilable(Models::Operations::PostHrisAbsencesResponse)](../../models/operations/posthrisabsencesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## delete_absence

Delete this absence.

<Note>
  This endpoint requires the permission **Manage absences** to be enabled in [your scope config](/scopes).
</Note>

### Example Request Body

```json
{
  "absence_id": "wXJMxwDvPAjrJ4CyqdV9"
}
```

### Example Usage

<!-- UsageSnippet language="ruby" operationID="DeleteHrisAbsencesAbsenceId" method="delete" path="/hris/absences/{absence_id}" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.hris.delete_absence(absence_id: 'wXJMxwDvPAjrJ4CyqdV9', body: Models::Shared::DeleteHrisAbsencesAbsenceIdRequestBody.new())

unless res.delete_hris_absences_absence_id_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                               | Type                                                                                                                    | Required                                                                                                                | Description                                                                                                             | Example                                                                                                                 |
| ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `absence_id`                                                                                                            | *::String*                                                                                                              | :heavy_check_mark:                                                                                                      | The Kombo ID of the absence                                                                                             |                                                                                                                         |
| `body`                                                                                                                  | [Models::Shared::DeleteHrisAbsencesAbsenceIdRequestBody](../../models/shared/deletehrisabsencesabsenceidrequestbody.md) | :heavy_check_mark:                                                                                                      | DELETE /hris/absences/:absence_id Request body                                                                          |                                                                                                                         |
| `integration_id`                                                                                                        | *T.nilable(::String)*                                                                                                   | :heavy_minus_sign:                                                                                                      | ID of the integration you want to interact with.                                                                        | workday:HWUTwvyx2wLoSUHphiWVrp28                                                                                        |

### Response

**[T.nilable(Models::Operations::DeleteHrisAbsencesAbsenceIdResponse)](../../models/operations/deletehrisabsencesabsenceidresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_legal_entities

Retrieve all legal entites.

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisLegalEntities" method="get" path="/hris/legal-entities" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisLegalEntitiesRequest.new()

res = s.hris.get_legal_entities(request: req)

unless res.get_hris_legal_entities_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                 | [Models::Operations::GetHrisLegalEntitiesRequest](../../models/operations/gethrislegalentitiesrequest.md) | :heavy_check_mark:                                                                                        | The request object to use for the request.                                                                |

### Response

**[T.nilable(Models::Operations::GetHrisLegalEntitiesResponse)](../../models/operations/gethrislegalentitiesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_timesheets

Get timesheets

Retrieve attendance data and timesheets from HRIS tools.

<Warning>**Open Beta Feature:** This endpoint is currently in beta. Please reach out to our support team if you need assistance with implementation.</Warning>

For a detailed explanation of the data model, validation rules, time zones, payable hours, approvals, and break patterns, see the [Time & Attendance guide](/hris/features/time-and-attendance).

Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisTimesheets" method="get" path="/hris/timesheets" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisTimesheetsRequest.new()

res = s.hris.get_timesheets(request: req)

unless res.get_hris_timesheets_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::GetHrisTimesheetsRequest](../../models/operations/gethristimesheetsrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::GetHrisTimesheetsResponse)](../../models/operations/gethristimesheetsresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_performance_review_cycles

Get performance review cycles

Retrieve performance review cycles data from HRIS tools.

<Warning>**Open Beta Feature:** This endpoint is currently in beta. Please reach out to our support team if you need assistance with implementation.</Warning>



Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisPerformanceReviewCycles" method="get" path="/hris/performance-review-cycles" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisPerformanceReviewCyclesRequest.new()

res = s.hris.get_performance_review_cycles(request: req)

unless res.get_hris_performance_review_cycles_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                     | Type                                                                                                                          | Required                                                                                                                      | Description                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                     | [Models::Operations::GetHrisPerformanceReviewCyclesRequest](../../models/operations/gethrisperformancereviewcyclesrequest.md) | :heavy_check_mark:                                                                                                            | The request object to use for the request.                                                                                    |

### Response

**[T.nilable(Models::Operations::GetHrisPerformanceReviewCyclesResponse)](../../models/operations/gethrisperformancereviewcyclesresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |

## get_performance_reviews

Get performance reviews

Retrieve performance review data from HRIS tools.

<Warning>**Open Beta Feature:** This endpoint is currently in beta. Please reach out to our support team if you need assistance with implementation.</Warning>



Top level filters use AND, while individual filters use OR if they accept multiple arguments. That means filters will be resolved like this: `(id IN ids) AND (remote_id IN remote_ids)`

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetHrisPerformanceReviews" method="get" path="/hris/performance-reviews" -->
```ruby
require 'kombo'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Operations::GetHrisPerformanceReviewsRequest.new()

res = s.hris.get_performance_reviews(request: req)

unless res.get_hris_performance_reviews_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                           | Type                                                                                                                | Required                                                                                                            | Description                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                           | [Models::Operations::GetHrisPerformanceReviewsRequest](../../models/operations/gethrisperformancereviewsrequest.md) | :heavy_check_mark:                                                                                                  | The request object to use for the request.                                                                          |

### Response

**[T.nilable(Models::Operations::GetHrisPerformanceReviewsResponse)](../../models/operations/gethrisperformancereviewsresponse.md)**

### Errors

| Error Type                     | Status Code                    | Content Type                   |
| ------------------------------ | ------------------------------ | ------------------------------ |
| Models::Errors::KomboHrisError | default                        | application/json               |
| Errors::APIError               | 4XX, 5XX                       | \*/\*                          |