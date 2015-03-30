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

    @height = params[:height]
    @weight = params[:weight]
    @gender_guess = guess(heights, weights, genders, @height, @weight)

    respond_to do |format|
      format.js {render 'make_guess.js.erb'}
    end
  end


#POST
  def correct
    @person = Person.create(
      height: params[:height],
      weight: params[:weight],
      gender: convert(params[:guessed_gender]),
      guess_correct: true
    )
    @num_correct = Person.where(guess_correct:true).length
    @total_num = Person.all.length

    respond_to do |format|
      if @person.save
        format.js   {render 'guess_stats.js.erb'}
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

# # POST
#   def incorrect
#     Person.create(
#       height: params[:height],
#       weight: params[:weight],
#       gender: convert(params[:guessed_gender]),
#       guess_correct: false
#     )
#   end

end



