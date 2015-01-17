require 'json'
require 'pp'

data = JSON.load(open("testdata.json").read)


operaters = [ "|", "&", "+", "*" ]
operater_hash = {
  "|": true,
  "&": true,
  "+": true,
  "*": true,
}

tree = {}

data.each do |line|
  print susiki =  line[1].to_s, "\t"
  print line.last, "\t"
  arr = susiki.scan(/\||&|\*|\+|\d+/)
  while arr.include?("|") | arr.include?("&") | arr.include?("+") | arr.include?("*")
    # p arr
    operaters.each do |operater|
      if index = arr.index(operater)
        case operater
        when "|"
          result = arr[index-1].to_i | arr[index+1].to_i
        when "&"
          result = arr[index-1].to_i & arr[index+1].to_i
        when "*"
          result = arr[index-1].to_i * arr[index+1].to_i
        when "+"
          result = arr[index-1].to_i + arr[index+1].to_i
        end
        arr[index-1..index+1] = result
        break
      end
    end

    # arr.each_with_index do |elem, index|
    #   if operater_hash[elem.to_s.to_sym]
    #     case elem
    #     when "|"
    #       result = arr[index-1].to_i | arr[index+1].to_i
    #     when "&"
    #       result = arr[index-1].to_i & arr[index+1].to_i
    #     when "*"
    #       result = arr[index-1].to_i * arr[index+1].to_i
    #     when "+"
    #       result = arr[index-1].to_i + arr[index+1].to_i
    #     end
    #     arr[index-1..index+1] = result
    #     break
    #   end
    # end
  end
  print arr, "\n"
  # exit
end


# data.each do |line|
#   p susiki =  line[1].to_s
#   if susiki.include?('*')
#     asuta = susiki.split('*')
#     tree['*'] = asuta
#     plus  = asuta.map { |e| e.split('+') }
#     tree['+']  = plus
#     anpersand  = plus.map { |e| e.map { |e2| e2.split('&') } }
#     tree['&']  = anpersand
#     pipe  = anpersand.map { |e| e.map { |e2| e2.map { |e3| e3.split('|') } } }
#     tree['|']  = pipe
#   end
#   pp tree
#   # exit
# end


# data.each do |line|
#   susiki =  line[1].to_s
#   result = 0
#   p susiki.split('*')
#   susiki.split('*').each do |e|
#     e.split("+").each do |e2|
#       e2.split("&").each do |e3|
#         if e3.include?("|")
#           e3.split("|").each_with_index do |e4, index|
#             if index == 0
#               result = e4.to_i
#             else
#               result = result | e4.to_i
#             end
#           end
#        end
#       end
#     end
#   end
#   p result
#   # exit
# end


# def split_by_operator s
#   arr = []
#   operaters = [ "|", "&", "+", "*" ]
#   operaters.each do |operater|
#     s.split(operater).each do |e|
#       arr << e
#       arr << operater
#     end
#   end
#   return arr
# end

# data.each do |line|
#   susiki =  line[1].to_s
#   pp split_by_operator susiki
#   exit
# end


