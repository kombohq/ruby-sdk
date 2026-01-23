# typed: true
# frozen_string_literal: true


class OpenApiSDK::Models::Operations::GetHrisAbsenceTypesRequest
  extend ::Crystalline::MetadataFields::ClassMethods
end


class OpenApiSDK::Models::Operations::GetHrisAbsenceTypesRequest
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
  def page_size(); end
  def page_size=(str_); end
  def include_deleted(); end
  def include_deleted=(str_); end
  def ignore_unsupported_filters(); end
  def ignore_unsupported_filters=(str_); end
end