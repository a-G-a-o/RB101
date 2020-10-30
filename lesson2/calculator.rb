LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# ________METHODS________ #
def clear_screen
  Kernel.system('clear')
end

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def operation_to_message(op)
  word =  case op
          when '1'
            prompt('add')
          when '2'
            prompt('subtract')
          when '3'
            prompt('multiply')
          when '4'
            prompt('divide')
          end

  word
end

def number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

def zero_division_error(number1, number2, operator)
  (number1 != '0') && (number2 == '0') && (operator == '4')
end
# ________END OF METHODS________ #

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

puts format(messages('greeting_name'), name: name)

loop do # main loop
  num1 = ''
  loop do
    prompt('first_number')
    num1 = Kernel.gets().chomp()

    if number?(num1)
      break
    else
      prompt('valid_number')
    end
  end

  num2 = ''
  loop do
    prompt('second_number')
    num2 = Kernel.gets().chomp()

    if number?(num2)
      break
    else
      prompt('valid_number')
    end
  end

  prompt('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w( 1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end
  
  operation_to_message(operator)
  
  result = case operator
           when '1'
             num1.to_i() + num2.to_i()
           when '2'
             num1.to_i() - num2.to_i()
           when '3'
             num1.to_i() * num2.to_i()
           when '4'
             if zero_division_error(num1, num2, operator)
               prompt('zero_division_message')
             else
               num1.to_f() / num2.to_f()
             end
           end

  puts format(messages('result'), result: result) unless zero_division_error(num1, num2, operator)
  
  answer = ''
  loop do
    prompt('again')
    
    answer = Kernel.gets().chomp().downcase()
    
    if answer == "n" || answer == "y"
      break
    else
      prompt('valid_answer')
    end
  end
  
  break unless answer == 'y'
  clear_screen()
end

prompt('goodbye')