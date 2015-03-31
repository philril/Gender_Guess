class GuessController < ApplicationController
  include GuessControllerHelper

# POST
  def make_guess
    # Guess based upon linear regression calculation (in helper methods)
    # Get all heights, weights, and genders to base guess upon:
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
  def correct
    #If guess correct, store gender and correct guess in DB.
    #To-do: Use strong params (with flip_gender and convert_gender_string methods built in somehow)
    person = Person.create(
      height: params[:height],
      weight: params[:weight],
      gender: convert_gender_string(params[:guessed_gender]),#convert string to -1/1 to store.
      guess_correct: true
    )
    if person.save
      redirect_to results_path
    else
      flash[:error] = person.errors.full_messages
    end
  end

# POST
  def incorrect
    #If incorrect, switch gender to store correct gender in DB.
    #To-do: Use strong params (with flip_gender and convert_gender_string methods built in somehow)
    person = Person.create(
      height: params[:height],
      weight: params[:weight],
      gender: flip_gender(params[:guessed_gender]),#convert string to -1/1 to store.
      guess_correct: false
    )
    if person.save
      redirect_to results_path
    else
      flash[:error] = person.errors.full_messages
    end
  end

#GET
  def results
    @num_correct = Person.where(guess_correct:true).length
    @total_num = Person.where(guess_correct:false).length + Person.where(guess_correct:true).length
    @percent = (@num_correct.to_f / @total_num.to_f * 100).round
  end

end



