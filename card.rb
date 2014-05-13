class Card
  attr_accessor :suite :face_value

  def initialize(suite, face_value)
    @suite = s
    @face_value = fv
  end

  def to_s
    "You card is #{face_value} of #{suite}."

end

