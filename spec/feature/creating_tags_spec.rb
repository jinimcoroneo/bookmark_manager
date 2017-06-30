require "./app/models/link.rb"

feature "add one tag to a link" do
  scenario "I can tag links in my bookmark manager" do
    add_tag
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end
end

feature "tagging links" do
  scenario "add multiple tags to a link" do
    add_multiple_tags
    link = Link.first
    expect(link.tags.map(&:name)).to include('social media')
    expect(link.tags.map(&:name)).to include('friends')
    expect(link.tags.map(&:name)).to include('news')
  end
end
