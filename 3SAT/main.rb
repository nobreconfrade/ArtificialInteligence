class Main
  ############VARIABLES############
  @sat = Array.new

  ############METHODS############
  def self.read_file(file_name)
    File.open(file_name,'r') do |f|
      f.each_line do |l|
        @sat.push(l.split(' '))
      end
    end
  end

  ############MAIN############
  file_name = 'uf20-01.cnf'
  # file_name = 'uf100-01.cnf'
  # file_name = 'uf250-01.cnf'
  Main.read_file(file_name)
  
end
