require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Health INC", "vivek", "www.healthinc.com")
s2 = Startup.new("yurrr INC", "vivek", "www.yurrrrr.com")

v1 = VentureCapitalist.new("Rich guy 1", 100_000_000_000)
v2 = VentureCapitalist.new("Rich guy 2", 50000)

r1 = FundingRound.new(s1, v1, type = "pre", investment = 0)
r2 = FundingRound.new(s2, v1, type = "pre", investment = 10)
r3 = FundingRound.new(s2, v2, type = "post", investment = 1)
r4 = FundingRound.new(s1, v1, type = "ROUND A", investment = 150)
r5 = FundingRound.new(s1, v1, type = "Final Round", investment = 80000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line