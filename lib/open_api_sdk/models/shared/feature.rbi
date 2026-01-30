# typed: true
# frozen_string_literal: true


class Kombo::Models::Shared::Feature
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Shared::Feature
  def id(); end
  def id=(str_); end
  def label(); end
  def label=(str_); end
  def coverage_status(); end
  def coverage_status=(str_); end
end