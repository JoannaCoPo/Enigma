a = ("a".."z").to_a << " "
p a

def shift_a
  3
end

def shift_b
  27
end

def shift_c
  73
end

def shift_d
  20
end

p a.rotate(20)[15]
