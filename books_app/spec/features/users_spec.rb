require 'rails_helper'

feature "ユーザーデータの操作" do

  scenario "ユーザーの新規作成" do
    visit "/users/sign_up"
    fill_in('user_email', with: 'test@gmail.com')
    fill_in('user_password', with: 'testtest')
    fill_in('user_password_confirmation', with: 'testtest')
    attach_file "user_avatar", "./tmp/test.jpeg"
    click_button('Sign up')
    expect(page).to have_content "アカウント登録が完了しました。"
  end

  scenario "ログイン機能のテスト" do
    User.create(email: "test@gmail.com", password: "testtest")
    visit ('/users/sign_in')
    fill_in('user_email', with: 'test@gmail.com')
    fill_in('user_password', with: 'testtest')
    click_button('ログイン')
    expect(page).to have_content "ログインしました。"
  end

  scenario "ユーザーデータの更新処理" do
    visit "/users/sign_up"
    fill_in('user_email', with: 'test@gmail.com')
    fill_in('user_password', with: 'testtest')
    fill_in('user_password_confirmation', with: 'testtest')
    attach_file "user_avatar", "./tmp/test.jpeg"
    click_button('Sign up')

    visit ('/users/edit')
    fill_in('user_email', with: 'updatemail@gmail.com')
    fill_in('user_password', with: 'updatepassword')
    fill_in('user_password_confirmation', with: 'updatepassword')
    fill_in('user_current_password', with: 'testtest')
    click_button('Update')
    expect(page).to have_content "アカウント情報を変更しました。"
  end
end
