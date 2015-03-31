require 'rails_helper'
require 'spec_helper'

RSpec.describe GuessController, type: :controller do

  describe "GET index" do
    it "renders index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST make_guess" do
    it "makes a guess" do
      post :make_guess,  :format => 'js', guess: {feet: 6, inches: 2, weight: 123}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST correct" do
    it "Correct should redirect to results" do
      post :correct, :format => 'js', guess: {feet: 6, inches: 2, weight: 123, guessed_gender: "Male"}
      expect(response).to redirect_to(results_url)
    end
  end

  describe "POST incorrect" do
    it "Incorrect should redirect to results" do
      post :incorrect, :format => 'js', guess: {feet: 6, inches: 2, weight: 123, guessed_gender: "Male"}
      expect(response).to be_redirect
    end
  end

  describe "GET results" do
    it "gets results" do
      get :results
      expect(response).to have_http_status(:success)
    end
  end

end
