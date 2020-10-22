LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def operation_to_message(op)
  word =  case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end

  word
end

def number?(number)
  integer?(number) || float?(number)
end

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

Kernel.puts("Hi #{name}!")

loop do # main loop
  num1 = ''
  loop do
    prompt('first_number')
    num1 = Kernel.gets().chomp()

    if integer?(num1)
      break
    else
      prompt('valid_number')
    end
  end

  num2 = ''
  loop do
    prompt('second_number')
    num2 = Kernel.gets().chomp()

    if integer?(num2)
      break
    else
      prompt('valid_number')
    end
  end

  operator_prompt = <<-MSG
  => What operator would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  Kernel.puts(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w( 1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end

  Kernel.puts("=> #{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             num1.to_i() + num2.to_i()
           when '2'
             num1.to_i() - num2.to_i()
           when '3'
             num1.to_i() * num2.to_i()
           when '4'
             num1.to_f() / num2.to_f()
           end

  Kernel.puts("=> The result is #{result}")

  prompt('again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('goodbye')