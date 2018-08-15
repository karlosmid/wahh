defmodule Chapter02 do
  def sanitize input do
    _sanitize input, false
  end
  defp _sanitize(input, done) when done == false do
    start = input
    |> String.length
    input
    |> String.replace("<script>","")
    |> String.slice(0..49)
    |> String.replace("\"","")
    |> URI.decode
    endd = input
    |> String.length
    sanitize(input, start == endd)
  end
  defp _sanitize(input, done) when done == true do
    input
  end
end
