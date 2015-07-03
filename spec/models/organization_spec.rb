require 'rails_helper'

RSpec.describe Organization, type: :model do
  before { @organization = Organization.new(name: "Example Organization") }

  subject { @organization }

  it { should respond_to(:name) }

  describe "user association" do
    it { should respond_to(:users) }
  end

end
