User.create!([
  {password: "3]tk$pv/LRJBJtms", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "admin", admin: 0}
])
Question.create!([
  {name: "ブランカのブログ", image_url: "q1.png", answer: "{sendai:mid0ri_NO_ai2}", description: "<p>以下のURLにアクセスして合言葉を見つけてください</p>\r\n<p>合言葉は「投稿」ページにドラフト記事としておいています。</p>\r\n\r\n<blockquote>http://(host名):8081/</blockquote>\r\n\r\n<p>必要であればこちらのパスワードリストをご使用ください。</p>\r\n\r\n<blockquote>https://drive.google.com/file/d/1B2o9KGgBSGCp--KECY3-VwCq4_yorceg/view?usp=sharing</blockquote>\r\n"},
  {name: "カレーショップダルシム", image_url: "q2.png", answer: "{sendai:curry_ha_nomimono!}", description: "<p>以下のURLにアクセスして、合言葉をゲットしてください。</p>\r\n<p>脆弱性をみつけて攻撃すると「投稿」ページに合言葉が登場します。</p>\r\n\r\n<blockquote>http://(host):8082/</blockquote>\r\n\r\n<p>また、以下のWordPressのアカウントは使用しても問題ありません</p>\r\n<blockquote>\r\nID : dhalsim-guest<br>\r\nPWD : E2YVq4c4Q9f29bYj\r\n</blockquote>"},
  {name: "春麗 Software Inc.", image_url: "q3.png", answer: "{sendai:ekin1sh1Guch1!}", description: "<p>以下のURLにアクセスして、合言葉を取得してください。</p>\r\n<p>合言葉は /tmp/flag.txt に配置されています。</p>\r\n\r\n<blockquote>http://(host):8083</blockquote>\r\n\r\n<p>また、以下のプラグインが使用されており、このあたりが怪しいようです</p>\r\n\r\n<blockquote>https://drive.google.com/file/d/1CWd_lBiydxk3ok4_TEpxZkXAnRol-Rg3/view?usp=sharing</blockquote>"}
])
