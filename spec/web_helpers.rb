def add_multiple_tags
  visit('/links/add')
  fill_in(:url, with: "http://www.facebook.com")
  fill_in(:title, with: "facebook")
  fill_in(:tag, with: "social media, friends, news")
  click_button("add")
end

def add_tag
  visit('/links/add')
  fill_in(:url, with: "http://www.bbc.com")
  fill_in(:title, with: "bbc")
  fill_in(:tag, with: "news")
  click_button("add")
end
