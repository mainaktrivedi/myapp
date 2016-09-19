require "rails_helper"
#require 'test_helper'

describe EventsController, type: :controller do

  before do
    Rails.application.load_seed
  end


  describe "GET #index" do

    

    context "when passed right orgname" do

      let :path do
        get :index, params: {orgname: 'Org1'}
      end

      before do
        path
      end

      it "responds with a successful status code" do
        expect(response).to be_success
      end

      it "returns JSON" do
        expect(response.content_type).to eq('application/json')
      end

      it "responds with a 200 status code" do
        expect(response.status).to eq(200)
      end


    end

    context "when passed right orgname and hostname" do
 
      let :path do
        get :index, params: {orgname: 'Org1', hostname: 'Host1ForOrg1'}
      end

      before do
        path
      end

      it "responds with a successful status code" do
        expect(response).to be_success
      end

      it "returns JSON" do
        expect(response.content_type).to eq('application/json')
      end

      it "responds with a 200 status code" do
        expect(response.status).to eq(200)
      end


    end

    context "when passed wrong orgname" do
 
      let :path do
        get :index, params: {orgname: 'Org1Wrong'}
      end

      before do
        path
      end

      it "returns JSON" do
        expect(response.content_type).to eq('application/json')
      end

      it "responds with a 422 status code" do
        expect(response.status).to eq(422)
      end

      it "returns an array of errors" do
        expect(JSON.parse(response.body)["errors"]).to be_present
      end

    end

  end

  describe "GET #query" do

    
    let :path do
      get :query, params: {orgname: 'Org1'}
    end

    context "when passed right orgname" do

      before do
        path
      end

      it "responds with a successful status code" do
        expect(response).to be_success
      end

      it "returns JSON" do
        expect(response.content_type).to eq('application/json')
      end

      it "responds with a 200 status code" do
        expect(response.status).to eq(200)
      end


    end

  end

  describe "POST #create" do

     let :post_params do
        {
          occurred_at: Time.now,
          description: "testeventABCD", 
          hostname: "Host1ForOrg1"
        }
      end

      let :path do
        post :create, params: post_params
      end

      let :events_count do
        Event.count
      end

    context "with valid params" do

      before do
        path
      end

      it "responds with a successful status" do
        expect(response).to be_success
      end

      it "returns JSON" do
        expect(response.content_type).to eq('application/json')
      end

      it "responds with a 201 status code" do
        expect(response.status).to eq(201)
      end

      it "returns no error" do
        expect(JSON.parse(response.body)["description"]).to eq("testeventABCD")
        expect(JSON.parse(response.body)["id"]).to be_present
      end

    end

    context "with invalid params" do

      before do
        post_params.merge!({hostname: nil})
        path
      end



      it "returns JSON" do
        expect(response.content_type).to eq('application/json')
      end

      it "responds with a 422 status code" do
        expect(response.status).to eq(422)
      end

      it "returns an array of errors" do
        expect(JSON.parse(response.body)["errors"]).to be_present
      end

    end
  end

end
