require 'rails_helper'

RSpec.describe User, type: :model do
  describe '' do
    it 'validates presence of email, password, first name, lastname' do
      expect{ User.create! }.to raise_exception
    end
  end

end
