require "pry"

def get_first_name_of_season_winner(data, season)
  winner_first_name = ""
  data[season].each do |contestant_hash|
    if contestant_hash["status"] == "Winner"
      winner_array = contestant_hash["name"].split(" ")
      winner_first_name = winner_array[0]
    end
  end
  winner_first_name
end

def get_contestant_name(data, occupation)
  name = ""
  data.each do |season, contestant_array|
    contestant_array.each do |contestant_info|
      if contestant_info["occupation"] == occupation
        name = contestant_info["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, contestant_array|
    contestant_array.each do |contestant_info|
      if contestant_info["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  job = ""
  data.each do |season, contestant_array|
    contestant_array.each do |contestant_info|
      if contestant_info["hometown"]==hometown && job==""
        job = contestant_info["occupation"]
      end
    end
  end
  job
end

def get_average_age_for_season(data, season)
  age_sum = 0.0
  num_contestants = 0
  data[season].each do |contestant_info|
    age_sum += contestant_info["age"].to_f
    num_contestants += 1
  end

  (age_sum/num_contestants).round
end
