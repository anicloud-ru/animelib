describe Episode do
  describe 'relations' do
    it{is_expected.to have_many :videos}
    it{is_expected.to belong_to :anime}
  end
end