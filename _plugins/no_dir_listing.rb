# `jekyll serve` hardcodes WEBrick's FancyIndexing, so any folder without an
# index.html shows a file listing. Turn it off so those folders return 403.
# Only affects the local dev server; the built site is unchanged.
require "jekyll/commands/serve"

module NoDirListing
  def file_handler_opts
    super.merge(:FancyIndexing => false)
  end
end

Jekyll::Commands::Serve.singleton_class.prepend(NoDirListing)
