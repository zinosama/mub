class SnakecaseAlphanumericValidator < ActiveModel::EachValidator
  REGEXP = /\A[a-z0-9_]+\z/

  def validate_each(record, attribute, value)
    return if value.blank?
    return if REGEXP.match?(value)

    record.errors.add(
      attribute,
      (options[:message] || 'must be a snakecased alphanumeric string')
    )
  end
end
