require 'spec_helper'

feature 'Signing up' do
  scenario 'User can sign in' do
    sign_in
    expect(current_path).to eq('/links')
    expect(page).to have_content('Welcome Mica')
  end

  scenario 'signing increases user count' do
    expect{ sign_in }.to change{User.count}.by(1)
  end
end


    
