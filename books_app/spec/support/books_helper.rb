  def regist_test_data
      visit ('/books/new')
      fill_in('book_title', with: 'test_title')
      fill_in('book_memo', with: 'test_memo')
      fill_in('book_author', with: 'test_author')
      click_button('Create 本')
  end

