# typed: true
# frozen_string_literal: true


class Kombo::Models::Shared::Issue
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Shared::Issue
  def id(); end
  def id=(str_); end
  def type(); end
  def type=(str_); end
  def title(); end
  def title=(str_); end
  def status(); end
  def status=(str_); end
  def markdown_message(); end
  def markdown_message=(str_); end
  def first_observed_at(); end
  def first_observed_at=(str_); end
  def resolved_at(); end
  def resolved_at=(str_); end
end
