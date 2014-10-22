require 'rails_helper'

RSpec.describe PagersController, :type => :controller do

  describe "GET page1" do
    it "returns http success" do
      get :page1
      expect(response).to be_success
    end
  end

  describe "GET page2" do
    it "returns http success" do
      get :page2
      expect(response).to be_success
    end
  end

end
