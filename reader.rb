module Library
  class Reader
    attr_reader :name, :email, :city, :street, :house

    def initialize (name, email, extra = {})
      @name = name
      @email = email
      @city = extra[:city] || ""
      @street = extra[:street] || ""
      @house = extra[:house] || ""
    end

    def to_s
      "name: #{@name}\nemail: #{@email}"
    end

    def ==(other)
      to_s == other.to_s
    end
  end
end