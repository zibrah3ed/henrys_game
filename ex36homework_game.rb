# Exercise 36 Homework Game

# Import file at run called seed.txt.

# Monster Array


def meet_monster
  mons_a = ["Ogre", "Orc", "Gnome", "Bob", "Demon", "Hrrrd", "Ikor"]
  m_hp = 100
  hp = 100
  monster = mons_a[rand(mons_a.length)] # Pick random monster based on array length.

  puts "!!_____#{monster}_____!!\n\n\n\n\n\a"
  puts "Your HP : #{hp}\n#{monster} HP : #{m_hp}\n"

      while m_hp > 0 && hp > 0

        print "(a)ttack, (d)odge, or (R)un away: "
        print "> "
        choice = $stdin.gets.chomp

        if choice.downcase == 'a'
          m_hp = attack_monster(m_hp,100,monster)
          hp = attack_ppl_mon(hp,100,monster)
          puts "The #{monster}'s hp is now : \t\t#{m_hp}\n"
          puts "The Your hp is now : \t\t\t#{hp}\n\n"

        elsif choice.downcase == 'd'
          m_hp = defend_monster(m_hp,100,monster)
          hp = defend_ppl_mon(hp,100,monster)
          puts "The #{monster}'s hp is now : \t\t#{m_hp}\n"
          puts "The Your hp is now : \t\t\t#{hp}\n\n"

        elsif choice.downcase == 'r'
            dead("Running from fights again heh, death awaits at the end of your jog.") # Change later simply a place holder, meet_boss

        else
            dead("Reading is hard you die.")
        end
      end

      if hp <= 0
        dead("Your hp has reached 0.")
      else
        puts "#{monster} defeated. Yay! You!\n"
        rand_hall

      end
end

def attack_monster(hit_points,chance,monster)
  if hit_points > 0
    if rand(chance) >= chance * 2 / 3
      puts "Successfull attack for 25 dmg.\n"
      hit_points -= 25
      return hit_points
    else
      puts "You missed the #{monster}.\n"
      return hit_points
    end
  else
    return dead()
    exit (1)
  end
end

def attack_ppl_mon(hit_points,chance,monster)
  if hit_points > 0
    if rand(chance) >= chance * 3 / 4
      puts "#{monster}'s attack suceeds. You take 10 dmg.\n"
      hit_points -= 10
      return hit_points
    else
      puts "The #{monster} has poor aim.\n"
      return hit_points
    end
  else
    return dead()
    exit (8)
  end
end

def defend_monster(hit_points,chance,monster)
  if hit_points > 0
    if rand(chance) <= chance * 3 / 4
      puts "Successfull dodge.\n"
      return hit_points
    else
      hit_points -= 5
      puts "You parry the #{monster}'s thrust... doing 5 dmg.\n"
      return hit_points
    end
  else
    return dead()
    exit (2)
  end
end

def defend_ppl_mon(hit_points,chance,monster)
  if hit_points > 0
    if rand(chance) <= chance * 3 / 4
      puts "Successfull dodge.\n"
      return hit_points
    else
      hit_points -= 5
      puts "The #{monster}'s attack grazes your cheek 5 dmg.\n"
      return hit_points
    end
  else
    return dead()
    exit (10)
  end
end

def start #Main method that starts game, and loads random text.

  filename = ARGV.first
  nouns = open(filename)
  nouns_list = nouns.read.split("\n")

  conditions = ["foggy", "rainy", "cloudy", "smokey", "dark", "bright", "stinky", "pretty", "dirty", "clean", "messy", "grimey", "mustard", "squishy", "white", "black", "noisy", "very noisy", "quiet", "jaundiced"]
  conditions_len = conditions.length
  room = nouns_list[rand(19)]
  condition = conditions[rand(conditions_len - 1)]

  puts "Mana rains from the heavens and you enter the #{room}Castle."
  puts "It is #{condition} probably.\nWalk (l)eft, (r)ight, or (f)orward?"
  print "#> "

  choice = $stdin.gets.chomp
  choice = choice.downcase
  nouns.close

  if choice == "left" || choice == "l"
    rand_hall
  elsif choice == "forward" || choice == "f"
    rand_hall
  elsif choice == "right" || choice == "r"
    rand_hall
  else
    dead("You die slowly because of you unwillingness to RTFD")
  end
end

def rand_hall #Attempt to add depth to game
    hall_rand = rand(5) + 1
     if hall_rand == 1
        hall_1(100)
     elsif hall_rand == 2
        hall_2(100)
     elsif hall_rand == 3
        hall_3(100)
     elsif hall_rand >= 4
        hall_4(100)
     else
         dead ("How did this kill you.....")
     end
end

