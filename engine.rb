Class Blackjack
  attr_accessor :deck, :player, :dealer

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new
  end

  def set_player_name
    puts "What's your name."
    player.name = gets.chomp
  end

  def deal_cards
    player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end

    def show_flop
      player.show_flop
      dealer.show_flop
    end

    def blackjack_or_bust?(player_or_dealer)
      if player_or_dealer.total == BLACKJACK_AMOUNT
        if player_or_dealer.is_a?(Dealer)
          puts "Sorry, dealer hit blackjack. #{player.name} losses."
        else
          puts "Congratulation, you hit blackjack! #{player.name} win!"
        end
        play_again?
        elsif player_or_dealer.is_busted?
        if player_or_dealer.is_a?(Dealer)
            puts "Congratulations, dealer busted. #{player.name} win!"
          else
            puts "Sorry, #{player.name} busted. #{player.name} loses."
          end
          play_again?
        end
    end

    def player_turn
      puts "#{player.name}'s turn."

      blackjack_or_bust?(player)

      while !blackjack_or_bust?
        puts" please choose 1) hit or 2 )stay . "
        response = gets.chomp

        if ![1, 2].include?(response)
          puts "Err! Please choose either 1 or 2."
          next
        end

        if response == "2"
          puts "#{player.name} chose to stay."
          break
        end

        new_card = deck.deal_one
        puts "New card of #{player.name} is: #{new_card}"
        player.add_card(new_card)
        puts "#{player.name}'s total is : #{player.total}"

        blackjack_or_bust?(player)

      end
      puts "#{player.name} stays at #{player.total}."
    end

    def dealer_turn
      puts "Dealer's turn."

      blackjack_or_bust?(dealer)

      while dealer.total < DEALER_HIT_MIN
        new_card = deck.deal_one
        puts "Dealing card to dealer: #{new_card}"
        dealer.add_card(new_card)
        puts "Dealer total is now: #{dealer.total}"
      
        blackjack_or_bust?(dealer)
      end

      puts "Dealer stays at #{dealer.total}."

    end

    def who_won?
      if player.total > dealer.total
        puts "Congratulations, #{player.name} wins!"
      elsif player.total < dealer.total
        puts "Sorry, #{player.name} loses."
      else
        puts "It's a tie!"
      end

      play_again?

    end

    def play_again?
        puts "Would you like to play again?"
        puts "1) yes 2 ) no."
        
        if gets.chomp == "1"
          puts "Starting new game."
          deck = Deck.new
          player.cards = []
          dealer.cards = []
          start
        else
          puts "Bye, thanks for playing."
          exit
        end
    end

    def start
      set_player_name
      deal_cards
      show_flop
      player_turn
      dealer_turn
      who_won?
    end

end


game = Blackjack.new
game.start
