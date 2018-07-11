require 'rails_helper'

=begin
As a user
When I visit "/"
And I fill in the search form with 80203 (Note: Use the existing search form)
And I click "Locate"
Then I should be on page "/search"
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
=end

RSpec.describe 'Searching Form for NREL Api' do
  describe 'A user uses the search form' do
    it 'they should see a search form on the root page' do
      visit '/'

      expect(page).to have_css("form[action='/search']")
    end

    it 'they should be able to enter a zip code and be taken to the search page' do
      visit '/'

      fill_in id: 'q', with: '80203'
      click_button 'Locate'

      expect(page).to have_current_path('/search')
    end
  end
end
