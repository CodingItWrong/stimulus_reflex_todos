# frozen_string_literal: true

class TodoComponent < ViewComponent::Base
  def initialize(todo:, editing_id:)
    @todo = todo
    @editing_id = editing_id
  end

  private

  attr_reader :todo
end
