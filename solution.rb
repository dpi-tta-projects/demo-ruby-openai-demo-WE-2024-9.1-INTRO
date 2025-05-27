# Write your solution here!
require "openai"
require "dotenv/load"

puts "Assistant: Hello! How can I help you today?"
puts "-" * 50

user_response = ""

while user_response.downcase != "bye"
  print "You: "
  user_response = gets.chomp

  break if user_response.downcase == "bye"

  client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

  message_list = [
    {
     "role" => "system",
      "content" => "You are a helpful but rude assistant."
    },
    {
      "role" => "user",
     "content" => user_response
   }
  ]

  # Call the API to get the next message from GPT
  api_response = client.chat(
    parameters: {
     model: "gpt-3.5-turbo",
      messages: message_list
    }
  )

  array_response = api_response.fetch("choices")
  hash_response = array_response.at(0)
  message = hash_response.fetch("message")
  content = message.fetch("content")

  puts "Assistant: #{content}"
  puts "-" * 50

end

puts "Goodbye!"
