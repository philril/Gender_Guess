require 'rails_helper'
require 'spec_helper'

RSpec.describe GuessController, type: :controller do

  # before :each do
  #   @person = create(:person)
  # end

  describe "POST ..." do
    it "..." do
      post :make_guess, {height: 78, weight: 120}
      expect(response).to have_http_status(:success)
    end
  end



end
