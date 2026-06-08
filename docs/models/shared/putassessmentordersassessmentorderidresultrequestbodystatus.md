# PutAssessmentOrdersAssessmentOrderIdResultRequestBodyStatus

Status of the assessment.

**Please note the `status` can only be updated to a different value if its current value is `OPEN`.**

## Example Usage

```ruby
require "kombo"

value = PutAssessmentOrdersAssessmentOrderIdResultRequestBodyStatus::COMPLETED
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `COMPLETED` | COMPLETED   |
| `CANCELLED` | CANCELLED   |
| `OPEN`      | OPEN        |