describe ArcsController do
  describe 'GET show' do
    let(:arc) { create :arc }
    it do
      get :show, params: { id: arc.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    let(:arc) { create :arc }
    it do
      get :edit, params: { id: arc.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
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
    before { post :create, params: { arc: params } }
    let(:params) do
      {
        canonical: 'test123',
        russian: 'Тест123'
      }
    end
    it do
      expect(assigns(:arc)).to be_persisted
      expect(response).to redirect_to(assigns(:acs))
    end
  end

  describe 'PATCH update' do
    let(:arc) { create(:arc) }
    let(:params) do
      {
        canonical: 'newtest123'
      }
    end
    before { patch :update, params: { id: arc.id, arc: params } }
    it do
      expect(assigns(:anime).reload).to have_attributes params
      expect(assigns(:anime).errors).to be_empty
      expect(response).to redirect_to(assigns(:arc))
    end
  end
end
