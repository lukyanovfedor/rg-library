module Library
  class Author
    attr_reader :name, :bio

    def initialize (name, bio = "")
      @name = name
      @bio = bio
    end

    def to_s
      "#{@name}"
    end

    def ==(other)
      to_s == other.to_s
    end
  end
end