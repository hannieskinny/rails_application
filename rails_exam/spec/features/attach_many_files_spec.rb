require 'spec_helper'
feature 'Attachment many files' do
  scenario "Creating a car with an attachment image" do
 visit new_car_path
    fill_in "car_brand", with: "tsuru"
    fill_in "car_year", with: "1990"
    attach_file "car_assets_attributes_0_asset", Rails.root.join("spec/fixtures/car.JPG")
    attach_file "car_assets_attributes_1_asset", Rails.root.join("spec/fixtures/car2.jpg")
    attach_file "car_assets_attributes_2_asset", Rails.root.join("spec/fixtures/car3.jpg")
    click_button "create-car"
    expect(page).to have_content("Car has been created")
    within(".assets") do
      expect(page).to have_content("car.JPG")
      expect(page).to have_content("car2.jpg")
      expect(page).to have_content("car3.jpg")
    end 
  end
end
