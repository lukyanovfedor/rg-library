module Library
  class Order
    attr_reader :book, :reader, :date

    def initialize (book, reader, date = nil)
      @book = book
      @reader = reader
      @date = date || Time.new
    end

    def to_s
      "#{@book} take by #{@reader}"
    end
  end
end