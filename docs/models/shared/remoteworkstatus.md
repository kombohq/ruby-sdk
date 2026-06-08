# RemoteWorkStatus

## Example Usage

```ruby
require "kombo"

value = RemoteWorkStatus::REMOTE

# Open enum: use .deserialize() to create instances from custom string values
custom = RemoteWorkStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `REMOTE`    | REMOTE      |
| `HYBRID`    | HYBRID      |
| `TEMPORARY` | TEMPORARY   |
| `ON_SITE`   | ON_SITE     |