# KomboPassthroughError

The standard error response with the error codes for the passthrough API.


## Fields

| Field                                                                                             | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `status`                                                                                          | [Models::Shared::KomboPassthroughErrorStatus](../../models/shared/kombopassthrougherrorstatus.md) | :heavy_check_mark:                                                                                | N/A                                                                                               |
| `error`                                                                                           | [Models::Shared::KomboPassthroughErrorError](../../models/shared/kombopassthrougherrorerror.md)   | :heavy_check_mark:                                                                                | Error details with structured code for programmatic handling.                                     |
| `raw_response`                                                                                    | [Faraday::Response](https://www.rubydoc.info/gems/faraday/Faraday/Response)                       | :heavy_minus_sign:                                                                                | Raw HTTP response; suitable for custom response parsing                                           |