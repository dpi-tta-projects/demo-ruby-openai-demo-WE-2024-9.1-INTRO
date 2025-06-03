# Open AI
[Envoy](https://envoy.firstdraft.com/)

```ruby
POST /v1/chat/completions HTTP/1.1
Host: api.openai.com
Authorization: Bearer FIND_THE_OPENAI_API_KEY_IN_COURSE_SECRETS_AND_PUT_IT_HERE
Content-Type: application/json

{
  "model": "gpt-4o",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant who talks like Shakespeare."
    },
    {
      "role": "user",
      "content": "Hello!"
    }
  ]
}
```

[ruby-openai](https://github.com/alexrudall/ruby-openai?tab=readme-ov-file#gem-install)

- Install gem, add "require"
- Store key **OPENAI_API_KEY** in the `.env`

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

[API call](https://github.com/alexrudall/ruby-openai?tab=readme-ov-file#chat)

## TODO:

- Prints "Assistant: Hello! How can I help you today?"
- Prints a line of fifty "-".
- print "You: ".
- Waits for the user to type in a request.
- Sends the request to the Chat Completions endpoint and prints the response.
- Prints a line of fifty "-".
- Enclose the above in a loop such that the user can continue to type requests and get answers until the user types “bye”.
