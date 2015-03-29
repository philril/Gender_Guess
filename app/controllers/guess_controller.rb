class GuessController < ApplicationController
  helper GuessControllerHelper

# POST
  def make_guess(height_entry, weight_entry)
    heights = Person.pluck(:height)
    weights = Person.pluck(:weight)
    genders = Person.pluck(:gender)

    my_guess = GuessModule.new(heights, weights, genders)
    @gender_guess = my_guess.get_gender_val(height_entry, weight_entry)
    puts @gender_guess
  end

# GET
  def results
    Person.all
  end

end



