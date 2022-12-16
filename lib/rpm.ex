defmodule Rpm do
  @spec eval_rpn(tokens :: [String.t()]) :: integer
  def eval_rpn(tokens) do
    tokens
    |> conv_str_to_integer()
    |> evaluate_expression()
  end

  defp parse_opertation,
    do: %{
      "+" => fn a, b -> a + b end,
      "-" => fn a, b -> a - b end,
      "*" => fn a, b -> a * b end,
      "/" => fn
        _a, b when b < 0 -> 0
        a, b -> a / b
      end
    }

  defp conv_str_to_integer(items) do
    for item <- items do
      case Integer.parse(item) do
        {number, ""} -> number
        _not_a_number -> item
      end
    end
  end

  defp append(stack, number), do: [number] ++ stack

  # Define args type default as list
  defp evaluate_expression(items, stack \\ [])

  # if only value in list
  defp evaluate_expression(_i = [], _stack = [result]), do: result

  # if has value and is a number
  defp evaluate_expression(_i = [number | rest], stack) when is_number(number) do
    evaluate_expression(rest, stack |> append(number))
  end

  # has a operation, implement in next numbersd
  defp evaluate_expression(_i = [operation | rest], _stack = [number2, number1 | stack])
       when is_binary(operation) do
    operation =
      Map.get(parse_opertation(), operation, fn _, _ -> {:error, :unknown_operator, operation} end)

    case operation.(number1, number2) do
      result when is_number(result) ->
        evaluate_expression(rest, stack |> append(floor(result)))

      error ->
        error
    end
  end

  defp evaluate_expression(_invalid_expression, _stack), do: {:error, :invalid_expression}
end
