#iterative method for generating
#the fibonacci sequence

def fibs(n)
  n.floor.to_i
  return "error" if n < 1
  fib_a = [0,1]
  (n - 1).times { fib_a << (fib_a[-1] + fib_a[-2])}
  fib_a
end

#recursive method for generating
#the fibonacci sequence

def fibs_rec(n,i = 0, j = 1, fib = [0])
  n == 0 ? fib : (fib << j; fibs_rec(n-1, j, i+j, fib))
end

