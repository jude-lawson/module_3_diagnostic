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
  let(:results_data) { JSON.parse(File.read('spec/fixtures/station_results.json')) }
  let(:stations_data) { results_data['fuel_stations'] }
  let(:fuel_type_names) { Hash.new('ELEC' => 'Electric', 'LPG' => 'Propane') }
  describe 'A user uses the search form' do
    it 'they should see a search form on the root page' do
      visit '/'

      expect(page).to have_css("form[action='/search']")
    end

    it 'they should be able to enter a zip code and be taken to the search page' do
      visit '/'

      fill_in id: 'q', with: '80203'
      click_button 'Locate'

      expect(current_path).to eq('/search')
    end
  end
  
  describe 'Search results for 10 stations, within 6 miles, sorted by distance ASC, electric and propane only' do
    it 'they should be taken to a list of 10 stations with Name, Address, Fuel Types, Distance, and Access Times' do
      visit '/'

      fill_in id: 'q', with: '80203'
      click_button 'Locate'

      expect(page).to have_content('Search Results')

      stations_data.each do |station|
        within("#station-#{station['id']}") do
          expect(page).to have_content(station['station_name'])
          expect(page).to have_content("Address: #{station['street_address']}")
          expect(page).to have_content("Fuel Type: #{fuel_type_name[station['fuel_type_code']]}")
          expet(page).to have_content("Distance: #{station['distance']}")
          expet(page).to have_content("Open: #{station['access_days_time']}")
        end
      end
    end
  end
end
