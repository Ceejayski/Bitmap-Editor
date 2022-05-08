require_relative '../spec_helper'
require_relative '../../lib/commands/scale_bitmap_command'

RSpec.describe ScaleBitmapCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    let(:bitmap) { Bitmap.new(1,1) }
    let(:args) { [200, bitmap] }
    let(:expected_result) { [["O", "A"], ["0", "0"]] }

    it 'should scale bimap by 200 percent' do
      bitmap.set_canvas_color(1, 1, "A")
      subject.perform
      p bitmap
      expect(bitmap.canvas).to eq(expected_result)
    end
    context "Invalid arguments" do
      let(:args) { [] }
      it 'should should raise an error on wrong args' do
        expect{ subject }.to raise_error(RuntimeError)
      end
    end
  end
end