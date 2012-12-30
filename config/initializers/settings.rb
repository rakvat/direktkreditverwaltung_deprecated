if File.exists? "config/settings.yml"
  hash = YAML.load_file("config/settings.yml")
  SETTINGS = HashWithIndifferentAccess.new(hash)
else
  SETTINGS = {}
end
