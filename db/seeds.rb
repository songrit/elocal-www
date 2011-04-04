unless Org.exists?
  puts "create org"
  Org.create! :otype=> "องค์การบริหารส่วนตำบล",
    :otype_abbrev=> "อบต",
    :name=> "บางตะไนย์",
    :address=> "43/8 หมู่ที่ 5",
    :district=> "ปากเกร็ด",
    :province=> "นนทบุรี ",
    :phone=> "0-2501-7321-2",
    :villages=> 5
end
unless User.find_by_login "anonymous"
  puts "create anonymous user"
  User.create! :login=> "anonymous"
end
unless User.find_by_login "admin"
  puts "create admin user"
  User.create! :login=> "admin", 
    :password=> "aa", 
    :email=> "songrit@gmail.com", 
    :title=> "นาย", :fname=> "system", :lname=> "admin", 
    :role=> "M,A,D", 
    :cellphone=> "0837887769"
end
