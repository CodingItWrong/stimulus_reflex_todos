# frozen_string_literal: true

class TodosReflex < ApplicationReflex
  after_reflex :set_editing_todo_id_instance_var

  def create
    current_user.todos.create!(todo_params)
  end

  def edit
    self.editing_todo_id = todo_id
  end

  def cancel_edit
    self.editing_todo_id = nil
  end

  def update
    current_user.todos
                .find(editing_todo_id)
                .update!(todo_params)
    self.editing_todo_id = nil
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

  def editing_todo_id
    session[:editing_todo_id]
  end

  def editing_todo_id=(id)
    session[:editing_todo_id] = id
  end

  def set_editing_todo_id_instance_var
    @editing_id = editing_todo_id
  end

end
