require 'spec_helper'

describe "Memories" do
  describe "GET /memories" do
    it "works! (now write some real specs)" do
      visit '/memories'
      expect(page).to have_content 'memories'
    end
  end
end
