# MaritalStatus

## Example Usage

```ruby
require "kombo"

value = MaritalStatus::SINGLE

# Open enum: use .deserialize() to create instances from custom string values
custom = MaritalStatus.deserialize("custom_value")
```


## Values

| Name                   | Value                  |
| ---------------------- | ---------------------- |
| `SINGLE`               | SINGLE                 |
| `MARRIED`              | MARRIED                |
| `DOMESTIC_PARTNERSHIP` | DOMESTIC_PARTNERSHIP   |
| `WIDOWED`              | WIDOWED                |
| `DIVORCED`             | DIVORCED               |
| `SEPARATED`            | SEPARATED              |
| `NOT_MARRIED`          | NOT_MARRIED            |