def hall_1(chance) # Rand_hall with only choice to go forward
    puts "The hall before you is clear."
    puts "There are no exits or doors visible go (f)orward or die. "

    choice = $stdin.gets.chomp
    chance1 = chance
    chance = rand(chance)

        if choice.downcase == 'f'
            if chance <= chance1 / 2
              meet_monster()
            else
              rand_hall
          end
        else
            dead ("Life apparently isn't for you. H1")
        end
end

def hall_2(chance) # Rand_hall with door on the left
    puts "The hall before you is clear."
    puts "There is a door on your left."
    puts "Go (l)eft or (f)orward"

    chance1 = chance
    choice = $stdin.gets.chomp
    chance = rand(chance)
    chance2 = rand(chance)

        if choice.downcase == 'f'
            if chance <= chance * 1 / 3
              rand_hall
            elsif chance > chance1 * 1 / 3 && chance <= chance1 * 2 / 3
              room_1
            else
              meet_a_knight
            end

        elsif choice.downcase == 'l'
            if chance <= chance1 * 4 / 5
              rand_hall
            elsif chance > chance * 4 / 5
              if chance > chance2
              meet_baby_dragon
              else
              meet_monster()
              end
            else
              room_1
            end
        else
            dead ("Life apparently isn't for you.H2")
        end
end

def hall_3(chance) # Rand_hall with door on the right
    puts "The hall before you is clear."
    puts "There is a door on your right."
    puts "Go (r)ight or (f)orward"


    choice = $stdin.gets.chomp
    chance1 = chance
    chance = rand(chance)
    chance2 = rand(chance)

        if choice.downcase == 'f'
            if chance <= chance1 * 4 / 5
              rand_hall
            elsif chance > chance1 * 4 / 5
              meet_monster
            else
              meet_a_knight
            end

        elsif choice.downcase == 'r'
            if chance <= chance1 * 3 / 4
              rand_hall
            elsif chance > chance1 * 3 / 4
              if chance > chance2
                meet_baby_dragon
              else
                meet_monster
              end
            else
              room_1
            end
        else
            dead ("Life apparently isn't for you.H3")
        end
end

def hall_4(chance) # Rand_hall with door on the left and right
    puts "The hall before you is clear."
    puts "There is a door on your left and right."
    puts "Go (l)eft, (r)ight or (f)orward"
    chance1 = chance
    choice = $stdin.gets.chomp
    chance = rand(chance)
    chance2 = rand(chance)


        if choice.downcase == 'f'
            if chance <= chance1 / 2
              rand_hall
            elsif chance > chance1 /2
              if chance2 > chance
                meet_monster
              else
                room_3
              end
            else
              meet_a_knight
            end

        elsif choice.downcase == 'l'
            if chance <= chance1 / 2
              rand_hall
            elsif chance > chance1 / 2
              if chance2 > chance
                meet_monster
              else
                meet_baby_dragon
              end
            else
              room_1
            end

          elsif choice.downcase == 'r'
              if chance <= chance1 / 2
                rand_hall
              elsif chance > chance1 / 2
                if chance2 > chance
                  meet_monster
                else
                  rand_hall
                end
              else
                room_3
              end
        else
            dead ("Life apparently isn't for you.H4")
        end
end

def dead(why) #Death Method
  puts why, "Unfortunate."
  exit(0)
end

def room_1 # Gold Room with formerly impossible win condition
  puts "This room is full of gold. How much do you take?"

  print "> "
  choice = $stdin.gets.chomp
  how_much = choice.to_i
  # this line has a bug so fix it.

  if how_much < 42
    puts "That's all you are going to take?"
    meet_a_knight
  elsif how_much > 42
     dead("You are a greedy man or woman or thing.")
  elsif how_much == 42
    puts "Life, Unviverse, and everything. You get 2 points"
    meet_a_knight
  else
    dead("Man, learn how to type a number.")
  end
end

def room_3 # Silver Room with miserly win condition
  puts "This room is full of silver. How much do you take?"

  print "> "
  choice = $stdin.gets.chomp
  how_much = choice.to_i
  # this line has a bug so fix it.
  if how_much.is_a?(Integer) == true && how_much < 2
     puts "Estupendo! Mi amigo tu ganador."
     meet_baby_dragon
  elsif how_much >= 2
     dead("You have silver poisoning.")
  else
    dead("Man, learn how to type a number.")
  end
end

def hall_way # Old Hallway method
  puts "This is a hallway."
  puts "It is very long...."
  puts "It is dark probably.\nWalk left, right, or forward?"
  print "> "
  choice = $stdin.gets.chomp

  if choice == "left" || choice == "l"
    start
  elsif choice == "forward" || choice == "f"
    meet_a_knight
  elsif choice == "right" || choice == "r"
    start
  else
    dead("You die slowly because of you unwillingness to RTFD")
  end
end

