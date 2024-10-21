defmodule CounterWeb.FormLive do
  use CounterWeb, :live_view
  use CounterNative, :live_view

  @impl true
  def render(assigns), do: ~H""

end
