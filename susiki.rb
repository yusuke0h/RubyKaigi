require 'json'
require 'pp'

data = JSON.load(open("testdata.json").read)


operaters = [
  "|",
  "&",
  "+",
  "*"
]

tree = {}

data.each do |line|
  p susiki =  line[1].to_s
  if susiki.include?('*')
    asuta = susiki.split('*')
    tree['*'] = asuta
    plus  = asuta.map { |e| e.split('+') }
    tree['+']  = plus
    anpersand  = plus.map { |e| e.map { |e2| e2.split('&') } }
    tree['&']  = anpersand
    pipe  = anpersand.map { |e| e.map { |e2| e2.map { |e3| e3.split('|') } } }
    tree['|']  = pipe
  end
  pp tree
  # exit
end


# data.each do |line|
#   susiki =  line[1].to_s
#   if susiki.include?('|')
#     p susiki.split('|')
#   end
#   # exit
# end
