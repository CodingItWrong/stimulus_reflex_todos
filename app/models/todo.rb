# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
