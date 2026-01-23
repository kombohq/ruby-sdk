# typed: true
# frozen_string_literal: true


class OpenApiSDK::Models::Operations::GetAtsApplicationsRequest
  extend ::Crystalline::MetadataFields::ClassMethods
end


class OpenApiSDK::Models::Operations::GetAtsApplicationsRequest
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
  def outcomes(); end
  def outcomes=(str_); end
  def job_ids(); end
  def job_ids=(str_); end
  def job_remote_ids(); end
  def job_remote_ids=(str_); end
  def current_stage_ids(); end
  def current_stage_ids=(str_); end
  def remote_created_after(); end
  def remote_created_after=(str_); end
  def page_size(); end
  def page_size=(str_); end
  def include_deleted(); end
  def include_deleted=(str_); end
  def ignore_unsupported_filters(); end
  def ignore_unsupported_filters=(str_); end
end