def list_weapons
  print "\n"
  Weapon.all.each do |weapon|
    puts "#{weapon.id}. #{weapon.name}"
  end
  puts "\nPlease pick a weapon by number."
  nil
end

def list_weapon_commands(weapon_input)
  puts "\nEnter number of command for #{Weapon.find(weapon_input).name}:
  1. Show country
  2. Show type of weapon
  3. Show characteristics of #{Weapon.find(weapon_input).name}
  "
end

def all_weapon_countries(weapon_input)
   a = Weapon.find(weapon_input).countries.map do |country|
    country.name
  end.uniq.compact
    star_divider
    a.each {|x| puts x}
  nil
end

def all_weapon_type(weapon_input)
  star_divider
  puts Weapon.find(weapon_input).type.name
  nil
end

def display_characteristics(weapon_input)
  star_divider
  puts "#{Weapon.find(weapon_input).name}:"
  Weapon.find(weapon_input).range ? (puts "Range is #{Weapon.find(weapon_input).range}") : (puts "Range is unknown")
  Weapon.find(weapon_input).caliber ? (puts "Caliber is #{Weapon.find(weapon_input).caliber}") : (puts "Caliber is unknown")
  Weapon.find(weapon_input).weight ? (puts "Weight is #{Weapon.find(weapon_input).weight}") : (puts "Weight is unknown")
end

def determine_weapon_command(weapon_input, weapon_command_input)
  case weapon_command_input
    when 1
      all_weapon_countries(weapon_input)
    when 2
      all_weapon_type(weapon_input)
    when 3
      display_characteristics(weapon_input)
  end
end
