require "rest-client"
require "json"
require "pry"




# response = RestClient.get "http://www.songsterr.com/a/ra/songs.json?pattern=Marley"
#
# result_array = JSON.parse(response)


def rest_and_parse(url)
  response = RestClient.get "#{url}"
  result_array = JSON.parse(response)
end


def search(artist)
  result = rest_and_parse("http://www.songsterr.com/a/ra/songs.json?pattern=#{artist}")

  result.each do |song|
    puts song["title"]
    puts "\n \t#{song["artist"]["name"]}"
    puts "\n"
    puts song["id"]
    puts "-------------------------------"
  end
end

def open_url(song)

puts "open http://www.songsterr.com/a/wa/bestMatchForQueryString?s=#{song}"

end

binding.pry


def song_names_from_artist(artist)
  search(artist).map do |song|
    song["title"]
  end
end


def song_search(song)
  rest_and_parse("https://www.songsterr.com/a/ra/songs.json?pattern=#{song}")
end

def search_instructions_message
  puts "\n"
  puts "Type what you are looking for. Type '?' for more options"
  puts "\n"
  puts "\n"
end

def welcome_message
  puts "************************************************"
  puts "\n"
  puts "            Welcome To Music Player!            "
  puts "\n"
  puts "************************************************"
  puts "\n"
end

def goodbye_message
  puts "************************************************"
  puts "\n"
  puts "                    Goodbye!                    "
  puts "\n"
  puts "************************************************"
  puts "\n"
end

def user_search
  input = gets.chomp
end




#welcome the user
# ----- loop -----
# #gets users input
# #shows results
# ------------------

def runner
  welcome_message

  loop do
    search_instructions_message

    input = gets.chomp
    puts "\n"
    if input == "!!!"
      goodbye_message
      break
    elsif input == "?"
      puts "Available Commands"
      puts "\t '!!!' quit"
      puts "\t two command"
      puts "\t three command"
      puts "\t four command"
    elsif input.class == Integer
      song_by_id(input)
    else
      search(input)
    end
  end

end


runner




# binding.pry
