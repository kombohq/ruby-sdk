# Connect

## Overview

### Available Operations

* [create_connection_link](#create_connection_link) - Create connection link
* [get_integration_by_token](#get_integration_by_token) - Get integration by token

## create_connection_link

Generate a unique link that allows your user to enter the embedded Kombo Connect flow.

> Check out [our full guide](/connect/embedded-flow) for more details about implementing the connection flow into your app.

> Kombo will not deduplicate integrations for you that are created with this endpoint. You are responsible for keeping track of integrations in your system and prevent customers from connecting the same tool again. Use the [reconnection link](/v1/post-integrations-integration-id-relink) endpoint if you want a customer to update their credentials.

### Example Request Body

```json
{
  "end_user_email": "test@example.com",
  "end_user_organization_name": "Test Inc.",
  "integration_category": "HRIS",
  "integration_tool": "personio",
  "end_user_origin_id": "123",
  "language": "en",
  "link_type": "EMBEDDED"
}
```

### Example Usage: Error Response

<!-- UsageSnippet language="ruby" operationID="PostConnectCreateLink" method="post" path="/connect/create-link" example="Error Response" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Shared::PostConnectCreateLinkRequestBody.new(
  end_user_email: 'Abraham55@gmail.com',
  end_user_organization_name: '<value>',
)

res = s.connect.create_connection_link(request: req)

unless res.post_connect_create_link_positive_response.nil?
  # handle response
end

```
### Example Usage: Minimal Error Response

<!-- UsageSnippet language="ruby" operationID="PostConnectCreateLink" method="post" path="/connect/create-link" example="Minimal Error Response" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Shared::PostConnectCreateLinkRequestBody.new(
  end_user_email: 'Abraham55@gmail.com',
  end_user_organization_name: '<value>',
)

res = s.connect.create_connection_link(request: req)

unless res.post_connect_create_link_positive_response.nil?
  # handle response
end

```
### Example Usage: example1

<!-- UsageSnippet language="ruby" operationID="PostConnectCreateLink" method="post" path="/connect/create-link" example="example1" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

req = Models::Shared::PostConnectCreateLinkRequestBody.new(
  end_user_email: 'test@example.com',
  end_user_organization_name: 'Test Inc.',
  end_user_origin_id: '123',
  integration_tool: Models::Shared::IntegrationTool::PERSONIO,
)

res = s.connect.create_connection_link(request: req)

unless res.post_connect_create_link_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                   | Type                                                                                                        | Required                                                                                                    | Description                                                                                                 |
| ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                   | [Models::Shared::PostConnectCreateLinkRequestBody](../../models/shared/postconnectcreatelinkrequestbody.md) | :heavy_check_mark:                                                                                          | The request object to use for the request.                                                                  |

### Response

**[T.nilable(Models::Operations::PostConnectCreateLinkResponse)](../../models/operations/postconnectcreatelinkresponse.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::KomboGeneralError | default                           | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## get_integration_by_token

Use this endpoint with the token you get from the connection flow to retrieve information about the created integration.

  It works in a similar way as the OAuth2 code flow to securely retrieve information and connect the integration to your user.

> Check out [our full guide](/connect/embedded-flow) for more details about implementing the connection flow into your app.

This endpoint is used to ensure users can't trick your system connecting their
account in your system to another customers integration. You don't get the integration ID
from the `showKomboConnect(link)` function but only the short lived token used
for this endpoint so that users can't send you arbitrary data that you would put
into your system.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="GetConnectIntegrationByTokenToken" method="get" path="/connect/integration-by-token/{token}" example="example1" -->
```ruby
require 'kombo'

Models = ::Kombo::Models
s = ::Kombo::Kombo.new(
      security: Models::Shared::Security.new(
        api_key: '<YOUR_BEARER_TOKEN_HERE>',
      ),
    )

res = s.connect.get_integration_by_token(token: '<value>')

unless res.get_connect_integration_by_token_token_positive_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                          | Type                                               | Required                                           | Description                                        |
| -------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------- |
| `token`                                            | *::String*                                         | :heavy_check_mark:                                 | GET /connect/integration-by-token/:token Parameter |

### Response

**[T.nilable(Models::Operations::GetConnectIntegrationByTokenTokenResponse)](../../models/operations/getconnectintegrationbytokentokenresponse.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::KomboGeneralError | default                           | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |