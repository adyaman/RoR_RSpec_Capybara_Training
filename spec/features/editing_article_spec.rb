require "rails_helper"
RSpec.feature "Editing an Article" do
  before do
    @article = Article.create(title: "First Article", body: "Lorem Ipsum")
  end

  scenario "A user updates an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    fill_in "Title", with: "Updated Article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Update Article"
    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    visit "/"
    click_link @article.title click_link "Edit Article"
    fill_in "Title", with: ""
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Update Article"
    expect(page).to have_content("Article has not been updated")
    expect(current_path).to eq(article_path(@article))
  end
end