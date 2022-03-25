require 'rails_helper'

RSpec.describe PortfolioStock, type: :model do
  #created sample user because subject cannot be valid without a user_id.
  let (:user) { 
    User.create(
      email: 'test@test.com', 
      password: '123456', 
      password_confirmation: '123456', 
      state: 'Approved',
      role: 'trader',
      confirmed_at: DateTime.now
    )
  }
  subject {
    PortfolioStock.new(:user_id => user.id)
  }

  it 'is not valid if it does not belong to a user or has no user_id' do
    subject.user_id = nil 
    expect(subject).to_not be_valid
  end

  it 'is not valid if total_quantity is less than 0' do
    subject.total_quantity = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid if total_quantity is not a number' do
    subject.total_quantity = 'string'
    expect(subject).to_not be_valid
  end

  it 'is not valid if total_quantity is nil' do
    subject.total_quantity = nil
    expect(subject).to_not be_valid
  end

  it 'is valid if total_quantity is a positive decimal' do
    subject.total_quantity = 0.6969
    expect(subject).to be_valid
  end

end
