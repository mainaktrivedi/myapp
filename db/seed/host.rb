Org.all.each do |org|
	(1..3).each do |i|
		Host.create(name: "Host#{i}For#{org.name}", org: org)
	end
end 