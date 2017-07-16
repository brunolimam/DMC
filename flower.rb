require "byebug"

class Flower
  attr_accessor :sepal_width, :sepal_length, :petal_width, :petal_length, :type, :dist

  def initialize(data_array)
    @sepal_width = data_array[1].to_f
    @sepal_length = data_array[0].to_f
    
    @petal_width = data_array[3].to_f
    @petal_length = data_array[2].to_f
    
    @type = data_array[4]
  end

  def self.index_type type
    {"Iris-setosa" => 0, "Iris-versicolor" => 1, "Iris-virginica" => 2}[type]
  end

  def self.type_by_index index
    ["Iris-setosa", "Iris-versicolor", "Iris-virginica"][index]
  end

  def attribute_values
    [sepal_width, sepal_length, petal_width, petal_length]
  end

  def classify centroids
    index = 0
    minor_dist = -1

    centroids.each_with_index do |centroid, i|
      dist = distance(attribute_values, centroid)

      if dist < minor_dist || minor_dist == -1
        minor_dist = dist
        index = i
      end
    end

    Flower.type_by_index index
  end

  def distance(vector_a, vector_b)
    diff = 0.0
    sum = 0.0

    vector_a.each_with_index do |value, index|
      diff = (value-vector_b[index]).abs
      sum += diff**2
    end

    Math.sqrt(sum)
  end
    
end
