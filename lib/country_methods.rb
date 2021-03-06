def list_countries
  print "\n"
  Country.all.each do |country|
    puts "#{country.id}. #{country.name}"
  end
  puts "\nPlease pick a country by number."
  nil
end

def list_country_commands(country_input)
  puts "\nEnter number of command for #{Country.find(country_input).name}:
  1. Show all weapons
  2. Show all types
  3. Show most popular type of weapon
  4. Show weapon with highest caliber
  5. Show heaviest weapon
  6. Show weapon with longest range
  "
end

def all_country_weapons(country_input)
  star_divider
  Country.find(country_input).weapons.each do |weapon|
    puts weapon.name
  end

  nil
end

def all_country_types(country_input)
  a=Country.find(country_input).weapons.map do |weapon|
    weapon.type.name
  end.uniq
  star_divider
  puts a
  nil
end

def most_popular_type_by_country(country_input)
  a=Country.find(country_input).weapons.map do |weapon|
    weapon.type
  end
  freq = a.inject(Hash.new(0)) { |hash,arr_element| hash[arr_element] += 1; hash }
  star_divider
  puts a.max_by { |arr_element| freq[arr_element] }.name
end

def country_highest_caliber_weapon(country_input)
  hash ={}
  Country.find(country_input).weapons.map do |weapon|
    if weapon.caliber
      hash[weapon.name] = weapon.caliber[0..-4].to_f
    end
  end

  a=hash.sort_by {|_key, value| value}.last

  if a == nil
    star_divider
    puts "All weapon calibers for #{Country.find(country_input).name} are unknown."
  else
    star_divider
    puts "#{a[0]} with a caliber of #{a[1]} mm"
  end

  nil
end

def country_heaviest_weapon(country_input)
  hash ={}
  Country.find(country_input).weapons.map do |weapon|
    if weapon.weight
      hash[weapon.name] = weapon.weight[0..-4].to_f
    end
  end

  a=hash.sort_by {|_key, value| value}.last

  if a == nil
    star_divider
    puts "All weapon weights for #{Country.find(country_input).name} are unknown."
  else
    star_divider
    puts "#{a[0]} with a weight of #{a[1]} kg"
  end

  nil
end

def country_longest_range_weapon(country_input)
  hash ={}
  Country.find(country_input).weapons.map do |weapon|
    if weapon.range
      hash[weapon.name] = weapon.range[0..-3].to_f
    end
  end

  a=hash.sort_by {|_key, value| value}.last

  if a == nil
    star_divider
    puts "All weapon ranges for #{Country.find(country_input).name} are unknown."
  else
    star_divider
    puts "#{a[0]} with a range of #{a[1]} m"
  end

  nil
end


def determine_country_command(country_input, country_command_input)
  case country_command_input
    when 1
      all_country_weapons(country_input)
    when 2
      all_country_types(country_input)
    when 3
      most_popular_type_by_country(country_input)
    when 4
      country_highest_caliber_weapon(country_input)
    when 5
      country_heaviest_weapon(country_input)
    when 6
      country_longest_range_weapon(country_input)
  end
end
