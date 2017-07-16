require "./iris_data"
require "./flower"


flowers = IrisData.getIris
IrisData.populate_centroids flowers

porcentagem_acertos = []

10.times do |i|

	randFlowers = IrisData.getIris(10)
	acertos = 0

	randFlowers.each do |flower|
		prediction = flower.classify IrisData.centroids

		if flower.type == prediction
			acertos+=1
		end
	end

	puts ("acertou #{acertos} de #{randFlowers.size} flores testadas")
	porcentagem_acertos << acertos.to_f/randFlowers.size.to_f
end

puts "A media foi #{porcentagem_acertos.inject(:+).to_f/porcentagem_acertos.size.to_f}"
