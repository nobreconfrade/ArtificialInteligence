@list = []
hey = 0.0
File.open('testes2.txt','r') do |f|
  f.each_line do |c|
    aux = c.split(' ')
    hey = (aux[1].to_i + aux[7].to_i + aux[13].to_i) / 3
    @list << hey
    hey = Math.sqrt(((aux[1].to_i - hey)**2+(aux[7].to_i - hey)**2+(aux[7].to_i - hey)**2)/3)
    @list << hey
    hey = (aux[3].to_i + aux[9].to_i + aux[15].to_i) / 3
    @list << hey
    hey = Math.sqrt(((aux[3].to_i - hey)**2+(aux[9].to_i - hey)**2+(aux[15].to_i - hey)**2)/3)
    @list << hey
    hey = (aux[5].to_i + aux[11].to_i + aux[17].to_i) / 3
    @list << hey
    hey = Math.sqrt(((aux[5].to_i - hey)**2+(aux[11].to_i - hey)**2+(aux[17].to_i - hey)**2)/3)
    @list << hey
  end
end
count = 0
File.open('testes3.txt','w') do |c|
  @list.each do |l|
    if count % 6 == 0
      c.puts
    end
    c.print "#{l} "
    count += 1
  end
end
