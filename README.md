# String Calculator Kata

This is a Ruby implementation of the String Calculator Kata using TDD with RSpec.

## Requirements

- Ruby
- Bundler
- Rspec
- SimpleCov
- Rubocop

## Setup

1. Install dependencies:
```bash
bundle install
```

2. Run tests:
```bash
bundle exec rspec
```

## Features

- Add method that handles:
  - Empty string
  - Single number
  - Two numbers separated by comma
  - Multiple numbers
  - Newline separators
  - Custom delimiters
  - Multiple custom delimiters
  - Large numbers (ignores numbers > 1000)
  - Negative number detection
  - Event tracking for Add calls

## Running the Tests

```bash
bundle exec rspec
```
