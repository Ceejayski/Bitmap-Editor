require_relative '../spec_helper'
require_relative '../../lib/commands/fill_sibling_pixel_command'

RSpec.describe FillSiblingPixelCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    let(:bitmap) { Bitmap.new(4,4) }
    let(:x) { "2"}
    let(:y) { "4"}
    let(:args) { [x, y, "G", bitmap] }
    let(:expected_result) { [["G", "G", "G", "G"], ["G", "G", "G", "G"], ["G", "G", "G", "G"], ["G", "G", "G", "G"]] }

    it 'should fill region and siblings pixel with color G' do
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