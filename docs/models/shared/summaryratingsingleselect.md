# SummaryRatingSingleSelect


## Fields

| Field                                                        | Type                                                         | Required                                                     | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `type`                                                       | *::String*                                                   | :heavy_check_mark:                                           | N/A                                                          |
| `ordered_options`                                            | T::Array<*::String*>                                         | :heavy_check_mark:                                           | The options of the summary rating. Ordered from bad to good. |
| `value`                                                      | *T.nilable(::String)*                                        | :heavy_check_mark:                                           | The text value of the summary rating.                        |