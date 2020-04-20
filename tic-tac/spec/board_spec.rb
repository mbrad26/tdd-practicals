require 'board'

# Exercise 1

# Start writing a tic-tac-toe implementation, but only the first user stories:

# I can see the board on the screen
# I can put an X on the board
# You might need more than one class for this, but you don't need to create them all up front if you don't want to.

# Remember, test behaviour, not state. Go through the example again if you're not sure.

describe Board do
  subject(:board) { described_class.new}

  describe '#initialize' do
    it 'creates a tic-tac-toe board' do
      expect(board.grid).to eq Array.new(3) { Array.new(3) }
    end
  end

  describe '#add_move_to_grid' do

    it 'responds to "add_move_to_grid"' do
      expect(board).to respond_to(:add_move_to_grid).with(1).argument
    end

    it "adds player's move to the board" do
      player = double('Player')
      allow(player).to receive(:move).and_return(['X', 0, 1])

      board.add_move_to_grid(player.move)
      
      expect(subject.grid).to eq [[nil, "X", nil], [nil, nil, nil], [nil, nil, nil]]
    end
  end

end