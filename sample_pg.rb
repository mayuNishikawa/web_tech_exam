require 'pg'

connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  result = connection.exec("select weight, give_for from crops;")
  result.each do |record|
    puts "ゴーヤの大きさ:#{record["weight"]} 売った相手:#{record["give_for"]}"
  end
  result = connection.exec("select * from crops where give_for!='自家消費';")
  result.each do |record|
    puts "譲渡先:#{record["give_for"]} 大きさ:#{record["length"]} 重さ:#{record["weight"]} 品質:#{record["quality"]} 日付:#{record["date"]}"
  end
  result = connection.exec("select * from crops where quality=false;")
  result.each do |record|
    puts "品質:#{record["quality"]} 大きさ:#{record["length"]} 重さ:#{record["weight"]} 譲渡先:#{record["give_for"]} 日付:#{record["date"]}"
  end
ensure
  connection.finish
end