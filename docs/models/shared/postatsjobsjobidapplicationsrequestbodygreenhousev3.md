# PostAtsJobsJobIdApplicationsRequestBodyGreenhousev3

Fields specific to Greenhouse V3 (OAuth-based connector).


## Fields

| Field                                                                                     | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `candidate`                                                                               | T::Hash[Symbol, *::Object*]                                                               | :heavy_minus_sign:                                                                        | Additional fields passed through to Greenhouse V3's `POST /v3/candidates` request body.   |
| `application`                                                                             | T::Hash[Symbol, *::Object*]                                                               | :heavy_minus_sign:                                                                        | Additional fields passed through to Greenhouse V3's `POST /v3/applications` request body. |