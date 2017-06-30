feature 'user can sign up' do
  scenario 'can enter email and password' do
    visit '/signup'
    fill_in(:email, with: "john@gmail.com" )
    fill_in(:password, with: "password123" )
    click_button( 'Sign up')
    expect(page).to have_content("Welcome, john@gmail.com")
  end
end
