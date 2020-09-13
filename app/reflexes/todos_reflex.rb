# frozen_string_literal: true

class TodosReflex < ApplicationReflex

  def create
    current_user.todos.create!(todo_params)
  end

  def delete
    current_user.todos.find(todo_id).destroy!
  end

  private

  def todo_id
    element.dataset[:id].to_i
  end

  def todo_params
    params.require(:todo).permit(:name)
  end

end
