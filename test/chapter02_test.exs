defmodule Chapter02Test do
  use ExUnit.Case, async: true

  test "question 5" do
    input = "\"><script>alert(\"foo\")</script>"
    assert  ">alert(foo)</script>" == Chapter02.sanitize(input)
  end
  test "uri encode" do
    input = "\"><script>alert(\"foo\")</script>"
    assert "\"><script>alert(\"foo\")</script>" == Chapter02.sanitize(input |> URI.encode)
  end
  test "input that baypasses security check" do
    input = "%22%3E%3Cscript%3Ealert(%22foo%22)%3C/script%3E"
    assert input ==  ("\"><script>alert(\"foo\")</script>" |> URI.encode)
  end
  test "question string length" do
    input = "\"><script>alert(\"foo\")</script>"
    assert (input |> String.length) == 31
  end
end
