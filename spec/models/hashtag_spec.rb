describe Hashtag do
  describe 'methods' do
    describe '#searches_increase' do
      let(:hashtag) { create :hashtag, day_searches: 1, searches: 1 }
      before {hashtag.searches_increase}
      it do
        expect(hashtag.day_searches).to eq 2
        expect(hashtag.searches).to eq 2
      end
    end
  end
end