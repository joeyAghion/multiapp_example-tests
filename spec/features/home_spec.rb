require 'spec_helper'

feature "home", js: true do

  scenario "welcomes visitor" do
    visit "/"
    expect(page).to have_content("Browse products")
  end
end
