# module para globalizar a chamada de massa
module DataLoad
  def buscar_massa
    YAML.load_file(File.dirname(__FILE__) + "/data/#{ENV.fetch('ENVIRONMENT_TYPE', nil)}.yml")
  end
end
