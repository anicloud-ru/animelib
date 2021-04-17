describe Anime do
  describe 'relations' do
    it {is_expected.to have_many(:arcs)}
    it {is_expected.to have_many(:episodes)}
  end
  describe 'enumerize' do
    it {is_expected.to enumerize(:kind).in(*Types::Anime::KIND.values)}
    it {is_expected.to enumerize(:status).in(*Types::Anime::STATUS.values)}
    it {is_expected.to enumerize(:age_rating).in(*Types::Anime::AGE_RATING.values)}
  end
  describe 'methods' do
    let(:genre) { create :genre }
    let(:hashtag) {create :hashtag }
    let(:anime) { create :anime, genres_ids: [genre.id], hashtags_ids: [hashtag.id] }
    describe '#genres' do
      it { expect(anime.genres).to eq [genre] }
    end
    describe '#hashtags' do
      it { expect(anime.hashtags).to eq [hashtag] }
    end
  end
end