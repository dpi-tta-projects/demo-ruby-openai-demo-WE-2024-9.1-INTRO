# Write your solution here!
require "openai"
require "dotenv/load"

puts "Assistant: Hello! How can I help you today?"
puts "-" * 50

user_input = ""

client = OpenAI::Client.new(
  access_token: ENV.fetch("OPENAI_API_KEY"),
  log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
)

message_list = [
  { 
    role: "system", 
    content: "You are a helpful but rude assistant."
  }
]

while user_input != "bye" do
  print "You: "
  user_input = gets.chomp

  message = { 
    role: "user", 
    content: user_input
  }

  message_list.push(message)

  response = client.chat(
    parameters: {
      model: "gpt-4o", # Required.
      messages: message_list, # Required.
    }
  )
  puts "Assistant: #{response.dig("choices", 0, "message", "content")}"
  puts "-" * 50

  assistant_message = { 
    role: "assistant", 
    content: response.dig("choices", 0, "message", "content")
  }

  message_list.push(assistant_message)

end

puts "Assistant: Goodbye!"
