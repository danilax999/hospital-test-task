# frozen_string_literal: true

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if (regexp =~ value)&.zero?

    record.errors.add attribute, 'has unsupported format'
  end

  protected

  def regexp
    @regexp ||= Regexp.new(country_code + area_code + tel_prefix + line_number)
  end

  def sep
    '[- ]?'
  end

  def country_code
    "\\+*\\d{1,4}#{sep}"
  end

  def area_code
    "(\\d{1,3}#{sep})?"
  end

  def tel_prefix
    "\\d{3,4}#{sep}"
  end

  def line_number
    '\d{3,4}'
  end
end
