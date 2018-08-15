defmodule Chapter02Test do
  use ExUnit.Case, async: true

  test "question 5" do
    input = "\"><script>alert(\"foo\")</script>"
    assert  ">alert(foo)</script>" == Chapter02.sanitize(input)
  end
  test "uri encode" do
    input = "\"><script>alert(\"foo\")</script>"
    assert  input == Chapter02.sanitize(input |> URI.encode)
  end
end
