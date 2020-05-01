require 'check_birthday'

feature 'Home page' do

  scenario 'Entering a birthday date that is today' do
    visit '/'
    fill_in :name, with: 'Marius'
    fill_in :day, with: Time.now.day
    find_by_id('month').find(:xpath, "option[#{Time.now.month}]").select_option
    click_button 'GO!'

    expect(page).to have_content 'Happy Birthday Marius!'
  end

  scenario 'Entering a birthday date that is not today' do
    visit '/'
    fill_in :name, with: 'Marius'
    fill_in :day, with: Time.now.day + 9
    find_by_id('month').find(:xpath, "option[#{Time.now.month + 3}]").select_option
    click_button 'GO!'

    expect(page).to have_content 'Your birthday will be in 101 days Marius!'
  end
end
