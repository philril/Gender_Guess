require 'json'

class GuessController < ApplicationController
  skip_before_action :verify_authenticity_token
  include GuessControllerHelper

#GET
  def index

  end

# POST
  def make_guess
    #Refactor!
    heights = Person.pluck(:height)
    weights = Person.pluck(:weight)
    genders = Person.pluck(:gender)

    my_guess = initiate(heights, weights, genders)

    height_entry = params[:height]
    weight_entry = params[:weight]
    @gender_guess = get_gender_val(height_entry, weight_entry)

    respond_to do |format|
      # format.html
      format.js   {render 'make_guess.js.erb'}
      # format.json { render json: @gender_guess }
    end
  end

# GET
  def results
    @people = Person.all
  end

end



