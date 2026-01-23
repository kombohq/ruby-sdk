# KomboGeneralError

The standard error response with just the platform error codes.


## Fields

| Field                                                                                         | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `status`                                                                                      | [Models::Components::KomboGeneralErrorStatus](../../models/shared/kombogeneralerrorstatus.md) | :heavy_check_mark:                                                                            | N/A                                                                                           |
| `error`                                                                                       | [Models::Components::KomboGeneralErrorError](../../models/shared/kombogeneralerrorerror.md)   | :heavy_check_mark:                                                                            | Error details with structured code for programmatic handling.                                 |
| `raw_response`                                                                                | [Faraday::Response](https://www.rubydoc.info/gems/faraday/Faraday/Response)                   | :heavy_minus_sign:                                                                            | Raw HTTP response; suitable for custom response parsing                                       |