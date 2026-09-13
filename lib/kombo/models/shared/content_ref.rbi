# typed: true
# frozen_string_literal: true


class Kombo::Models::Shared::ContentRef
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Shared::ContentRef
  def bucket(); end
  def bucket=(str_); end
  def key(); end
  def key=(str_); end
  def type(); end
  def type=(str_); end
end
