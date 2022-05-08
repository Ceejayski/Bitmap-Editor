require_relative '../spec_helper'
require_relative '../../lib/commands/show_command'

RSpec.describe ShowCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    let(:bitmap) { Bitmap.new(4, 2) }
    let(:args) { [bitmap] }
    let(:expected_result) { "OOOO\nOOOO\n" }

    it 'should print the bitmap image to stdout' do
      expect { subject.perform }.to output(expected_result).to_stdout
    end
  end
end