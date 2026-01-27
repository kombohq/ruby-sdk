# KomboAtsError

The standard error response with the error codes for the ATS use case.


## Fields

| Field                                                                             | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `status`                                                                          | [Models::Shared::KomboAtsErrorStatus](../../models/shared/komboatserrorstatus.md) | :heavy_check_mark:                                                                | N/A                                                                               |
| `error`                                                                           | [Models::Shared::KomboAtsErrorError](../../models/shared/komboatserrorerror.md)   | :heavy_check_mark:                                                                | Error details with structured code for programmatic handling.                     |
| `raw_response`                                                                    | [Faraday::Response](https://www.rubydoc.info/gems/faraday/Faraday/Response)       | :heavy_minus_sign:                                                                | Raw HTTP response; suitable for custom response parsing                           |