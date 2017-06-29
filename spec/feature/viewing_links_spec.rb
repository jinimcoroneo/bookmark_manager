feature "view links with a specific tag" do
  scenario "I can view links with the tag 'bubbles'" do
    visit('/links/add')
    fill_in(:url, with: "www.myspace.com")
    fill_in(:title, with: "myspace")
    fill_in(:tag, with: "social")
    click_button("add")
    visit('/links/add')
    fill_in(:url, with: "www.bubblesrus")
    fill_in(:title, with: "bubbles for days")
    fill_in(:tag, with: "bubbles")
    click_button("add")
    visit('/tags/bubbles')
    expect(page).to have_content("bubbles")
    expect(page).to have_content("bubblesrus")
    expect(page).not_to have_content("social")
  end
end
