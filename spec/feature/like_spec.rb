require_relative '../rails_helper'

RSpec.describe 'Webpage workflow', type: :system do
  describe 'Add like' do
    it 'Add like on post' do
      User.create(name: 'Legolas', email: 'legolas@hotmail.com', password: 'thelord')
      Post.create(content: 'The Lord of the Rings', user_id: 1)
      visit user_session_path
      fill_in 'Email', with: 'legolas@hotmail.com'
      fill_in 'Password', with: 'thelord'
      click_on 'Log in'
      sleep(3)
      click_on 'Like!'
      sleep(3)
      expect(page).to have_content('You liked a post.')
    end
  end
end
