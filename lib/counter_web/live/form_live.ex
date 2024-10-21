defmodule CounterWeb.FormLive do
  use CounterWeb, :live_view
  use CounterNative, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{username: nil, email: nil})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <form phx-submit="save">
      <label for="username">Username</label>
      <input id="username" type="text" name="username" />

      <label for="email">Email</label>
      <input id="email" type="email" name="email"/>
      <button type="submit" >Save</button>
    </form>
    Username: <%= @username %>
    Email: <%= @email %>
    """
  end

  @impl true
  def handle_event("save", %{"username" => username, "email" => email}, socket) do
    {:noreply, assign(socket, %{username: username, email: email})}
  end

end
