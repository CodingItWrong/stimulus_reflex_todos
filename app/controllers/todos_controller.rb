# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.all
  end

end
