feature "view links with a specific tag", focus:true do
    before do
    Link.create(url: "www.myspace.com", title: "myspace", tags: [Tag.first_or_create(name: "social media")])
    Link.create(url: "www.bubblesrus.com", title: "bubblesrus", tags: [Tag.first_or_create(name: "bubbles")])
  end
  scenario "I can view links with the tag 'bubbles'" do
    visit('/tags/bubbles')
    within 'ul#tags' do
      expect(page).to have_content("bubblesrus")
      expect(page).not_to have_content("myspace")
    end
  end
end
