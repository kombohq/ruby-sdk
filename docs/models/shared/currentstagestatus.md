# CurrentStageStatus

Whether the application stage is active in the ATS. Inactive stages (also e.g., archived or hidden) may still be referenced by existing applications but are typically not part of the current hiring workflow.

## Example Usage

```ruby
require "kombo"

value = CurrentStageStatus::ACTIVE
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `ACTIVE`   | ACTIVE     |
| `INACTIVE` | INACTIVE   |