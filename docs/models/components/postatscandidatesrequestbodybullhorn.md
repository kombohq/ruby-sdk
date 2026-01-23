# PostAtsCandidatesRequestBodyBullhorn

Fields specific to Bullhorn.


## Fields

| Field                                                                  | Type                                                                   | Required                                                               | Description                                                            |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `candidate`                                                            | T::Hash[Symbol, *::Object*]                                            | :heavy_minus_sign:                                                     | Fields that we will pass through to Bullhorn's `Candidate` object.     |
| `job_submission`                                                       | T::Hash[Symbol, *::Object*]                                            | :heavy_minus_sign:                                                     | Fields that we will pass through to Bullhorn's `JobSubmission` object. |