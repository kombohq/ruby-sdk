# IssueStatusChangedWebhookPayloadData


## Fields

| Field                                                                        | Type                                                                         | Required                                                                     | Description                                                                  |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `change`                                                                     | [Models::Shared::Change](../../models/shared/change.md)                      | :heavy_check_mark:                                                           | Why this webhook was sent: the issue was raised or resolved.                 |
| `issue`                                                                      | [Models::Shared::Issue](../../models/shared/issue.md)                        | :heavy_check_mark:                                                           | N/A                                                                          |
| `integration`                                                                | [T.nilable(Models::Shared::Integration)](../../models/shared/integration.md) | :heavy_check_mark:                                                           | The integration this issue belongs to. `null` for environment-wide issues.   |