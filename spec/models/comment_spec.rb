require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  context 'creating comment' do
    it 'content cannot be blank ' do 
      expect { Comment.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'testing associations' do
    it 'should have one user' do
      c = Comment.reflect_on_association(:user)
      expect(c.macro).to eq(:belongs_to)
    end
    it 'should have one post' do
      c = Comment.reflect_on_association(:post)
      expect(c.macro).to eq(:belongs_to)
    end
  end
end