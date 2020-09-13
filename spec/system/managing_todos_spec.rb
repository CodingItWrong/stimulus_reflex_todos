# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ManagingTodos', type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  let(:user) { FactoryBot.create(:user) }

  it "allows listing the user's todos" do
    todos = FactoryBot.create_list(:todo, 3, user: user)
    other_user_todo = FactoryBot.create(:todo)

    sign_in user
    visit '/'

    todos.each do |todo|
      expect(page).to have_content(todo.name)
    end
    expect(page).not_to have_content(other_user_todo.name)
  end

  it 'allows creating todos' do
    todo_name = 'My Todo'

    sign_in user
    visit '/'

    fill_in 'New Todo', with: todo_name
    click_on 'Add'

    expect(page).to have_content(todo_name)
    expect(find_field('New Todo').value).to eq ''

    expect(Todo.count).to eq(1)
  end

  it 'allows deleting todos' do
    todo = FactoryBot.create(:todo, user: user)

    sign_in user
    visit '/'

    expect(page).to have_content(todo.name)
    click_on 'Delete'
    expect(page).not_to have_content(todo.name)
  end
end
