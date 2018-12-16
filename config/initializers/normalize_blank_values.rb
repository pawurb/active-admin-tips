module NormalizeBlankValues
  extend ActiveSupport::Concern

  included do
    before_save :normalize_blank_values
  end

  def normalize_blank_values
    begin
      self.class.const_get("NORMALIZABLE_ATTRIBUTES")
    rescue NameError
      []
    end.each do |column|
      self[column].present? || self[column] = nil
    end
  end
end
