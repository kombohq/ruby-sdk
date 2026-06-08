# EmploymentStatus

## Example Usage

```ruby
require "kombo"

value = EmploymentStatus::ACTIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = EmploymentStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `ACTIVE`   | ACTIVE     |
| `PENDING`  | PENDING    |
| `INACTIVE` | INACTIVE   |
| `LEAVE`    | LEAVE      |