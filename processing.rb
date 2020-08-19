# -*- coding: utf-8 -*-

input_file = ARGV[0]
output_file = ARGV[1]
array = []

File.open(input_file, mode = 'r') do |f|
  f.each_line do |line|
    cells = line.split(',') # 項目の配列化
    cells[0, 5] = []
    array.push(cells)
  end
end

File.open(output_file, mode = 'w') do |f|
  array.each do |line|
    f.write("#{line.join(",").gsub(/[\r\n]/,"").strip}\n")
  end
end
