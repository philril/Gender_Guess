  module GuessControllerHelper
    def guess(heights, weights, genders, height_entry, weight_entry)
      @heights = heights
      @weights = weights
      @genders = genders
      @b0 = b0
      @b1 = slope_height
      @b2 = slope_weight

      if @heights.length != @weights.length
        raise "Unbalanced data"
      else
        get_gender_val(height_entry, weight_entry)
      end
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

    def get_gender_val(height, weight)
      val = @b0 + (@b1 * height.to_i) + (@b2 * weight.to_i)
      return val > 0 ? 'Male' : 'Female'
    end

    def convert(gender_string)
      case gender_string.downcase
      when "male" then return 1
      when "female" then return -1
      end
    end
  end
