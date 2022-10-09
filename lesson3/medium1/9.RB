=begin

What would be the return value of the following method invocation?

bar(foo)

=end

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)


#result is "no"
#the value returned by foo will always be "yes", and when param == "no" ? "yes" : "no", the result is false OR "no".
