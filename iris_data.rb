require "./flower"

class IrisData

  @@centroids = [[0,0,0,0],[0,0,0,0],[0,0,0,0]]

  def self.getIris count = nil
    test_data = []

    File.open("irisValues.txt", "r") do |file|
      lines = []
      while (line = file.gets)
        lines << line.strip
      end


      lines.size.times do |i|
        rand_value = rand(lines.size-1)
        rand_line = lines.delete_at(rand_value)

        components = rand_line.split(",")
        flower = Flower.new(components)

        test_data << flower  

        return test_data if !count.nil? && test_data.size >= count
      end
      
    end

    return test_data
  end

  def self.getRandomIris
    flower=0

    File.open("irisValues.txt", "r") do |file|
      lines = []
      while (line = file.gets)
        lines << line.strip
      end


      rand_value = rand(lines.size-1)
      rand_line = lines.delete_at(rand_value)

      components = rand_line.split(",")
      flower = Flower.new(components)      
    end

    return flower
  end

  def self.populate_centroids array_iris
    counter = [0,0,0]

    array_iris.each do |iris|
      index_type = Flower.index_type iris.type
      counter[index_type] +=1

      attributes = iris.attribute_values
      attributes.each_with_index do |attribute_value, i|
        @@centroids[index_type][i] += attribute_value
      end
    end

    @@centroids.each_with_index do |centroid, i|
      centroid.size.times do |j|
        centroid[j] /= counter[i]
      end

    end
  end

  def self.centroids
    @@centroids
  end

end