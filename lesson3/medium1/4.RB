def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

#rolling_buffer1 is the preferable method for modifying the buffer. 
#yes there is a difference: rolling_buffer2 does not alter the original input_array whereas rolling_buffer1 does alter the buffer variable.