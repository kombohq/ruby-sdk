# MultipartFormDatum

The data to submit as part of the request body if the request's `Content-Type` is `multipart/form-data`.


## Fields

| Field                                                                           | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `name`                                                                          | *::String*                                                                      | :heavy_check_mark:                                                              | The key of the form data                                                        |
| `value`                                                                         | [T.any(::String, Models::Components::Value)](../../models/shared/valueunion.md) | :heavy_check_mark:                                                              | N/A                                                                             |