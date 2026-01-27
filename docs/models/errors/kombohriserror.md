# KomboHrisError

The standard error response with the error codes for the HRIS use case.


## Fields

| Field                                                                               | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `status`                                                                            | [Models::Shared::KomboHrisErrorStatus](../../models/shared/kombohriserrorstatus.md) | :heavy_check_mark:                                                                  | N/A                                                                                 |
| `error`                                                                             | [Models::Shared::KomboHrisErrorError](../../models/shared/kombohriserrorerror.md)   | :heavy_check_mark:                                                                  | Error details with structured code for programmatic handling.                       |
| `raw_response`                                                                      | [Faraday::Response](https://www.rubydoc.info/gems/faraday/Faraday/Response)         | :heavy_minus_sign:                                                                  | Raw HTTP response; suitable for custom response parsing                             |