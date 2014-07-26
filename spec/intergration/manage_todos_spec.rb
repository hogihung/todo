require 'spec_helper'

feature 'Manage todo' do 
  scenario 'create a new todo' do
    sign_in
    create_todo_with_description('Buy some milk')
    user_sees_todo_item('Buy some milk')
  end

  scenario 'view only my todos' do
    create(:todo, description: 'Buy some eggs', owner_email: 'bobo@nobots.com')
    sign_in_as('me@nobots.com')
    create_todo_with_description('Buy some milk')
    user_sees_todo_item('Buy some milk')
    user_does_not_see_todo_item('Buy some eggs')
  end

  scenario 'mark todos as complete' do 
    sign_in
    create_todo_with_description('Buy some creamer')
    complete_todo('Buy some creamer')
    user_sees_completed_todo_item('Buy some creamer')
  end


  def complete_todo(description)
    within "li.todo:contains('#{description}')" do 
      click_link 'Complete'
    end
  end

  def create_todo_with_description(description)
    click_link 'Add a new todo'
    fill_in 'Description', with: description
    click_button 'Create todo'
  end

  def user_sees_todo_item(description)
    expect(page).to have_css 'li.todo', text: description
  end

  def user_sees_completed_todo_item(description)
    expect(page).to have_css 'li.todo.completed', text: description
  end

  def user_does_not_see_todo_item(description)
    expect(page).to_not have_css 'li.todo', text: description
  end

end