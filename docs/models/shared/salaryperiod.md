# SalaryPeriod

## Example Usage

```ruby
require "kombo"

value = SalaryPeriod::YEAR

# Open enum: use .deserialize() to create instances from custom string values
custom = SalaryPeriod.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `YEAR`      | YEAR        |
| `MONTH`     | MONTH       |
| `TWO_WEEKS` | TWO_WEEKS   |
| `WEEK`      | WEEK        |
| `DAY`       | DAY         |
| `HOUR`      | HOUR        |