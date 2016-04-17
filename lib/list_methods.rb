module ListMethods
  PROJECTS_DIR = "#{Dir.home}/.projects"
  PROJECTS_LIST = "#{PROJECTS_DIR}/list.yaml"

  def self.included(mod)
    FileUtils.mkdir(PROJECTS_DIR) unless Dir.exist?(PROJECTS_DIR)
  end

  def load_list
     begin
       YAML.load_file(PROJECTS_LIST)
     rescue Errno::ENOENT
       []
     end
  end

  def find_by(list, key, value)
    filtered_list = list.select do |project|
      project.send(key) == value
    end
    filtered_list.first
  end

  def save_list(list)
    list = list.map.with_index do |project, index|
      project.id = index + 1
      project
    end
    File.write(PROJECTS_LIST, list.to_yaml)
  end
end
