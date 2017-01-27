feature 'filters by tag' do
  scenario 'filters my links by tag' do
    create_link_with_tag
    create_link_with_different_tag
    visit "/links"
    fill_in('filter', :with => 'bubbles')
    click_button('Filter')
    expect(page).to have_content('Water')
    expect(page).not_to have_content('Facebook')
  end
end