def meet_a_knight

  puts "You meet another knight, there is a tension in the air."
  print "(B)efriend, (K)ill, or (I)gnore: "
  print "> "
  choice = $stdin.gets.chomp

  if choice.downcase == 'b'
      puts "After consideration the knight agrees to join you.\n\n\n"
      meet_baby_dragon # Change later simply a place holder, meet_baby_dragon
  elsif choice.downcase == 'k'
      dead("Attacking unkown knights in the dark turns out to be a bad choice \nfor continued life")
  elsif choice.downcase == 'i'
      puts "The other knight ignores you as well. Are you married?\nYou continue down the hall forlornly.\n\n\n"
      meet_baby_dragon # Change later simply a place holder, meet_baby_dragon
  else
      dead("Reading is hard you die")
  end
end

def meet_baby_dragon

  puts "You meet a baby DRAGON!! Smoke curls from it's malformed nostrils."
  print "(f)ight, (d)o nothing, or (R)un away: "
  print "> "
  choice = $stdin.gets.chomp

  if choice.downcase == 'f'
      puts "Baby dragon runs away another monster comes \nto it's aid."
      meet_monster
  elsif choice.downcase == 'd'
      chance = rand(100)
      if chance >= 90
        puts "Along comes Momma."
        meet_boss
      else
        puts "Your indecision is rewarded with a monster FIGHT!."
        meet_monster
      end
  elsif choice.downcase == 'r'
      puts "You run away, this actually is the best choice.....\nUntil you hear a strange rumbling in front of you.\n\n\n"
      meet_boss # Change later simply a place holder, meet_boss
  else
    dead("Reading is hard you die")
  end
end

def attack_dragon(hit_points,chance)
  if hit_points > 0
    if rand(chance) >= chance * 2 / 3
      puts "Smote the dragon on the bum. for 25 dmg.\n"
      hit_points -= 25
      return hit_points
    else
      puts "You missed the dragon.\n"
      return hit_points
    end
  else
    return dead()
    exit (1)
  end
end

def defend_dragon(hit_points,chance)
  if hit_points > 0
    if rand(chance) <= chance * 3 / 4
      puts "Successfull dodge.\n"
      return hit_points
    else
      hit_points -= 5
      puts "You parry the dragons thrust... doing 5 dmg.\n"
      return hit_points
    end
  else
    return dead()
    exit (2)
  end
end

def attack_ppl(hit_points,chance)
  if hit_points > 0
    if rand(chance) >= chance * 3 / 4
      puts "Do you smell that? You take 25 dmg.\n"
      hit_points -= 20
      return hit_points
    else
      puts "The dragon misses you completely.\n"
      return hit_points
    end
  else
    return dead()
    exit (1)
  end
end

def defend_ppl(hit_points,chance)
  if hit_points > 0
    if rand(chance) <= chance * 3 / 4
      puts "Successfull dodge.\n"
      return hit_points
    else
      hit_points -= 5
      puts "Your cape is on fire doing 5 dmg.\n"
      return hit_points
    end
  else
    return dead()
    exit (2)
  end
end

def meet_boss # Not yet down may need to break into further parts for ease of understanding
  hp = 100
  d_hp = 100
  (0..5).each {|i| puts "!!_____Dragon_____!!\n\n\n\n\n\a"}
  puts "You finally calm down and get to business.\nDragon HP = #{[d_hp]}"

      while d_hp > 0 && hp > 0

        print "(a)ttack, (d)odge, or (R)un away: "
        print "> "
        choice = $stdin.gets.chomp

          if choice.downcase == 'a'
            d_hp = attack_dragon(d_hp,100)
            hp = attack_ppl(hp,100)
            puts "The Dragon's hp is now : \t\t#{d_hp}\n"
            puts "The Your hp is now : \t\t\t#{hp}\n\n"

          elsif choice.downcase == 'd'
            d_hp = defend_dragon(d_hp,100)
            hp = defend_ppl(hp,100)
            puts "The Dragon's hp is now : \t\t#{d_hp}\n"
            puts "The Your hp is now : \t\t\t#{hp}\n\n"

          elsif choice.downcase == 'r'
              dead("Running from fights again heh, death awaits at the end of your jog.") # Change later simply a place holder, meet_boss

          else
              dead("Reading is hard you die")

          end
        end

        if hp <= 0
          dead("Your hp has reached 0.")
        else
          puts "Dragon defeated. Yay! You!"
        exit(4)
        end
end

# Print window dressing and title for game, Cart before horse since this was second thing coded for this program.
# Window Dressing
t_header = "********************************************************\n"
m_header = "--------------------------------------------------------\n"
puts t_header
puts m_header
puts m_header
puts "\tExercise 36 Ruby The Hard Way Homework Game!"
puts m_header
puts m_header
puts t_header
puts "This game has no winners only losers..."

# Initialize game with main function "start" throwing the global array nouns_list into it.
start
