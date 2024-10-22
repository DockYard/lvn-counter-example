defmodule CounterWeb.FormLive do
  use CounterWeb, :live_view
  use CounterNative, :live_view

  @impl true
  def mount(_params, _session, socket) do
    user = %{"username" => "", "email" => ""}

    {:ok, assign(socket, user: atomize_keys(user), form: to_form(user, as: :user))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <form phx-submit="save">
      <label for="username">Username</label>
      <input id="username" type="text" name="user[username]" />

      <label for="email">Email</label>
      <input id="email" type="email" name="user[email]"/>
      <button type="submit" >Save</button>
    </form>
    <p>Username: <%= @user.username %></p>
    <p>Email: <%= @user.email %></p>
    """
  end

  @impl true
  def handle_event("save", %{"user" => user_params}, socket) do
    {:noreply, assign(socket, user: atomize_keys(user_params))}
  end

  defp atomize_keys(params) do
    for {key, val} <- params, into: %{}, do: {String.to_existing_atom(key), val}
  end
end
