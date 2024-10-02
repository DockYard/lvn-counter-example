defmodule CounterWeb.HomeLive.SwiftUI do
  use CounterNative, [:render_component, format: :swiftui]

  def counter_button(assigns) do
    ~LVN"""
    <Button class={@class} phx-click="incr-by" phx-value-by={@value}>
      <Circle class="button-border" template="border" />
      <%= if @value < 0 do %>
        <%= @value %>
      <% else %>
        +<%= @value %>
      <% end %>
    </Button>
    """
  end
end
