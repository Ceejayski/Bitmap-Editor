require_relative '../spec_helper'
require_relative '../../lib/commands/set_vertical_segment_command'
require 'pry'

RSpec.describe SetVerticalSegmentCommand do
  subject { described_class.new(*args) }
  let(:bitmap) { Bitmap.new(5, 5) }

  describe '#perform' do
    context 'with valid arguments' do
      let(:args) { [1, 3, 5, 'P', bitmap] }
      let(:expected_canvas) do
        [
          %w[O O O O O],
          %w[O O O O O],
          %w[P O O O O],
          %w[P O O O O],
          %w[P O O O O]
        ]
      end

      it 'should colour the correct vertical segment within the bitmap' do
        subject.perform
        expect(bitmap.canvas).to eq(expected_canvas)
      end
    end

    context 'with invalid attributes' do
      let(:args) { [1, 3, 9, 'P', bitmap] }

      it 'should raise an exception' do
        expect do
          subject.perform
        end.to raise_error(Bitmap::OutOfLimitError)
      end
    end
  end
end