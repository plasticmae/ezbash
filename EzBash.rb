#Define methods
def installdeb(package)
  Kernel.system "sudo apt-get install #{package}"
  %x[sudo apt-get install #{package}]
  `sudo apt-get install #{package}`
  puts '\r'
  puts 'I ran: "sudo apt-get install #{package}"'
end
def installrpm(package)
  Kernel.system "sudo yum install #{package}"
  %x[sudo yum install #{package}]
  `sudo yum install #{package}`
  puts '\r'
  puts 'I ran: "sudo yum install #{package}"'
end
def installpac(package)
  Kernel.system "sudo pacman -S #{package}"
  %x[sudo pacman -S #{package}]
  `sudo pacman -S #{package}`
  puts '\r'
  puts 'I ran: "sudo pacman -S #{package}"'
  puts 'Shouldn\'t you know how to use pacman if you\'re using Arch? Just kidding.'
end

def uninstalldeb(package)
  Kernel.system "sudo apt-get remove #{package}"
  %x[sudo apt-get remove #{package}]
  `sudo apt-get remove #{package}`
  puts '\r'
  puts 'I ran: "sudo apt-get remove #{package}"'
end
def uninstallrpm(package)
  Kernel.system "sudo yum uninstall #{package}"
  %x[sudo yum uninstall #{package}]
  `sudo yum uninstall #{package}`
  puts '\r'
  puts 'I ran: "sudo yum uninstall #{package}"'
end
def uninstallpac(package)
  Kernel.system "sudo pacman -R #{package}"
  %x[sudo pacman -R #{package}]
  `sudo pacman -R #{package}`
  puts '\r'
  puts 'I ran: "sudo pacman -R #{package}"'
  puts 'Shouldn\'t you know how to use pacman if you\'re using Arch? Just kidding.'
end

def searchdeb(package)
  Kernel.system "sudo apt-cache search #{package}"
  %x[sudo apt-cache search #{package}]
  `sudo apt-cache search #{package}`
  puts '\r'
  puts 'I ran: "sudo apt-cache search #{package}"'
end
def searchrpm(package)
  Kernel.system "sudo yum search #{package}"
  %x[sudo yum search #{package}]
  `sudo yum search #{package}`
  puts '\r'
  puts 'I ran: "sudo yum search #{package}"'
end
def searchpac(package)
  Kernel.system "pacman -Ss #{package}"
  %x[pacman -Ss #{package}]
  `pacman -Ss #{package}`
  puts '\r'
  puts 'I ran: "pacman -Ss #{package}"'
  puts 'Shouldn\'t you know how to use pacman if you\'re using Arch? Just kidding.'
end

#Start Program
puts "Please enter your Operating system or Linux distro (e.g. MacOS, Ubuntu, Linux Mint, Debian, etc.) >> "
os = gets.chomp
os.downcase!
puts ' '
exitis = 0
while exitis == 0 do
  print "To begin, type help to list possible commands, type a command or, type exit. >> "
  userCommand = gets.chomp
  userCommand.downcase!

  case userCommand
  #Package management
  when 'install'
    print 'Please enter the package you\'d like to install. >> '
    package = gets.chomp
    package.downcase!
    case os
    when 'ubuntu'
      installdeb(package)
    when 'debian'
      installdeb(package)
    when 'linux mint'
      installdeb(package)
    when 'redhat'
       installrpm(package)
    when 'fedora'
       installrpm(package)
    when 'open suse'
        installrpm(package)
    when 'arch'
       installpac(package)
    else
       print '\r'
       puts 'Sorry, I didn\'t recognize you\'re operating system.'
    end
  when 'uninstall'
    print 'Please enter the name of the package you\'d like to remove. >> '
    package = gets.chomp
    package.downcase
    case os
    when 'ubuntu'
      uninstalldeb(package)
    when 'debian'
      uninstalldeb(package)
    when 'linux mint'
      uninstalldeb(package)
    when 'redhat'
       uninstallrpm(package)
    when 'fedora'
       uninstallrpm(package)
    when 'open suse'
        uninstallrpm(package)
    when 'arch'
       uninstallpac(package)
    else
       print '\r'
       puts 'Sorry, I didn\'t recognize you\'re operating system.'
     end
   when 'search'
     print 'Please enter the package you\'d like to remove. >> '
     package = gets.chomp
     package.downcase!
     case os
     when 'ubuntu'
       searchdeb(package)
     when 'debian'
       searchdeb(package)
     when 'linux mint'
       searchdeb(package)
     when 'redhat'
        searchrpm(package)
     when 'fedora'
        searchrpm(package)
     when 'open suse'
         searchrpm(package)
     when 'arch'
        searchpac(package)
     else
        print '\r'
        puts 'Sorry, I didn\'t recognize you\'re operating system.'
      end

  #File/folder manipulation
  when 'copy'
    print 'Please enter the path to the file (e.g. Downloads/report.doc) >> '
    cpfile = gets.chomp
    puts ' '
    print 'Please enter the destination inclduding the name of the file (e.g. Documents/report.doc) >> '
    cpdest = gets.chomp
    cpdest.downcase!
    Kernel.system "cp #{cpfile} #{cpdest}"
    %x[cp #{cpfile} #{cpdest}]
    `cp #{cpfile} #{cpdest}`
    puts '\r'
    puts 'I ran: "cp #{cpfile} #{cpdest}"'
  when 'rename'
    print 'Please enter the path to the file (e.g. Documents/report.doc). >> '
    cpfile = gets.chomp
    puts ' '
    print 'Please enter the new name inclduding the destination you used earlier (e.g. Documents/Essay.doc). >> '
    cpdest = gets.chomp
    cpdest.downcase!
    Kernel.system "cp #{cpfile} #{cpdest}"
    %x[cp #{cpfile} #{cpdest}]
    `cp #{cpfile} #{cpdest}`
    puts '\r'
    puts 'I ran: "cp #{cpfile} #{cpdest}"'
  when 'delete file'
    print 'Please enter the name of the file you\'d like to remove along with its directory (e.g. Documents/sensitive.doc). >> '
    file = gets.chomp
    Kernel.system "rm #{file}"
    %x[rm #{file}]
    `rm #{file}`
    puts '\r'
    puts 'I ran: "rm #{file}"'
  when 'delete folder'
    print 'Please enter the name of the folder you\'d like to remove along with its directory (e.g. Garbage/, Documents/Garbage/). >> '
    folder = gets.chomp
    Kernel.system "rm -R -i #{folder}"
    %x[rm -R -i #{folder}]
    `rm -R -i #{folder}`
    puts '\r'
    puts 'I ran: "rm -R -i #{folder}"'
  when 'create file'
    print 'Please name your new file along with its directory (e.g. Documents/newfile.doc). >> '
    file = gets.chomp
    Kernel.system "touch #{file}"
    %x[touch #{file}]
    `touch #{file}`
    puts '\r'
    puts 'I ran: "touch #{file}"'
  when 'edit file'
    print 'Please enter the name and location of the file you\'d like to edit (e.g. Documents/report.doc). >> '
    file = gets.chomp
    Kernel.system "nano #{file}"
    %x[nano #{file}]
    `nano #{file}`
    puts '\r'
    puts 'I ran: "nano #{file}"'
  when 'help'
    puts "\t install: install new programs or 'packages' on your system"
    puts "\t uninstall: remove programs or 'packages' from your system"
    puts "\t search: search for a program that can be installed with the aforementioned 'install' command"
    puts "\t copy: copies a file or folder to another place"
    puts "\t rename: renames a file on your computer"
    puts "\t delete file: deletes a file on your compter"
    puts "\t delete folder: deletes a folder on your computer (type yes at every promt)."
    puts "\t create file: creates an empty text file on your computer (.rb, .py, .java, etc. count as text files)"
    puts "\t edit file: edits a text file in a bare-bones, quick editor (.rb, .html, .java, etc. count as text files)"
    puts "\r"
  when 'exit'
    abort
  else
    puts 'Sorry, I didn\'t catch that.'
  end
end
