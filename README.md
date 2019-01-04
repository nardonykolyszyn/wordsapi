# Words API gem
[![Gem Version](https://badge.fury.io/rb/wordsapi.svg)](https://badge.fury.io/rb/wordsapi)
[Official documentation](https://rapidapi.com/wordsapi/api/wordsapi)

[About Ruby magic comment](https://medium.com/bit-concept/ruby-about-deep-symbolize-keys-and-frozen-string-literal-true-e773725549ad)

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
