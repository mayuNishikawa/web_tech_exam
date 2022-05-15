require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya']

  "<html>
    <body>
      <p>ゴーヤの大きさと売った相手の情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}

 cgi = CGI.new
 cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya']

  "<html>
    <body>
      <p>渡先が自家消費ではないものの情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}

cgi = CGI.new
 cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya']

  "<html>
    <body>
      <p>渡先が品質が悪いものの情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}