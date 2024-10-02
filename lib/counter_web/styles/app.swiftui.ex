defmodule CounterWeb.Styles.App.SwiftUI do
  use LiveViewNative.Stylesheet, :swiftui

  # Add your styles here
  # Refer to your client's documentation on what the proper syntax
  # is for defining rules within classes
  ~SHEET"""
  "background-" <> color do
    foregroundStyle(Color.{color})
    ignoresSafeArea(.all)
  end

  "counter" do
    font(.system(size: 300, weight: .regular, design: .monospaced))
    foregroundStyle(
      .linearGradient(
        colors: [.purple, .green],
        startPoint: .top,
        endPoint: .bottom
      )
    )
    minimumScaleFactor(0.5)
    lineLimit(1)
    padding(.bottom, 20)
  end

  "button-border" do
    stroke(.gray, lineWidth: 2)
  end

  "button-" <> color do
    font(.system(size: 16, weight: .bold, design: .monospaced))
    frame(width: 50, height: 50)
    foregroundStyle(
      .linearGradient(
        colors: [.white, .{color}],
        startPoint: .top,
        endPoint: .bottom
      )
    )
    overlay(content: :border)
    background(Color.clear)
    clipShape(.circle)
  end
  """

  # If you need to have greater control over how your style rules are created
  # you can use the function defintion style which is more verbose but allows
  # for more fine-grained controled
  #
  # This example shows what is not possible within the more concise ~SHEET
  # use `<Text class="frame:w100:h200" />` allows for a setting
  # of both the `width` and `height` values.

  # def class("frame:" <> dims) do
  #   [width] = Regex.run(~r/w(\d+)/, dims, capture: :all_but_first)
  #   [height] = Regex.run(~r/h(\d+)/, dims, capture: :all_but_first)

  #   ~RULES"""
  #   frame(width: {width}, height: {height})
  #   """
  # end
end
