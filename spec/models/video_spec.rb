describe Video do
  describe 'relations' do
    it{is_expected.to belong_to :episode}
  end
end