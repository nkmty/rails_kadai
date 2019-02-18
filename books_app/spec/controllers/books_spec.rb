require 'rails_helper'
RSpec.describe BooksController, type: :controller do

  before do
    sign_in User.create(email: "test@gmail.com", password: "testtest")
  end

  describe "indexメッドのテスト" do
    it "正常にレスポンスを返すこと" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "newメソッドをテスト" do
    it "正常にレスポンスを返すこと" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "showメソッドをテスト" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      get :show, params: { id: book.id }
      expect(response.status).to eq 200
    end
  end

  describe "editメソッドをテスト" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      get :edit, params: { id: book.id }
      expect(response.status).to eq 200
    end
  end

  describe "updateメソッドをテスト" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      patch :update, params: { id: book.id, book: { title: "hoge", memo: "hogehoge", author: "fuga", picture: nil } }
      expect(response.status).to eq 302
    end
  end

  describe "destroyメソッドをテスト" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      delete :destroy, params: { id: book.id }
      expect(response.status).to eq 302
    end
  end
end
