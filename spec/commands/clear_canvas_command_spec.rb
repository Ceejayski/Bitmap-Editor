require_relative '../spec_helper'
require_relative '../../lib/commands/clear_canvas_command'

RSpec.describe ClearCanvasCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    let(:bitmap) { Bitmap.new(4, 2) }
    let(:args) { [bitmap] }
    let(:expected_canvas) do
      [
        %w[O O O O],
        %w[O O O O]
      ]
    end

    it 'should reset the bitmap back O' do
      expect(bitmap).to receive(:clear_canvas).and_call_original
      expect(bitmap.canvas).to eq(expected_canvas)
      subject.perform
    end
  end
end