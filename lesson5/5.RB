munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each_value{ |details|
  total_age += details["age"] if details["gender"] == "male"
}

p "Total age of all men in the Munster's family is #{total_age}"

#set total_age variable
#parse through each hash value using a block
  #within the block: add value of "age" key to total_age IF the value of "gender" key is "male"
