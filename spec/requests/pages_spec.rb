require 'rails_helper'

RSpec.describe "Pages", type: :request do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Kudos') }
  end
end