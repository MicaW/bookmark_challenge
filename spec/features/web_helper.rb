require 'spec_helper'

def create_link_with_tag
  visit('/links')
  click_link('Add bookmark')
  fill_in('title', :with => 'Facebook')
  fill_in('url', :with => 'www.facebook.com')
  fill_in('tag', :with => 'social')
  click_button('Add')
end

def create_link_with_different_tag
  visit('/links')
  click_link('Add bookmark')
  fill_in('title', :with => 'Water')
  fill_in('url', :with => 'www.water.com')
  fill_in('tag', :with => 'bubbles')
  click_button('Add')
end
