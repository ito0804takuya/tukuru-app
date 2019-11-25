require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:company) { create(:company) }

  describe '#create' do
    context '保存できるか' do
      it '項目が全て入力されていたら' do
        expect(build(:job, company_id: company.id)).to be_valid
      end
      it '必須項目以外が全て無くても' do
        expect(build(:job, url: nil, postal_code: nil, bulding: nil, seeker_id: nil, company_id: company.id)).to be_valid
      end
    end
    context '保存できないか' do
      it 'nameが無かったら' do
        job = build(:job, name: nil, company_id: company.id)
        job.valid?
        expect(job.errors[:name]).to include("入力してください")
      end
      it 'bodyが無かったら' do
        job = build(:job, body: nil, company_id: company.id)
        job.valid?
        expect(job.errors[:body]).to include("入力してください")
      end
      it 'telが無かったら' do
        job = build(:job, tel: nil, company_id: company.id)
        job.valid?
        expect(job.errors[:tel]).to include("入力してください")
      end
      it 'emailが無かったら' do
        job = build(:job, email: nil, company_id: company.id)
        job.valid?
        expect(job.errors[:email]).to include("入力してください")
      end
      it 'cityが無かったら' do
        job = build(:job, city: nil, company_id: company.id)
        job.valid?
        expect(job.errors[:city]).to include("入力してください")
      end
      it 'blockが無かったら' do
        job = build(:job, block: nil, company_id: company.id)
        job.valid?
        expect(job.errors[:block]).to include("入力してください")
      end
      it 'prefecture_idが無かったら' do
        job = build(:job, prefecture_id: nil, company_id: company.id)
        job.valid?
        expect(job.errors[:prefecture_id]).to include("選択してください")
      end
    end
  end
end