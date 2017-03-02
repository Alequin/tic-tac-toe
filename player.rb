class Player

  attr_reader :name, :type

  def initialize(name, type)
    @name = name

    if(type != :HUMAN && type != :AI)
      raise ArgumentError, "Player must be either be :HUMAN or :AI "
    end
    @type = type
  end

end
