# typed: true
# frozen_string_literal: true


class Kombo::Models::Shared::ShareWith
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Shared::ShareWith
  def users(); end
  def users=(str_); end
  def hiring_team_of(); end
  def hiring_team_of=(str_); end
  def everyone(); end
  def everyone=(str_); end
  def open_note(); end
  def open_note=(str_); end
end
