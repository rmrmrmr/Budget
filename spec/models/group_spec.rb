require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'group', icon: 'icoooon', user_id: 1) }

  before { subject.save }

  it 'validates the presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates the presence of icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'validates the presence of user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
