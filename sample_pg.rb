require 'pg'

connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  result = connection.exec("select weight, give_for from crops;")
  result.each do |record|
    puts "ゴーヤの大きさ:#{record["weight"]} 売った相手:#{record["give_for"]}"
  end
  result = connection.exec("select * from crops where not(give_for='自家消費') AND quality=false;")
  result.each do |record|
    puts "譲渡先:#{record["give_for"]} 品質:#{record["quality"]}"
  end
ensure
  connection.finish
end