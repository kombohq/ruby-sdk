# typed: true
# frozen_string_literal: true


class Kombo::Models::Errors::KomboAtsError
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Errors::KomboAtsError
  def status(); end
  def status=(str_); end
  def error(); end
  def error=(str_); end
  def raw_response(); end
  def raw_response=(str_); end
end