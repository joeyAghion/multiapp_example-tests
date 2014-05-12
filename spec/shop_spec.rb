require 'spec_helper'

feature "shop", js: true do

  scenario "list widgets" do
    create_widget(name: 'Foo Widget', price_cents: 100_00)
    create_widget(name: 'Bar Widget', price_cents: 500_00)
    visit "/"
    click_link "Browse products"
    expect(page).to have_content("Foo Widget")
    expect(page).to have_content("Bar Widget")
  end
end
