class Options
  def self.parse
    options = {}
    @options = OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"

      opts.on("-c [NAME]", "--create [NAME]", "Create new project") do |v|
        options[:command] = :create
        options[:name] = v
      end
      opts.on("-d ID", "--delete ID", "Delete project") do |v|
        options[:command] = :delete
        options[:id] = v
      end
      opts.on("-f NAME", "--find NAME", "Find project by name") do |v|
        options[:command] = :find
        options[:name] = v
      end
      opts.on("-o [NAME]", "--open [NAME]", "Open project by name or id") do |v|
        options[:command] = :open
        options[:name] = v
      end
      opts.on("--name NAME", "Project name") do |v|
        options[:name] = v
      end
      opts.on("--id ID", "Project id") do |v|
        options[:id] = v
      end
      opts.on("--dir NAME", "Project directory") do |v|
        v = v.gsub(/(~)/, Dir.home)
        options[:dir] = v
      end
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end.parse!
    options
  end
end
