require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'User', email: 'mail@mail.com') }

  before { subject.save }

  it 'validates the presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'tests the admin method when role is set to admin' do
    ad = subject.admin?
    expect(ad).to eq(true)
  end

  it 'tests the admin method when role is set to admin' do
    subject.role = 'not_admin'
    ad = subject.admin?
    expect(ad).to eq(false)
  end
end
