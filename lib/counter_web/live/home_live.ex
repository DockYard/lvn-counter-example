defmodule CounterWeb.HomeLive do
  use CounterWeb, :live_view
  use CounterNative, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-center text-9xl"><%= @counter %></div>
    <div class="flex flex-col items-center"><button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-5 rounded" phx-click="incr">+1</button></div>
    """
  end

  @impl true
  def handle_event("incr", _params, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end

  def handle_event("decr", _unsigned_params, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter - 1)}
  end

  def handle_event("incr-by", %{"by" => value}, socket) do
    {value, _} = Integer.parse(value)
    {:noreply, assign(socket, :counter, socket.assigns.counter + value)}
  end

end
