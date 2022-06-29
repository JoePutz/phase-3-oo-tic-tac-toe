class TicTacToe
    attr_accessor :board

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(input, token)
        @board[input] = token
    end

    def position_taken? (input)
        @board[input] != " "
    end

    def valid_move?(input)
        !position_taken?(input) && input.between?(-1, 9)
        # if @board[input] == " " && input > -1 && input < 9
        #     true
        # else
        #     false
        # end
    end

    def turn_count
        @board.count{|index| index != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Move?"
        index = input_to_index(gets)
        if valid_move?(index) == true
            move(index, current_player)
            display_board
        else
            turn
        end
    end
end