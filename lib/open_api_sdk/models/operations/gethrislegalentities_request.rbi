# typed: true
# frozen_string_literal: true


class Kombo::Models::Operations::GetHrisLegalEntitiesRequest
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Operations::GetHrisLegalEntitiesRequest
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
  def name_contains(); end
  def name_contains=(str_); end
  def page_size(); end
  def page_size=(str_); end
  def include_deleted(); end
  def include_deleted=(str_); end
  def ignore_unsupported_filters(); end
  def ignore_unsupported_filters=(str_); end
end