 require 'rails_helper'
# 
# Rspec.describe BooksController, type: :controller do
#     before do
#       user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
#       sing_in user
#     end
#     it 'リクエストは200 OKとなること' do
#       get :index
#       expect(response.status).to eq 200
#     end
#     end

RSpec.describe BooksController, type: :controller do
  before do
    sign_in User.create(email: "test@example.com", password: "testtesttest")
  end

  describe "#index" do
    it "正常にレスポンスを返すこと" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "#new" do
    it "正常にレスポンスを返すこと" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "#show" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      get :show, params: { id: book.id }
      expect(response.status).to eq 200
    end
  end

  describe "edit" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      get :edit, params: { id: book.id }
      expect(response.status).to eq 200
    end
  end

  describe "update" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      patch :update, params: { id: book.id, book: { title: "hoge", memo: "hogehoge", author: "fuga", picture: nil } }
      expect(response.status).to eq 302
    end
  end

  describe "destroy" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest")
      delete :destroy, params: { id: book.id }
      expect(response.status).to eq 302
    end
  end

end

