=begin
Select the key-value pairs where the value is 'Fruit'.

Example output:
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

Algorithm:  initialize new hash
            loop through each key/value pair, select all "fruit" values
            append to new hash
            return new hash
=end

#my solution:
def select_fruit(hsh)
  new_produce = {}
  
  hsh.each do |key, value|
    if value == 'Fruit'
      new_produce[key] = value
    end
  end
  new_produce
end

#launch school solution:
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    break if counter == produce_keys.size #empty hash exception
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end
    counter += 1
  end
  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
