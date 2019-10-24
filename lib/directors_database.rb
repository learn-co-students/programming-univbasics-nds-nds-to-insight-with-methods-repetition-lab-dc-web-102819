require 'yaml'

def directors_database
	rot13 = -> (s) { s.tr('A-Za-z', 'N-ZA-Mn-za-m') }
  @_db ||= YAML.load(rot13.call(File.open("directors_db").read.to_s))
end

grand_total = 0
row_index = 0
while row_index < vm.length do
  column_index = 0
  while column_index < vm[row_index].length do
    grand_total += total_value_of_spinner(vm, row_index, column_index)
    column_index += 1
  end
  row_index += 1
end
