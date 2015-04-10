def isPrime(n) 
  x=2
  while x<=n**0.5
    if n % x == 0
      return false
    end
    x+=1
  end
  return true
end


def sieve(n)  
  array = (2..n).to_a  
  primes = []   
  x=0
  while x <= n**0.5 
    x=array[0]
    array = array.select { |num| num % x != 0 }  
    primes<<x
  end  
  primes += array
  primes  
end  

puts sieve(100000)   #这个sieve方法比isPrime＋prime_generate那个组合快三倍多。。
puts isPrime(99990)
puts isPrime(99991)
puts isPrime(99992)


def prime_generate
  x=2
  while true
    if isPrime(x)
      yield x
    end
    x+=1
  end
end

prime_generate do |prime|
  if prime > 100000
    break
  end
  puts prime
end

