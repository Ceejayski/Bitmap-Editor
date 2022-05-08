# encoding: utf-8

require 'bitmap'

describe Bitmap do
  describe '#create_bitmap' do
    context 'invalied coordinates' do
      it 'raises error if width is less than 1' do
        expect { Bitmap.new('0', '50') }
          .to raise_error(Bitmap::InvalidCordinates)
      end

      it 'raises error if width is greater than 250' do
        expect { Bitmap.new('500', '10') }
          .to raise_error(Bitmap::InvalidCordinates)
      end

      it 'raises error if height is less than 1' do
        expect { Bitmap.new('200', '0') }
          .to raise_error(Bitmap::InvalidCordinates)
      end

      it 'raises error if height is greater than 250' do
        expect { Bitmap.new('70', '300') }
          .to raise_error(Bitmap::InvalidCordinates)
      end
    end

    context 'valied coordinates' do
      it 'create bitmap array' do
        expect(Bitmap.new(2, 2).canvas).to match_array [%w[O O], %w[O O]]
      end
    end
  end
end
