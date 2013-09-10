require 'spec_helper'
feature "Add attachment files" do
  scenario "Creating a car with an attachment" do
    visit new_car_path
    fill_in "car_brand", with: "tsuru"
    fill_in "car_year", with: "1990"
    attach_file "car_asset", "spec/fixtures/car.JPG"
    click_button "create-car"
    expect(page).to have_content("Car has been created.")
    within(".asset") do
      expect(page).to have_content("car.JPG")
    end 
  end
end
