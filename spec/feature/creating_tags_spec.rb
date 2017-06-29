require "./app/models/link.rb"

feature "add one tag to a link" do
  scenario "I can tag links in my bookmark manager" do
    visit('/links/add')
    fill_in(:url, with: "http://www.facebook.com")
    fill_in(:title, with: "facebook")
    fill_in(:tag1, with: "social media")

    click_button("add")
    link = Link.first
    expect(link.tags.map(&:name)).to include('social media')
  end
end

feature "tagging links" do
  scenario "add multiple tags to a link" do
    visit('/links/add')
    fill_in(:url, with: "http://www.facebook.com")
    fill_in(:title, with: "facebook")
    fill_in(:tag1, with: "social media")
    fill_in(:tag2, with: "friends")

    click_button("add")
    link = Link.first
    expect(link.tags.map(&:name)).to include('social media')
    expect(link.tags.map(&:name)).to include('friends')
  end
end
