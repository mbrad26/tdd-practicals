require 'remembering_names'

describe 'save_names method' do
  it 'saves the names of people I meet' do
    expect(save_names('John Doe')).to eq 'Name saved'
  end
end