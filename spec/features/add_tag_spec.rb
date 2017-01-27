require 'spec_helper'

feature 'Adding tag to link' do
  scenario 'When creating a link, add a tag' do
    visit('/links')
    click_link('Add bookmark')
    fill_in('title', :with => 'Facebook')
    fill_in('url', :with => 'www.facebook.com')
    fill_in('tag', :with => 'Social')
    click_button('Add')
    expect(page).to have_content('Social')
end
  scenario "add multiple tage to link" do
    visit('/links')
    click_link('Add bookmark')
    fill_in('title', :with => 'Facebook')
    fill_in('url', :with => 'www.facebook.com')
    fill_in('tag', :with => 'Social, Fun')
    click_button('Add')
    visit('/tag/Social')
    expect(page).to have_content('Facebook')
    visit('/tag/Fun')
    expect(page).to have_content('Facebook')
  end
end
