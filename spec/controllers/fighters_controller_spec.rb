require 'rails_helper'

RSpec.describe FightersController, :type => :controller do

  let(:fighter_1) { create :fighter }
  let(:fighter_2) { create :fighter }

  describe "GET index" do
    it 'should be successful' do
      get :index
      expect(response).to be_successful
      expect(assigns(:fighters)).to include(fighter_1)
      expect(assigns(:fighters)).to include(fighter_2)
     end
  end


  describe 'POST create' do
    let(:fighter_attrs){{
      name: "JCVD",
      content: "Un pro du kung fu"
    }}
    let(:request){ post :create, params: {fighter: fighter_attrs }}

    it "should create a new fighter" do
      expect{request}.to change{ Fighter.count }.by 1
    end

  end

end
