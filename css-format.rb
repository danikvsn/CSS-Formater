 
class Autoindent
    
    def self.format(l,o)
        tbracket=l.split('{')
        for part in tbracket
            if part != tbracket.last
                part << " {\n\t"
            end
            splitsc(part,o)
            #writefile(part,o)
        end
    end
    
    def self.splitlbracket(l,o)
        lbracket = l.split('}')
        for part in lbracket
            if part != "" and part!=lbracket.last
                part << "\n}\n\n"
            end
            writefile(part,o)
        end
    end
    
    def self.splitsc(l,o)
        sc = l.split(';') 
        for part in sc
            if (!(part.include? " {\n\t") && part!=sc.last)
                part << ";\n\t"
            end
            splitlbracket(part,o)
            #writefile(part,o)
        end
    end
    
    def self.writefile(l,o)
        if o
               o.syswrite(l)
        else
            puts "Unable to open file!"
        end
    end
        
    output = File.new("formatted.css", "w+")
    $stdin.each do |line|
        puts format(line, output)
    end
    puts "Conversion complete"
    
end