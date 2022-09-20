# frozen_string_literal: true

class PhoneValidator < ActiveModel::Validator
  def validate(record)
    return if (regexp =~ record.phone)&.zero?

    record.errors.add :phone, 'has unsupported format'
  end

  protected

  def regexp
    @regexp ||= Regexp.new(country_code + area_code + tel_prefix + line_number)
  end

  def sep
    '[- ]?'
  end

  def country_code
    '\+*\d{1,4}'
  end

  def area_code
    "(\\d{1,3}#{sep})?"
  end

  def tel_prefix
    "\\d{1,3}#{sep}"
  end

  def line_number
    '\d{1,4}'
  end
end
