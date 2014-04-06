version           "1.0"
recipe            "pyrocms", "Configuration of the website"

%w{ ubuntu debian }.each do |os|
  supports os
end
