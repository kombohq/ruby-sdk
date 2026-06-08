# IntegrationStateChangedWebhookPayloadSetupStatus

The current status of an integration that has filtering, field mapping features or required setup steps.

## Example Usage

```ruby
require "kombo"

value = IntegrationStateChangedWebhookPayloadSetupStatus::INCOMPLETE
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `INCOMPLETE`         | INCOMPLETE           |
| `FINAL_SYNC_PENDING` | FINAL_SYNC_PENDING   |
| `COMPLETED`          | COMPLETED            |