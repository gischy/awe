class String
  def is_upper?
    self == self.upcase
  end

  def is_lower?
    self == self.downcase
  end
end

def startgame
puts ""
puts "game started!"
wordlist = File.open('dictionary.txt')
words_array = wordlist.readlines

while (true) 
number = Random.new.rand(words_array.size-1)
word = words_array[number].chomp 
chararray = word.each_char.to_a
if chararray[0].is_upper?
 break
end 
end 
guess = Array.new
count = 0 

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]

for x in chararray
 print "_ "
end

puts ""

while (count < 9)

# validate input
while (true)
 print ">"
 char = gets.chomp.downcase.strip

 if char.eql?("stop") 
  exit 
 end

 if alphabet.include?(char) 
   if guess.include?(char)
    puts "letter #{char} already tried" 
   else 
    break 
   end
 else
  puts "wrong letter/character" 
 end
end

guess << char
count += 1
guessword = String.new

for x in chararray
  if guess.include?(x.downcase)
   print "#{x} "
   guessword = guessword + x
  else 
   print "_ "
  end
end
puts " "
if guessword.eql?(word) 
  puts " "
  puts "you won the game"
  puts "secret word: #{word} with #{count} tries"
  start()
end
 puts " "
end

puts "you lost the game" 
start()

end

def start 
 puts ""
 puts "usage: start - to begin a new game - stop to quit the game"
 print ">"

while (true) 
 command = gets.chomp
  if command.eql?("start")
    startgame() 
   break
 elsif command.eql?("stop")
   exit
 else  
   puts "unkown command" 
   end
 print ">"
end
end

start()
