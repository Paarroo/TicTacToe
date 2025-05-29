# frozen_string_literal: true

class BoardCase
  attr_accessor :value, :id

  def initialize(case_id, case_value = '')
    @id = case_id
    @value = case_value
  end
end
