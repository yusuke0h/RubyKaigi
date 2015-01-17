require 'json'

data = JSON.load(open("testdata.json").read)

operaters = [ "|", "&", "+", "*" ]

data.each do |line|
  print susiki =  line[1].to_s, "\t"
  print line.last, "\t"
  arr = susiki.scan(/\||&|\*|\+|\d+/)

  operaters.each do |operater|
    while index = arr.index(operater)
      result = eval("#{arr[index-1]} #{operater} #{arr[index+1]}")
      arr[index-1..index+1] = result.to_s
    end
  end

  print arr, "\n"
end
