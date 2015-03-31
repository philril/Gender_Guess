module GuessControllerHelper
# Linear Regression calculation to make guess:
  def guess(heights, weights, genders, height_entry, weight_entry)
    @heights, @weights, @genders = heights, weights, genders
    @b0, @b1, @b2 = b0, slope_height, slope_weight

    if @heights.length != @weights.length
      raise "Unbalanced data"
    else
      get_gender_val(height_entry.to_i, weight_entry.to_i)
    end
  end

  def get_gender_val(height, weight)
    val = @b0 + (@b1 * height.to_i) + (@b2 * weight.to_i)
    # Male is > 0, Female is < 0
    return val > 0 ? "Male" : "Female"
  end

  def b0
    mean(@genders) - (slope_height * mean(@heights)) - (slope_weight * mean(@weights))
  end

  def slope_height
    height_mean = mean(@heights)
    weight_mean = mean(@weights)

    numerator = (0...@heights.length).reduce(0) do |sum, i|
      sum + ((@heights[i] - height_mean) * (@weights[i] - weight_mean))
    end

    denominator = @heights.reduce(0) do |sum, x|
      sum + ((x - height_mean) ** 2)
    end

    (numerator / denominator)
  end

  def slope_weight
    height_mean = mean(@heights)
    weight_mean = mean(@weights)

    numerator = (0...@heights.length).reduce(0) do |sum, i|
      sum + ((@heights[i] - height_mean) * (@weights[i] - weight_mean))
    end

    denominator = @heights.reduce(0) do |sum, y|
      sum + ((y - weight_mean) ** 2)
    end

    (numerator / denominator)
  end

  def mean(values)
    total = values.reduce(0) { |sum, x| x + sum }
    Float(total) / Float(values.length)
  end

# Other helper methods to convert data to correct format:
  def convert_gender_string(gender_string)
    case gender_string
    when "Male" then return 1
    when "Female" then return -1
    end
  end

  def flip_gender(gender_string)
    case gender_string
    when "Male" then return -1
    when "Female" then return 1
    end
  end

  def convert_feet_inches(feet, inches)
    return feet.to_i * 12 + inches.to_i
  end

end
