# Words API gem
[![Gem Version](https://badge.fury.io/rb/wordsapi.svg)](https://badge.fury.io/rb/wordsapi)
[Official documentation](https://rapidapi.com/wordsapi/api/wordsapi)

## Installation

Add this to your Gemfile:
```ruby
  gem 'wordsapi', '~> 0.1.0'
```
And run the bundle install command.  


## Usage
```ruby
  require 'wordsapi'
  
  @client = WordsAPI.new(access_token: YOUR_ACCESS_TOKEN)
```
```ruby
  @client.similar_to('interesting')
```
Output
```json
{
  "word": "interesting",
  "similarTo": [
    "amusive",
    "diverting",
    "engrossing",
    "entertaining",
    "amusing",
    "fascinating",
    "gripping",
    "intriguing",
    "newsworthy",
    "riveting",
    "absorbing"
  ]
}
```
