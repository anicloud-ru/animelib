describe AnimesController do
  describe 'GET index' do
    it do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:anime) { create :anime }
    it do
      get :show, params: { id: anime.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new' do
    it do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    before { post :create, params: { anime: params } }
    let(:params) do
      {
        canonical: 'test123',
        russian: 'Тест123',
        optionally: 'optionally'
      }
    end
    it do
      expect(assigns(:anime)).to be_persisted
      expect(response).to redirect_to(assigns(:anime))
    end
  end

  describe 'PATCH update' do
    let(:anime) { create(:anime) }
    let(:params) do
      {
        canonical: 'newtest123'
      }
    end
    before { patch :update, params: { id: anime.id, anime: params } }
    it do
      expect(assigns(:anime).reload).to have_attributes params
      expect(assigns(:anime).errors).to be_empty
      expect(response).to redirect_to(assigns(:anime))
    end
  end

  describe 'GET arcs' do
    let(:anime) { create(:anime) }
    let(:arcs) { create(:anime) }
    it do
      get :arcs, params: { id: anime.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:arcs)
    end
  end
  #describe 'DELETE destroy' do
  # before { delete :destroy, params: { id: anime.id } }
  # let(:anime) { create(:anime) }
  #
  # it do
  #   expect(assigns(:anime)).not_to be_persisted
  #   expect(assigns(:anime).errors).to be_empty
  #   expect(response).to redirect_to(animes_path)
  # end
  #end
end
