require "./author"
require "./book"
require "./reader"
require "./order"

module Library
  class Library
    attr_reader :books, :authors, :readers, :orders

    def initialize
      @books = []
      @authors = []
      @readers = []
      @orders = []
    end

    def add_book (book)
      @books.push book unless @books.include? book
      @authors.push book.author unless @authors.include? book.author

      self
    end

    def take_book (book, reader)
      raise ArgumentError, "Book is missing" unless @books.include? book

      @readers.push reader unless @readers.include? reader
      @orders.push ::Library::Order.new(book, reader)

      self
    end

    def who_often_takes_the_book (book = nil)
      if @orders.empty?
        return nil
      end

      if book
        raise ArgumentError, "Book is missing" unless @books.include? book

        orders_hash = @orders.group_by { |order| order.book.to_s }
        book_orders = orders_hash[book.to_s]

        unless book_orders
          return nil
        end

        book_orders.group_by(&:reader).values.max_by(&:size).first.reader
      else
        @orders.group_by(&:reader).values.max_by(&:size).first.reader
      end
    end

    def most_popular_book
      if @orders.empty?
        return nil
      end

      @orders.group_by(&:book).values.max_by(&:size).first.book
    end

    def number_of_orders_of_three_most_popular_books
      if @orders.empty?
        return nil
      end

      out = {}

      orders_by_books = @orders.group_by(&:book)
      orders_by_books.each {|book, orders| out[book] = orders.size }
      out = out.max_by(3) { |book, order_count| order_count }

      out
    end

    def save (filename = "saved.bin")
      saved = Marshal.dump self

      File.write("files/" + filename, saved)

      self
    end

    def self.load (filename = "saved.bin")
      begin
        saved = File.read("files/" + filename)

        Marshal.load(saved)
      rescue
        self.new
      end
    end
  end
end