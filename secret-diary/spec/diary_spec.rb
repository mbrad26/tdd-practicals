require 'diary'

describe Diary do
  it { is_expected.to respond_to(:add_entry).with(1).argument }
  it { is_expected.to respond_to(:get_entries) }

end
