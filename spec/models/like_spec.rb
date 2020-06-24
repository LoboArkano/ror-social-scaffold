require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  context 'creating like' do
    let (:like_1){ Like.create(:post_id => 1, :user_id => 1) }
    let (:like_2){ Like.create!(:post_id => 1, :user_id => 1) }

    it 'user_id has to be unique' do #
      expect { like_2 }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'testing associations' do
    it 'should have one user' do
      l = Like.reflect_on_association(:user)
      expect(l.macro).to eq(:belongs_to)
    end
    it 'should have one post' do
      l = Like.reflect_on_association(:post)
      expect(l.macro).to eq(:belongs_to)
    end
  end
end
