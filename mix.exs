defmodule FlipsideDatabridgeAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :flipside_databridge_api,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Data Bridge Elixir library",
      package: [
        licenses: ["Apache 2.0"],
        links: "http://test",
        maintainers: "FSC Engineering"
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:tesla, "~> 0.8"},
      {:poison, ">= 1.0.0"}
    ]
  end
end
