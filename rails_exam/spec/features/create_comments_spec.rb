require 'spec_helper'

feature "Creating comments" do
  context 'Create car' do
    let!(:car){ FactoryGirl.create(:car) }

    before do
      visit car_path(car)
      #click_link car.brand
    end

    scenario "Creating a comment" do
      fill_in "comment_text", :with => "Added a comment!"
      click_button "create-comment"
      page.should have_content("Comment has been created.")
        within("#comments") do
          page.should have_content("Added a comment!")
        end
    end
    scenario "Creating an invalid comment" do
        click_button "create-comment"
        page.should have_content("Comment has not been created.")
    end 
  end
end
