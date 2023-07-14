require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { Item.new(name: 'item', amount: 10, user_id: 1, group_id: 1) }

  before { subject.save }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid  
  end

  it 'validates presence of amount' do
    subject.amount = nil
    expect(subject).to_not be_valid  
  end

  it 'validates that amount is a positive number' do
    subject.amount = -10
    expect(subject).to_not be_valid  
  end

  it 'validates that user_id is present' do
    subject.user_id = nil
    expect(subject).to_not be_valid  
  end

  it 'validates that group_id is present' do
    subject.group_id = nil
    expect(subject).to_not be_valid  
  end
end