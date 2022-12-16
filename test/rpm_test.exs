defmodule RpmTest do
  use ExUnit.Case
  doctest Rpm

  test "['2','1','+','3','*'] should be 9" do
    assert Rpm.eval_rpn(["2", "1", "+", "3", "*"]) == 9
  end

  test "['4','13','5','/','+'] should be 6" do
    assert Rpm.eval_rpn(["4", "13", "5", "/", "+"]) == 6
  end

  test """
  ["10","6","9","3","+","-11","*","/","*","17","+","5","+"] should be 22
  """ do
    assert Rpm.eval_rpn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]) ==
             22
  end
end
