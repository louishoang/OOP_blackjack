class Card
  attr_accessor :suite :face_value

  def initialize(s, fv)
    @suite = s
    @face_value = fv
  end

  def to_s
    "You card is #{face_value} of #{suite}."

end

