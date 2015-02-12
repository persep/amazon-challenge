# Fastest algoritm to calculate pi iteratively
# http://www.cs.utsa.edu/~wagner/pi/pi.html
# Faster than
# http://rosettacode.org/wiki/Pi#Ruby
# Calculates all digits
# http://rubyquiz.strd6.com/quizzes/202-digits-of-pi

def palindrome?(str)
    str == str.reverse
end

pi_generator = Enumerator.new do |yielder|
  k, a, b, a1, b1 = 2, 4, 1, 12, 4
  loop do
    p, q, k = k*k, 2*k+1, k+1
    a, b, a1, b1 = a1, b1, p*a+q*a1, p*b+q*b1
    d, d1 = a/b, a1/b1
    while d == d1
      yielder.yield d
      a, a1 = 10*(a%b), 10*(a1%b1)
      d, d1 = a/b, a1/b1
    end
  end
end

tenpal,position = pi_generator.
  lazy.each_cons(10).with_index.
  select { |num,i| palindrome? num }.
  first  

p "The first 10-digit palindrome is #{tenpal.join} at position #{position} => www.#{tenpal.join}.com"
