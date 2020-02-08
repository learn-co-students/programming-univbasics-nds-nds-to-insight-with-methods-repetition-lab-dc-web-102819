$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source)
  director_index = 0
  array=[]
  while director_index < source.length do
    array << source[director_index][:name]
    director_index+=1
  end
  array
end
 
def total_gross(source)
  total = 0
  index = 0
  while index < source.length do
    list_directors = list_of_directors(source)[index]
    total += directors_totals(source)[list_directors]
    index+=1
  end
  total
end



