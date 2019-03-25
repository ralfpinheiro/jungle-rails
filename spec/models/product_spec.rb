require 'rails_helper'

RSpec.describe ProductSpec, type: :model do

  before do
    @category = Category.create!(name: 'fdasfasfa')
    @product = @category.products.new(name: 'test', price: 100, quantity: 1, category: @category)
  end

    describe 'Validations' do

    it 'returns true if all fields are valid' do 
      @product.save!
      expect(@product).to be_persisted
    end


    it "it has a valid name" do
      @product.name = nil
      
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "has a current price" do
      @product.price_cents = nil

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "has a valid quantity" do
      @product.quantity = nil

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "has a valid category" do
      @product.category = nil
      
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
