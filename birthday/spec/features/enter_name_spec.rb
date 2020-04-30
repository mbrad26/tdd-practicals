feature 'Home page' do
  # scenario 'visit home page' do
  #   visit '/'
  #
  #   expect(page).to have_content 'Hello there!'
  # end

  scenario 'enter name' do
    visit '/'
    fill_in :name, with: 'Marius'
    fill_in :day, with: 24
    fill_in :month, with: 'March'
    click_button 'GO!'

    expect(page).to have_content 'Happy Birthday Marius!'
  end
end
 
