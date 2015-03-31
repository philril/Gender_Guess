class GuessController < ApplicationController
  include GuessControllerHelper

#GET
  def index
    #render index file?
  end

# POST
  def make_guess
    heights = Person.pluck(:height)
    weights = Person.pluck(:weight)
    genders = Person.pluck(:gender)

    @height = convert_feet_inches(params[:guess][:feet], params[:guess][:inches])
    @weight = params[:guess][:weight]
    @gender_guess = guess(heights, weights, genders, @height, @weight)

    respond_to do |format|
      format.js {render 'make_guess.js.erb'}
    end
  end

#POST

# REFACTOR WITH STRONG PARAMS
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

#GET
  def results
    num_correct = Person.where(guess_correct:true).length
    total_num = Person.all.length
    @percent = ((num_correct / total_num) * 100).floor
  end

end



