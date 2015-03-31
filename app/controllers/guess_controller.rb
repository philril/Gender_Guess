require 'json'

class GuessController < ApplicationController
  include GuessControllerHelper

#GET
  def index

  end

# POST
  def make_guess
    heights = Person.pluck(:height)
    weights = Person.pluck(:weight)
    genders = Person.pluck(:gender)

    # @height = params[:height]
    @height = convert_feet_inches(params[:feet], params[:inches])
    @weight = params[:weight]
    @gender_guess = guess(heights, weights, genders, @height, @weight)

    respond_to do |format|
      format.js {render 'make_guess.js.erb'}
    end
  end

#POST
  def correct
    @person = Person.new(
      height: params[:height],
      weight: params[:weight],
      gender: convert_gender_string(params[:guessed_gender]),
      guess_correct: true
    )
    redirect_to results_path
  end

# POST
  def incorrect
    Person.create(
      height: params[:height],
      weight: params[:weight],
      gender: convert_gender_string(params[:guessed_gender]),
      guess_correct: false
    )
    redirect_to results_path
  end

  def results
    @num_correct = Person.where(guess_correct:true).length
    @total_num = Person.all.length
  end

end



