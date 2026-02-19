# Assessment

## Overview

### Available Operations

* [get_packages](#get_packages) - Get packages
* [set_packages](#set_packages) - Set packages
* [get_open_orders](#get_open_orders) - Get open orders
* [update_order_result](#update_order_result) - Update order result

## get_packages

Get all available assessment and background check packages for an integration.

This is mainly intended for debugging. As you always need to submit the full list of available packages when using ["set packages"](/assessment/v1/put-packages), there shouldn't ever be a need to call this endpoint in production.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetAssessmentPackages" method="get" path="/assessment/packages" example="example1" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.get_packages

unless res.get_assessment_packages_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                        | Type                                             | Required                                         | Description                                      | Example                                          |
| ------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------ |
| `integration_id`                                 | *T.nilable(::String)*                            | :heavy_minus_sign:                               | ID of the integration you want to interact with. | workday:HWUTwvyx2wLoSUHphiWVrp28                 |

### Response

**[T.nilable(Models::Operations::GetAssessmentPackagesResponse)](../../models/operations/getassessmentpackagesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::KomboAtsError | default                       | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## set_packages

Set packages

Replaces the list of available assessment and or background check packages.

Packages that have been previously submitted through this endpoint but aren't included again will be marked as deleted.

### Example Request Body

```json
{
  "packages": [
    {
      "id": "1001",
      "type": "SKILLS_TEST",
      "name": "TypeScript",
      "description": "TypeScript coding skills assessments"
    },
    {
      "id": "1002",
      "type": "VIDEO_INTERVIEW",
      "name": "Video Interview",
      "description": "Video interview to assess communication skills"
    }
  ]
}
```

### Example Usage: Error Response

<!-- UsageSnippet language="ruby" operationID="PutAssessmentPackages" method="put" path="/assessment/packages" example="Error Response" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.set_packages(body: Models::Shared::PutAssessmentPackagesRequestBody.new(
  packages: []
))

unless res.put_assessment_packages_positive_response.nil?
  # handle response
end

```
### Example Usage: Minimal Error Response

<!-- UsageSnippet language="ruby" operationID="PutAssessmentPackages" method="put" path="/assessment/packages" example="Minimal Error Response" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.set_packages(body: Models::Shared::PutAssessmentPackagesRequestBody.new(
  packages: []
))

unless res.put_assessment_packages_positive_response.nil?
  # handle response
end

```
### Example Usage: example1

<!-- UsageSnippet language="ruby" operationID="PutAssessmentPackages" method="put" path="/assessment/packages" example="example1" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.set_packages(body: Models::Shared::PutAssessmentPackagesRequestBody.new(
  packages: [
    Models::Shared::PutAssessmentPackagesRequestBodyPackage.new(
      id: '1001',
      type: Models::Shared::PutAssessmentPackagesRequestBodyType::SKILLS_TEST,
      name: 'TypeScript',
      description: 'TypeScript coding skills assessments'
    ),
    Models::Shared::PutAssessmentPackagesRequestBodyPackage.new(
      id: '1002',
      type: Models::Shared::PutAssessmentPackagesRequestBodyType::VIDEO_INTERVIEW,
      name: 'Video Interview',
      description: 'Video interview to assess communication skills'
    ),
  ]
))

unless res.put_assessment_packages_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                   | Type                                                                                                        | Required                                                                                                    | Description                                                                                                 | Example                                                                                                     |
| ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `body`                                                                                                      | [Models::Shared::PutAssessmentPackagesRequestBody](../../models/shared/putassessmentpackagesrequestbody.md) | :heavy_check_mark:                                                                                          | PUT /assessment/packages Request body                                                                       |                                                                                                             |
| `integration_id`                                                                                            | *T.nilable(::String)*                                                                                       | :heavy_minus_sign:                                                                                          | ID of the integration you want to interact with.                                                            | workday:HWUTwvyx2wLoSUHphiWVrp28                                                                            |

### Response

**[T.nilable(Models::Operations::PutAssessmentPackagesResponse)](../../models/operations/putassessmentpackagesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::KomboAtsError | default                       | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get_open_orders

Get all open assessment and background check orders of an integration.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetAssessmentOrdersOpen" method="get" path="/assessment/orders/open" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.get_open_orders(page_size: 100)

unless res.get_assessment_orders_open_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                    | Type                                                                                                                         | Required                                                                                                                     | Description                                                                                                                  | Example                                                                                                                      |
| ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `integration_id`                                                                                                             | *T.nilable(::String)*                                                                                                        | :heavy_minus_sign:                                                                                                           | ID of the integration you want to interact with.                                                                             | workday:HWUTwvyx2wLoSUHphiWVrp28                                                                                             |
| `cursor`                                                                                                                     | *T.nilable(::String)*                                                                                                        | :heavy_minus_sign:                                                                                                           | An optional cursor string used for pagination. This can be retrieved from the `next` property of the previous page response. |                                                                                                                              |
| `page_size`                                                                                                                  | *T.nilable(::Integer)*                                                                                                       | :heavy_minus_sign:                                                                                                           | The number of results to return per page. Maximum is 250.                                                                    |                                                                                                                              |

### Response

**[T.nilable(Models::Operations::GetAssessmentOrdersOpenResponse)](../../models/operations/getassessmentordersopenresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::KomboAtsError | default                       | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update_order_result

Updates an assessment or a background check order result.

### Example Request Body

```json
{
  "status": "COMPLETED",
  "score": 90,
  "max_score": 100,
  "result_url": "https://example.com",
  "completed_at": "2023-04-04T00:00:00.000Z",
  "attributes": [
    {
      "type": "TEXT",
      "label": "Role fit",
      "value": "Excellent"
    },
    {
      "type": "SUB_RESULT",
      "id": "<YOUR_INTERNAL_ID_OF_THE_TEST>",
      "label": "Personality test",
      "score": {
        "value": 97,
        "max": 100
      },
      "status": "COMPLETED"
    }
  ],
  "attachments": [
    {
      "name": "Assessment Report.pdf",
      "data": "SGkgdGhlcmUsIEtvbWJvIGlzIGN1cnJlbnRseSBoaXJpbmcgZW5naW5lZXJzIHRoYXQgbG92ZSB0byB3b3JrIG9uIGRldmVsb3BlciBwcm9kdWN0cy4=",
      "content_type": "application/pdf"
    }
  ]
}
```

### Example Usage: Error Response

<!-- UsageSnippet language="ruby" operationID="PutAssessmentOrdersAssessmentOrderIdResult" method="put" path="/assessment/orders/{assessment_order_id}/result" example="Error Response" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.update_order_result(assessment_order_id: '<id>', body: Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBody.new(
  status: Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBodyStatus::CANCELLED,
  result_url: 'https://sour-best-seller.net'
))

unless res.put_assessment_orders_assessment_order_id_result_positive_response.nil?
  # handle response
end

```
### Example Usage: Minimal Error Response

<!-- UsageSnippet language="ruby" operationID="PutAssessmentOrdersAssessmentOrderIdResult" method="put" path="/assessment/orders/{assessment_order_id}/result" example="Minimal Error Response" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.update_order_result(assessment_order_id: '<id>', body: Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBody.new(
  status: Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBodyStatus::CANCELLED,
  result_url: 'https://sour-best-seller.net'
))

unless res.put_assessment_orders_assessment_order_id_result_positive_response.nil?
  # handle response
end

```
### Example Usage: example1

<!-- UsageSnippet language="ruby" operationID="PutAssessmentOrdersAssessmentOrderIdResult" method="put" path="/assessment/orders/{assessment_order_id}/result" example="example1" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
  integration_id: 'workday:HWUTwvyx2wLoSUHphiWVrp28',
  security: Models::Shared::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.assessment.update_order_result(assessment_order_id: 'GRKdd9dibYKKCrmGRSMJf3wu', body: Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBody.new(
  status: Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBodyStatus::COMPLETED,
  result_url: 'https://example.com',
  completed_at: DateTime.iso8601('2023-04-04T00:00:00Z'),
  score: 90.0,
  max_score: 100.0,
  attributes: [
    Models::Shared::AttributeText.new(
      type: 'TEXT',
      label: 'Role fit',
      value: 'Excellent'
    ),
    Models::Shared::AttributeSubResult.new(
      type: 'SUB_RESULT',
      id: '<YOUR_INTERNAL_ID_OF_THE_TEST>',
      label: 'Personality test',
      score: Models::Shared::Score.new(
        value: 97.0,
        max: 100.0
      ),
      status: Models::Shared::AttributeStatus::COMPLETED
    ),
  ],
  attachments: [
    Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBodyAttachment.new(
      name: 'Assessment Report.pdf',
      content_type: 'application/pdf',
      data: 'SGkgdGhlcmUsIEtvbWJvIGlzIGN1cnJlbnRseSBoaXJpbmcgZW5naW5lZXJzIHRoYXQgbG92ZSB0byB3b3JrIG9uIGRldmVsb3BlciBwcm9kdWN0cy4='
    ),
  ]
))

unless res.put_assessment_orders_assessment_order_id_result_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                             | Type                                                                                                                                                  | Required                                                                                                                                              | Description                                                                                                                                           | Example                                                                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `assessment_order_id`                                                                                                                                 | *::String*                                                                                                                                            | :heavy_check_mark:                                                                                                                                    | PUT /assessment/orders/:assessment_order_id/result Parameter                                                                                          |                                                                                                                                                       |
| `body`                                                                                                                                                | [Models::Shared::PutAssessmentOrdersAssessmentOrderIdResultRequestBody](../../models/shared/putassessmentordersassessmentorderidresultrequestbody.md) | :heavy_check_mark:                                                                                                                                    | PUT /assessment/orders/:assessment_order_id/result Request body                                                                                       |                                                                                                                                                       |
| `integration_id`                                                                                                                                      | *T.nilable(::String)*                                                                                                                                 | :heavy_minus_sign:                                                                                                                                    | ID of the integration you want to interact with.                                                                                                      | workday:HWUTwvyx2wLoSUHphiWVrp28                                                                                                                      |

### Response

**[T.nilable(Models::Operations::PutAssessmentOrdersAssessmentOrderIdResultResponse)](../../models/operations/putassessmentordersassessmentorderidresultresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::KomboAtsError | default                       | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |