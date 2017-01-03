defmodule Issues.CLI do
  @default_count 4

  @moduledoc """
  Handle the command line parsing and the dispatch to functions
  """

  def run(argv) do
    argv
      |> parse_args
      |> process
  end

  def process(:help) do
    IO.puts """
    usage: issues <user> <project> [ count ]
    """
  end

  def process({user, project, _count}) do
    Issues.GithubIssues.fetch(user, project)
  end
  @doc """
  `argv` can be -h or --help, which returns :help
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                                      aliases:  [h: :help])
    case parse do
      { [ help: true ], _, _ }
        -> :help
      { _, [ user, project, count ], _ }
        -> { user, project, String.to_integer(count) }
      { _, [ user, project ], _ }
        -> { user, project, @default_count }
        _ -> :help
    end
  end
end
