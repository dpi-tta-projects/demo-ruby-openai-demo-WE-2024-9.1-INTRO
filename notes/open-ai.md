# Open AI

[ruby-openai](https://github.com/alexrudall/ruby-openai?tab=readme-ov-file#gem-install)

Install gem, store key in the `.env`

[secrets](https://learn.firstdraft.com/runs/133/learner/secrets)


```ruby
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

# Prepare an Array of previous messages
message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful but rude assistant."
  },
  {
    "role" => "user",
    "content" => "How is the weather?"
  }
]

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

pp api_response
```
## TODO:

- Prints “Hello! How can I help you today?”
- Prints a line of fifty "-".
- Waits for the user to type in a request.
- Sends the request to the Chat Completions endpoint and prints the response.
- Prints a line of fifty "-".
- Enclose the above in a loop such that the user can continue to type requests and get answers until the user types “bye”.
