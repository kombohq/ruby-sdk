# typed: true
# frozen_string_literal: true


class Kombo::Models::Shared::Security
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Shared::Security
  def api_key(); end
  def api_key=(str_); end
end