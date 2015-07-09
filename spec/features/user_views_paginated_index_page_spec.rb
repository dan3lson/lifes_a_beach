require 'rails_helper'

feature 'visitor views the beach index', %{
  As a visitor
  I want to view all beaches
} do

  scenario 'a visitor views the homepage' do
    FactoryGirl.create_list(:beach, 11)

    visit beaches_path

    expect(page).to have_css("div.beach_container", count: 10)
  end

  scenario 'a visitor views the second index page' do
    FactoryGirl.create_list(:beach, 11)

    visit beaches_path

    click_link "2"

    expect(page).to have_css("div.beach_container", count: 1)
  end
end
