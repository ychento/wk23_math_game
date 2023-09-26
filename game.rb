class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
  end

  def switch_player
    @current_player_index = (@current_player_index == 0) ? 1 : 0
  end

  def play
    current_player = ""
    loop do
      current_player = @players[@current_player_index]
      question = Question.generate

      puts "---- NEW TURN ----"

      puts "#{current_player.name}: What does #{question[:question]} "
      player_answer = gets.chomp.to_i

      if player_answer == question[:answer]
        puts "#{current_player.name}: YES! You are correct."
      else 
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end

      display_score

      switch_player
      puts "Switched to Player #{@current_player_index + 1}" 

      break if game_over?

    end
    puts "Player #{@current_player_index + 1} wins with a score of #{@players[@current_player_index].lives}/3"
    puts "---- GAME OVER ----"
  end

  def display_score
    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3 "
  end

  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end
end
