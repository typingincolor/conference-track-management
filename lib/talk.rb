# Talk
class Talk
  attr_reader :description
  attr_reader :length

  def initialize(description, length)
    @description = description
    @length = length
  end
end
