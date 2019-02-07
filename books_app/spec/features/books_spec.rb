require 'rails_helper'

feature "書籍のCRUD操作" do
  before do
    User.create(email: "test@gmail.com", password: "testtest")
    visit ("/users/sign_in")
    fill_in("user_email", with: "test@gmail.com")
    fill_in("user_password", with: "testtest")
    click_button("ログイン")
  end

  scenario "書籍の登録に成功する" do
    regist_test_data
    expect(page).to have_content "新規本データを作成しました。"
  end

  scenario "作成した書籍データの閲覧" do
    regist_test_data
    regist_book_id = URI.parse(current_url).to_s.scan(/.$/)
    visit("/books/" + regist_book_id[0])
    expect(page).to have_content "test_title"
  end

  scenario "書籍のデータを変更" do
    regist_test_data
    regist_book_id = URI.parse(current_url).to_s.scan(/.$/)
    visit("/books/" + regist_book_id[0] + "/edit")
    fill_in("book_title", with: "test_edit")
    fill_in("book_memo", with: "test_edit")
    fill_in("book_author", with: "test_edit")
    click_button("Update 本")
    expect(page).to have_content "test_edit"
  end

  scenario "書籍のデータを削除" do
    regist_test_data
    visit("/books/")
    click_link("削除")
    visit("/books/")
    expect(page).to have_no_content "test_title"
  end
end
