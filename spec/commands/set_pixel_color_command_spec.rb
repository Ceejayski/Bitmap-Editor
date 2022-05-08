require_relative '../spec_helper'
require_relative '../../lib/commands/set_pixel_color_command'

RSpec.describe SetPixelColorCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    let(:bitmap) { Bitmap.new(2,2) }
    let(:x) { "1"}
    let(:y) { "2"}
    let(:args) { [x, y, "G", bitmap] }
    let(:expected_result) { [["O", "O"], ["G", "O"]] }

    it 'should set pixel color to G' do
      subject.perform
      expect(bitmap.canvas).to eq(expected_result)
    end
    context "Invalid arguments" do
      let(:args) { [] }
      it 'should should raise an error on wrong args' do
        expect{ subject }.to raise_error(RuntimeError)
      end
    end

    context "Invalid arguments x, y" do
      let(:args) { [14, 20, "A", bitmap] }
      it 'should should raise an error on wrong args' do
        expect{ subject.perform }.to raise_error(Bitmap::InvalidCanvasCordinate)
      end
    end

  end
end