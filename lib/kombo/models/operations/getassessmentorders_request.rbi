# typed: true
# frozen_string_literal: true


class Kombo::Models::Operations::GetAssessmentOrdersRequest
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Operations::GetAssessmentOrdersRequest
  def integration_id(); end
  def integration_id=(str_); end
  def cursor(); end
  def cursor=(str_); end
  def ids(); end
  def ids=(str_); end
  def statuses(); end
  def statuses=(str_); end
  def created_after(); end
  def created_after=(str_); end
  def page_size(); end
  def page_size=(str_); end
end