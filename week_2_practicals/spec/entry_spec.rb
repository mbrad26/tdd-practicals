require 'entry'

describe Entry do
  it 'instantiates with two arguments' do
    entry = described_class.new('Title', 'Body')

    expect(entry.title).to eq 'Title'
    expect(entry.body).to eq 'Body'
  end
end
