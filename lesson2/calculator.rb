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

def get_name
  name = ''

  loop do
    name = Kernel.gets().chomp()
    name = name.strip().capitalize()

    if name.empty?()
      prompt('valid_name')
    else
      break
    end
  end
  name
end

def get_number(prompt_num)
  num = ''
  loop do
    prompt(prompt_num)
    num = Kernel.gets().chomp()

    if number?(num)
      break
    else
      prompt('valid_number')
    end
  end
  num
end

def get_operator
  prompt('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end
  operator
end

# main calculation method
def calc(num1, num2, op)
  result = compute_result(num1, num2, op)

  operation_to_message(op)

  unless zero_division_error(num1, num2, op)
    puts format(messages('result'), result: result)
  end
end

# extracted case from calc into a separate method, compute_result
def compute_result(num1, num2, op)
  case op
  when '1' then num1.to_i() + num2.to_i()
  when '2' then num1.to_i() - num2.to_i()
  when '3' then num1.to_i() * num2.to_i()
  when '4'
    if zero_division_error(num1, num2, op)
      prompt('zero_division_message')
    else
      num1.to_f() / num2.to_f()
    end
  end
end

# prompts user if they want to do another calculation
def calculate_again
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
  answer
end
# ________END OF METHODS________ #

clear_screen()

prompt('welcome')

name = get_name()

puts format(messages('greeting_name'), name: name)

loop do
  num1 = get_number('first_number')
  num2 = get_number('second_number')
  operator = get_operator()

  calc(num1, num2, operator)

  again = calculate_again()
  break if again == 'n'
  clear_screen()
end

prompt('goodbye')
