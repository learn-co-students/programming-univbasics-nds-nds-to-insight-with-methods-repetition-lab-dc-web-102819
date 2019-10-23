
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

def gross_for_director(gross)
  total_number = 0
  index_of = 0

  while index_of < gross[:movies].length do
    total_number += gross[:movies][index_of][:worldwide_gross]
    index_of += 1
  end

  total_number
end

def list_of_directors(source)
  new_array = []
  k = 0
  
  while k < source.length do
    staged_movies = source[k][:name]
    new_array << staged_movies
    k += 1
end
new_array
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  
  director_earning_total = directors_totals(source)
  director_names = list_of_directors(source)
  i = 0
  total = 0
  
  while i < director_names.length do
    dir_name = director_names[i]
    total += director_earning_total[dir_name]
    i += 1
end
total
end

