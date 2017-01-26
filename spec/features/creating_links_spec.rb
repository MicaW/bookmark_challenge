require 'spec_helper'
require './app/models/link'
require 'database_cleaner'
require './app/app.rb'

feature 'Adding links' do

  scenario 'To be able add a new bookmark with title and url' do
      visit('/links')
      click_link('Add bookmark')
        fill_in('title', :with => 'Facebook')
        fill_in('url', :with => 'www.facebook.com')
      click_button('Add')
      expect(page).to have_content('Facebook')
  end
end
