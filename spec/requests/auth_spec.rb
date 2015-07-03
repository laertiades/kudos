require 'rails_helper'

RSpec.describe "Auth", type: :request do

  subject { page }

  describe "visit authenticated page without signing in" do
    before { visit users_show_path }
    it { should have_selector('h1', text: 'Sign In') }
  end

  describe "visit authenticated page after signing in" do
    let(:user) { FactoryGirl.create(:user) }
    before { signin user }
    it { should have_selector('h6', text: user.name) }
  end
end