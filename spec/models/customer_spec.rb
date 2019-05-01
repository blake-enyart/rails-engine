require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationship(s)' do
    it { should have_many :invoices }
  end
end
