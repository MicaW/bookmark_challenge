require 'spec_helper'

feature 'Viewing Links' do

  scenario 'To be able view a list of bookmark links on homepage' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    sign_in
    expect(page.status_code).to eq 200
    #within 'ul~links' do
    expect(page).to have_content('Makers Academy')

  end
end
