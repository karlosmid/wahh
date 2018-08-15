defmodule Chapter02 do
  def sanitize input do
    _sanitize input, false
  end
  defp _sanitize(input, done) when done == false do
    start = input
    |> String.length
    result =
    input
    |> String.replace("<script>","")
    |> String.slice(0..49)
    |> String.replace("\"","")
    |> URI.decode
    endd = result
    |> String.length
    _sanitize(result, start == endd)
  end
  defp _sanitize(input, done) when done == true do
    input
  end
end
