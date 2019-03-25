require 'rails_helper'

RSpec.describe UserSpec, type: :model do

  before do
    @user = User.new(first_name: "Ralf", last_name:"Pinheiro", email: "test2@ralf.com", password: "ralf12", password_confirmation: "ralf12" )
  end

  describe 'Validations' do

    it "is a valid user" do
      @user.save!
      expect(@user).to be_valid
    end

    it "it has valid first name" do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it "it has valid last name" do
      @user.last_name = nil
     expect(@user).not_to be_valid
    end

    it "has a valid email" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "validates email uniqueness" do
      User.create first_name: "Liam", last_name:"Gallagher", email: "test2@ralf.com", password: "LALFLALF", password_confirmation: "LALFLALF"
      expect(subject).to be_valid
    end
    
    it "has a valid password" do
      @user.password = "RALF"
      expect(@user.password).not_to eq(@user.password_confirmation)
    end

    it "checks password length min 6" do
      @user.password = 'Blast'
      expect(@user).not_to be_valid
    end

    describe '.authenticate_with_credentials' do
      user = User.create(first_name: "Noel", last_name:"Gallagher", email: "zurich@test.com", password: "123456", password_confirmation: "123456")

      it 'has uppercase and spaces' do 
        logged_user = User.authenticate_with_credentials('   ZUrich@test.com', '123456')
        expect(logged_user.email).to eq(user.email)
      end

      it 'email doesnt match' do
        logged_user = User.authenticate_with_credentials('urich@test.com', '123456')
        expect(logged_user).to eq(nil)
      end

      it 'password doesnt match' do
        logged_user = User.authenticate_with_credentials('zurich@test.com', 'QQ123456')
        expect(logged_user).to eq(nil)
      end
      
      
    end


  end

end
