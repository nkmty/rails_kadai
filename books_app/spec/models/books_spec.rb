require "rails_helper"
describe Book do
  scenario "書籍のデータを生成する" do
    book = Book.new(
      title: "test",
      memo: "testtest"
     )
    expect(book).to be_valid
  end
end
