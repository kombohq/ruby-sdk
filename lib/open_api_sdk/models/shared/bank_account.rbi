# typed: true
# frozen_string_literal: true


class OpenApiSDK::Models::Shared::BankAccount
  extend ::Crystalline::MetadataFields::ClassMethods
end


class OpenApiSDK::Models::Shared::BankAccount
  def iban(); end
  def iban=(str_); end
  def bic(); end
  def bic=(str_); end
  def account_number(); end
  def account_number=(str_); end
  def holder_name(); end
  def holder_name=(str_); end
  def bank_name(); end
  def bank_name=(str_); end
  def domestic_bank_routing(); end
  def domestic_bank_routing=(str_); end
end