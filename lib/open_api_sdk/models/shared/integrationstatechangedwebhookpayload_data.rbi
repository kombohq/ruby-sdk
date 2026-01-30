# typed: true
# frozen_string_literal: true


class Kombo::Models::Shared::IntegrationStateChangedWebhookPayloadData
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Shared::IntegrationStateChangedWebhookPayloadData
  def integration_tool(); end
  def integration_tool=(str_); end
  def integration_id(); end
  def integration_id=(str_); end
  def integration_category(); end
  def integration_category=(str_); end
  def end_user(); end
  def end_user=(str_); end
  def qa_status(); end
  def qa_status=(str_); end
  def setup_status(); end
  def setup_status=(str_); end
  def state(); end
  def state=(str_); end
  def updated_at(); end
  def updated_at=(str_); end
end