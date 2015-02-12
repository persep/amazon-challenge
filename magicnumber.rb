def prime?(num)
	(2..Math.sqrt(num).ceil).each { |i| return false if num % i == 0}
	true
end

line, line_num = File.foreach("numbers.txt").
	lazy.with_index.
	select { |line, line_num|  line.to_i == line_num and prime?(line.to_i) }.first

p "The magic number is #{line.chomp} on line #{line_num}"
