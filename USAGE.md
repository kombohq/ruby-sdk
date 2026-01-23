<!-- Start SDK Example Usage [usage] -->
```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::Kombo.new(
      api_key: '<YOUR_BEARER_TOKEN_HERE>',
    )

res = s.general.check_api_key()

unless res.get_check_api_key_positive_response.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->