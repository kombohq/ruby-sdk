# typed: true
# frozen_string_literal: true


class OpenApiSDK::Models::Operations::GetAtsJobsRequest
  extend ::Crystalline::MetadataFields::ClassMethods
end


class OpenApiSDK::Models::Operations::GetAtsJobsRequest
  def integration_id(); end
  def integration_id=(str_); end
  def cursor(); end
  def cursor=(str_); end
  def updated_after(); end
  def updated_after=(str_); end
  def ids(); end
  def ids=(str_); end
  def remote_ids(); end
  def remote_ids=(str_); end
  def job_codes(); end
  def job_codes=(str_); end
  def post_url(); end
  def post_url=(str_); end
  def statuses(); end
  def statuses=(str_); end
  def employment_types(); end
  def employment_types=(str_); end
  def visibilities(); end
  def visibilities=(str_); end
  def remote_created_after(); end
  def remote_created_after=(str_); end
  def name_contains(); end
  def name_contains=(str_); end
  def page_size(); end
  def page_size=(str_); end
  def include_deleted(); end
  def include_deleted=(str_); end
  def ignore_unsupported_filters(); end
  def ignore_unsupported_filters=(str_); end
end