# PostConnectCreateLinkPositiveResponseData


## Fields

| Field                                                                               | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `link`                                                                              | *::String*                                                                          | :heavy_check_mark:                                                                  | N/A                                                                                 |
| `static_ips`                                                                        | T::Array<*::String*>                                                                | :heavy_minus_sign:                                                                  | The allowlist IPs for this integration. Present when `enable_static_ips` is `true`. |