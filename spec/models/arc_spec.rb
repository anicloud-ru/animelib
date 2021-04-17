describe Arc do
  describe 'relations' do
    it {is_expected.to belong_to(:anime)}
  end
  describe '#episodes_number' do
    let(:arc) {create :arc, episodes: '{1, 4}'}
    it {expect(arc.episodes_number).to eq 4}
  end
end