require 'rails_helper'

describe JobsController do
  let(:company) { create(:company) }
  let(:jobs) { create_list(:job, 2) }

  describe '#index' do
    context 'ログインしているとき' do
      before do
        login company
        get :index, params: { company_id: company.id }
      end

      it 'indexビューに飛ぶか' do
        expect(response).to render_template :index
      end
    end
  end
end