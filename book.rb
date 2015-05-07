module Library
  class Book
    attr_reader :title, :author

    def initialize (title, author)
      @title = title
      @author = author
    end

    def to_s
    	"#{@title}, written by #{@author}"
    end

    def ==(other)
    	to_s == other.to_s
    end
  end
end