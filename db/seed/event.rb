Host.all.each do |host|
	(1..2).each do |i|
		Event.create(occurred_at: Time.now, description: "Event #{i} For #{host.name}", host: host)
	end
end 