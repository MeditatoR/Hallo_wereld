alphabet_table = {}
((:A..:Z).zip(1..26)).each { |x| alphabet_table[x[0]] = x[1] }

alphabet_table.select! { |k,v| [:A, :E, :I, :O, :U].include?(k) }

alphabet_table.each { |k, v| puts "#{k} - #{v}" }
