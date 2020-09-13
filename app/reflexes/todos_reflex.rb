# frozen_string_literal: true

class TodosReflex < ApplicationReflex

  def create
    current_user.todos.create!(todo_params)
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end

end
