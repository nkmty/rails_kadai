require 'rails_helper'

  describe User do
  scenario "ユーザーデータを生成する" do
  user = User.new(
    email: "test@gmail.com",
    password: "testtest",
    )
  expect(user).to be_valid
  end

  scenario "emailアドレスが未入力の場合に失敗する" do
  user = User.new(
    email: "",
    password: "testtest",
    )
  expect(user).not_to be_valid
  end

  scenario "パスワードが未入力の場合に失敗する" do
  user = User.new(
    email: "test@gmail.com",
    password: "",
    )
  expect(user).not_to be_valid
  end

end

