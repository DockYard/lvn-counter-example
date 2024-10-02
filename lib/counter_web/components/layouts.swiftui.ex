defmodule CounterWeb.Layouts.SwiftUI do
  use CounterNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
