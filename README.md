# Rpm

Simple implementation of Reverse Polish Notation using immutability as a concept

## Concepts

Using pattern matching and list notation, you must separate the numbers from the operators and add numbers to a stack,

When an operator is found, the stack undergoes the operation recursively, and the result is added to the head of the stack, thus always leaving the result, the stack, the next operation and the other tokens

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `rpm` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rpm, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/rpm>.
