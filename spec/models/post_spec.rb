require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Kibre', photo: 'link to photo', bio: 'Rails Developer')

  subject { Post.new(author: user, title: 'About Rais Rspec', text: 'Hello') }

  before { subject.save }

  it 'Title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments counter must be greater than or equal to 0' do
    subject.comments_count = -1
    expect(subject).to_not be_valid
  end

  it 'Likes counter must be greater than or equal to 0' do
    subject.likes_count = -1
    expect(subject).to_not be_valid
  end

  it 'is should show recent comments' do
    comment = Comment.create(post: subject, author: user, text: 'my comment')
    expect(comment.text).to eq('my comment')
  end
end
