# Exercise 3

# There's something rather neat about the imagine how to use it strategy for deciding what software to write. We can convert our examples into tests quite easily.

# This is how we do it:

# # The imagined example
# > track_motivation(5)
# => "Motivation stored!"
# # The expectation
# expect(track_motivation(5)).to eq "Motivation stored!"
# # The full test
# describe "the track_motivation method" do
#   it "gives us a friendly message" do
#     expect(track_motivation(5)).to eq "Motivation stored!"
#   end
# end
# Take your result from Exercise 1 (remembering names) and convert it to a test like the above.

# As a student
# So that I can remember people's names
# I want an IRB application that stores the names of people I meet

describe 'save_names method' do
  it 'saves the names of people I meet' do
    expect(save_names('John Doe')).to eq 'Name saved'
  end
end

