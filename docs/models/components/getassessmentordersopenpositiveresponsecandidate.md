# GetAssessmentOrdersOpenPositiveResponseCandidate

Information about the candidate taking the assessment.


## Fields

| Field                                                | Type                                                 | Required                                             | Description                                          | Example                                              |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| `remote_id`                                          | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's identifier in the integrated system. | 12345                                                |
| `email`                                              | *::String*                                           | :heavy_check_mark:                                   | The candidate's email address.                       | john.doe@gmail.com                                   |
| `first_name`                                         | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's first name.                          | John                                                 |
| `last_name`                                          | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's last name.                           | Doe                                                  |
| `phone`                                              | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's phone number.                        | +1 123 456 7890                                      |