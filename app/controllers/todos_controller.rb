# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.all
    @todo = current_user.todos.build
  end

end
