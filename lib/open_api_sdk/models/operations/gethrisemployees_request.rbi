# typed: true
# frozen_string_literal: true


class OpenApiSDK::Models::Operations::GetHrisEmployeesRequest
  extend ::Crystalline::MetadataFields::ClassMethods
end


class OpenApiSDK::Models::Operations::GetHrisEmployeesRequest
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
  def employment_statuses(); end
  def employment_statuses=(str_); end
  def group_ids(); end
  def group_ids=(str_); end
  def legal_entity_ids(); end
  def legal_entity_ids=(str_); end
  def work_location_ids(); end
  def work_location_ids=(str_); end
  def work_emails(); end
  def work_emails=(str_); end
  def personal_emails(); end
  def personal_emails=(str_); end
  def custom_fields(); end
  def custom_fields=(str_); end
  def page_size(); end
  def page_size=(str_); end
  def include_deleted(); end
  def include_deleted=(str_); end
  def ignore_unsupported_filters(); end
  def ignore_unsupported_filters=(str_); end
end