require 'json'

class GuessController < ApplicationController
  include GuessControllerHelper

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

    format.json { render json: @gender_guess }
  end

# GET
  def results
    @people = Person.all
  end

end



