require 'board'

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

      expect { board.add_move_to_grid(player.move) }
        .to change { subject.grid }.to include [nil, "X", nil]
    end
  end
end
