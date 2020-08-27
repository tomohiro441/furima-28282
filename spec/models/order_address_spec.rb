require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user =   FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item =  FactoryBot.create(:item, user_id: seller.id)
    item.image = fixture_file_upload('spec/fixtures/test_image.png')
    @address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の登録' do
    context '配送先住所が正しく保存できる場合' do
      it '郵便番号、都道府県、市区町村、番地、電話番号がそれぞれ正しく存在すれば登録できる' do
        expect(@address).to be_valid
      end
    end

    context '配送先住所が保存できない場合' do
      it '郵便番号が空だと登録できない' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン（-）が含まれていないと登録できない' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid") 
      end
      it '都道府県の情報が空だと登録できない' do
        @address.prefecture_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村の情報が空だと登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の情報が空だと登録できない' do
        @address.house_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフン（-）が含まれていると登録できない' do
        @address.phone_number = '080-1111-1111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid") 
      end
    end
  end
end