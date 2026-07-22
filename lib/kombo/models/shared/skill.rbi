# typed: true
# frozen_string_literal: true


class Kombo::Models::Shared::Skill
  extend ::Crystalline::MetadataFields::ClassMethods
end


class Kombo::Models::Shared::Skill
  def skill_id(); end
  def skill_id=(str_); end
  def skill(); end
  def skill=(str_); end
  def expected_proficiency(); end
  def expected_proficiency=(str_); end
end
