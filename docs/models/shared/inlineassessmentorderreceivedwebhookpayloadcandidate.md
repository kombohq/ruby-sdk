# InlineAssessmentOrderReceivedWebhookPayloadCandidate

Information about the candidate taking the assessment.


## Fields

| Field                                                | Type                                                 | Required                                             | Description                                          |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| `remote_id`                                          | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's identifier in the integrated system. |
| `email`                                              | *::String*                                           | :heavy_check_mark:                                   | The candidate's email address.                       |
| `first_name`                                         | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's first name.                          |
| `last_name`                                          | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's last name.                           |
| `phone`                                              | *T.nilable(::String)*                                | :heavy_minus_sign:                                   | The candidate's phone number.                        |