require 'rspec'
require_relative '../book'
require_relative '../student'

describe Book do
  context 'Testing the Book class' do
    title = 'Code is good'
    author = 'DD group'
    book = Book.new(title, author)

    it 'should validate the title of the book' do
      expect(book.title).to eq title
    end

    it 'should validate the author of the book' do
      expect(book.author).to eq author
    end
  end
end
