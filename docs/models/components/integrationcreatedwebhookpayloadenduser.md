# IntegrationCreatedWebhookPayloadEndUser

Information about the end user who created the integration.


## Fields

| Field                                                               | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `organization_name`                                                 | *::String*                                                          | :heavy_check_mark:                                                  | The name of the organization that owns the integration.             |
| `creator_email`                                                     | *T.nilable(::String)*                                               | :heavy_check_mark:                                                  | The email address of the user who created the integration.          |
| `origin_id`                                                         | *T.nilable(::String)*                                               | :heavy_check_mark:                                                  | The unique identifier of the organization in the integrated system. |