# PostForceSyncPositiveResponseType

The type of the triggered sync. May differ from request, if the integration does not support delta syncs or if another sync is already running.

## Example Usage

```ruby
require "kombo"

value = PostForceSyncPositiveResponseType::FULL
```


## Values

| Name    | Value   |
| ------- | ------- |
| `FULL`  | FULL    |
| `DELTA` | DELTA   |