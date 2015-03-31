require 'rails_helper'
require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the GuessControllerHelper. For example:
#
# describe GuessControllerHelperHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GuessControllerHelper, type: :helper do
  include FactoryGirl

  describe "convert_feet_inches method" do
    it "should convert feet to inches" do
      expect(convert_feet_inches(6,2)).to eq(74)
    end
  end

  describe "convert_gender_string method" do
    it "should convert 'female' to '-1" do
      expect(convert_gender_string("Female")).to eq(-1)
    end
  end

  describe "guess method" do
    it "should guess either male or female" do
      heights = [76,69,72]
      weights = [160,130,145]
      genders = [1,-1,1]
      height_entry = 70
      weight_entry = 155

      expect(["Male","Female"]).to include(guess(heights, weights, genders, height_entry, weight_entry))
    end
  end

end
