module Hand
  def show_hand
    puts " ----#{name}'s hands.----"
    cards.each do |card|
      puts "#{card}"
    end
    puts "Total: #{total}"
  end

  def total
    face_values = cards.map{|card| card.face_values}

    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    face_values.select{|val| val =="A"}.count.times. do
      break if total <= 21
      total -= 10
    end
    total

  end

  def add_card(new_card)
    cards << new_card
  end

  def is_busted?
    total > Blackjack::BLACKJACK_AMOUNT
  end


end