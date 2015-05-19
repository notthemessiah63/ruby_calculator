# Instructions (using methods)

# Your task is to write a command line calculator application that has two settings, (b)asic and (a)dvanced.

# First you will need to ask the user for which calculator they want to use
# Then you will need to ask the user for the numbers to operate on.
# Then you need to work out what to do with the numbers, depending on what operation they choose:
# Basic Calculator

# The basic operations should be:

# Functionality for 'subtraction'
# Functionality for 'multiplication'
# Functionality for 'division'
# Functionality for 'addition'
# You will then need to delay sending the user back to the menu so they have a chance to read the menu...
# -------------------
def basic_calc()
  system "clear"
  print "Enter first number"
  first_num = gets.to_f
  puts
  print "Enter operator - '+'  '-'  '/'  or  '*' "
  calc_operator = gets.chomp
  puts
  print "Enter second number - '+'  '-'  '/'  or  '*' "
  last_num = gets.to_f
  puts
  case calc_operator
    when '+'
      basic_answer = first_num + last_num
    when '-'
      basic_answer = first_num - last_num
    when '/'
      basic_answer = first_num / last_num
    when '*'
      basic_answer = first_num * last_num
    else  
  end
  puts "Result: #{basic_answer.round(2)}"
  wait = gets
end
# -------------------
def advanced_calc()
  system "clear"
  puts "Select Advance function you require"
  puts "   1) Power"
  puts "   2) Square root"
  puts "   3) Mortgage calc"
  puts "   4) BMI calc"
  puts "   5) Trip calculator"
  adv_calc = gets.to_i
  puts
  case adv_calc
    when 1
      puts "Enter number"
      first_num = gets.to_f
      puts
      print "to the power of: "
      last_num = gets.to_f
      puts
      advanced_answer = first_num ** last_num
    when 2
      puts "Enter number"
      first_num = gets.to_f
      puts
      advanced_answer = Math.sqrt(first_num).round(2)
    when 3
        puts "Mortgage calculator:-"
        print "Enter interest rate (%) : "
        int_rate = gets.to_f
        print "Enter number of payments : "
        num_payments = gets.to_f
        print "Enter principal amount (£) : "
        amount = gets.to_f
        answer = mortgage_calculator(int_rate,num_payments,amount)
        advanced_answer = "Your monthly payment is £#{answer}"
    when 4
        puts 'BMI function - Choose Units'
        puts "1) metric"
        puts "2) imperial"
        print "Enter Option: "
        bmi_opt = gets.to_f
        advanced_answer = bmi_calculator(bmi_opt)
    when 5
        puts 'Trip calculator'
        print "Distance (miles) : "
        distance = gets.to_f
        print "Speed (mph) : "
        speed = gets.to_f
        print "Fuel price (per gallon) : "
        fuel_price = gets.to_f
        print "Your car economy MPG : "
        car_mpg = gets.to_f
        advanced_answer = trip_calculator(distance,speed,fuel_price,car_mpg)
    else  
  end
  puts "Result: #{advanced_answer}"
  wait=gets
end

def bmi_calculator(units) 
  if units == 2
    w_suff = "lbs : " 
    h_suff = "inches : "
    multipier = 703
  else
    w_suff = "kgs : "
    h_suff = "metres : "
    multipier = 1
  end
  puts "Enter your weight in #{w_suff}"
  weight = gets.to_f
  puts "Enter your height in #{h_suff}"
  height = gets.to_f
  advanced_answer = (weight / (height*height))*multipier
  return advanced_answer.round(2)
end

def trip_calculator(distance,speed,fuel_price,car_mpg)
  time = distance/speed
  if car_mpg > 60
    mpg - (speed - 60) * 2
  else
    mpg = car_mpg
  end
  trip_cost = (distance / mpg*fuel_price)
  if time > 1
    t_suff = "hrs"
  else
    t_suff = "hr"
  end
  answer = "Your journey takes #{time.round(1)} #{t_suff} and costs £#{trip_cost.round(2)}"
  return answer
end

def mortgage_calculator(int_rate,num_payments,amount)
  ip = 1+int_rate
  ipn = ip ** num_payments
  divbit = (int_rate*ipn)/(ipn-1)
  answer = amount * divbit
  return answer.round(2)
end


# ------------- program starts here
done = false
until done
  system "clear"
  puts "Select Option:"
  puts "b) for basic"
  puts "a) for advanced"
  puts "q) to Quit"
  print "Option : "
  calc_type = gets.chomp
  case calc_type
   when 'a'
    print "Option: advanced calculator"
    advanced_calc()
   when 'b'
    puts "Option: basic calculator"
    basic_calc()
   when 'q'
    print "Option: you chose to quit"
    system "clear"
    done = true
   else 
    print "Option not recognised enter 'q' to quit"  
   end 
end
