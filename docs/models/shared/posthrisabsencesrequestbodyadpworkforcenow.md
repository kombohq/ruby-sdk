# PostHrisAbsencesRequestBodyAdpworkforcenow

Fields specific to ADP Workforce Now.


## Fields

| Field                                                                           | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `employment_id`                                                                 | *T.nilable(::String)*                                                           | :heavy_minus_sign:                                                              | [Required] The employment ID of the employee that the absence will be added to. |
| `paid_leave`                                                                    | *T.nilable(T::Boolean)*                                                         | :heavy_minus_sign:                                                              | Whether the absence is paid or not.                                             |