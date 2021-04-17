describe Arc do
  describe 'relations' do
    it {is_expected.to belong_to(:anime)}
  end
  describe '#series_number' do
    let(:arc) {create :arc, series: '{1, 4}'}
    it {expect(arc.series_number).to eq 4}
  end
end