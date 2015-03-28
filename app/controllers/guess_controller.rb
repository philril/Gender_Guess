class GuessController #< ApplicationController

  def guess(height_entry, weight_entry)
    heights = #make activerecord query for all height entries
    weights = #make activerecord query for all weight entries
    genders = #make activerecord query for all gender entries

    this_guess = Guess.new(heights, weights, genders)
    gender_guess = get_gender_val(height_entry, weight_entry)

  end

end

