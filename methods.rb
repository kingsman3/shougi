module Methods

#----文字に色をつける------------------------------------------------
  def magenta_color(string)
    converter = "\e[35m\e[0m"
    converter.insert(5, string)
  end
#-----------------------------------------------------------------

#----文字に色をつける------------------------------------------------
  def red_color(string)
    converter = "\e[31m\e[0m"
    converter.insert(5, string)
  end
#-----------------------------------------------------------------

#----文字に色をつける------------------------------------------------
  def blue_color(string)
    converter = "\e[36m\e[0m"
    converter.insert(5, string)
  end
#-----------------------------------------------------------------

#----文字に色をつける------------------------------------------------
  def yellow_color(string)
    converter = "\e[33m\e[0m"
    converter.insert(5, string)
  end
#-----------------------------------------------------------------


#----文字と背景色を反転させる-----------------------------------------
  def reverse_color(string)
    converter = "\e[7m\e[0m"
    converter.insert(4, string)
  end
#-----------------------------------------------------------------

#----半角数字 → 漢数字の符号へ----------------------------------------
  def convert_num(num)
    num.to_s.match(/\d$/)
    case $~[0].to_i
    when 1; num.to_s.sub(/\d$/, "一")
    when 2; num.to_s.sub(/\d$/, "二")
    when 3; num.to_s.sub(/\d$/, "三")
    when 4; num.to_s.sub(/\d$/, "四")
    when 5; num.to_s.sub(/\d$/, "五")
    when 6; num.to_s.sub(/\d$/, "六")
    when 7; num.to_s.sub(/\d$/, "七")
    when 8; num.to_s.sub(/\d$/, "八")
    when 9; num.to_s.sub(/\d$/, "九")
    end
  end
#-----------------------------------------------------------------

#----先手か後手かスクラムマスターか------------------------------------
  def fir_or_sec
    case @fs
    when 1; @message_fs = "＜ 先手 ＞"
    when 2; @message_fs = "＜ 後手 ＞"
    else  ; @message_fs = "＜ スクラムマスター ＞"
    end
  end
#------------------------------------------------------------------

#---将棋の盤の表示---------------------------------------------------
  def display_ban

    y_1 = ""
    y_2 = ""
    y_3 = ""
    y_4 = ""
    y_5 = ""
    y_6 = ""
    y_7 = ""
    y_8 = ""
    y_9 = ""

    @yl = "\e[33m|\e[0m"

    [91,81,71,61,51,41,31,21,11].each { |n| y_1 << @yl + @b[n] }
    [92,82,72,62,52,42,32,22,12].each { |n| y_2 << @yl + @b[n] }
    [93,83,73,63,53,43,33,23,13].each { |n| y_3 << @yl + @b[n] }
    [94,84,74,64,54,44,34,24,14].each { |n| y_4 << @yl + @b[n] }
    [95,85,75,65,55,45,35,25,15].each { |n| y_5 << @yl + @b[n] }
    [96,86,76,66,56,46,36,26,16].each { |n| y_6 << @yl + @b[n] }
    [97,87,77,67,57,47,37,27,17].each { |n| y_7 << @yl + @b[n] }
    [98,88,78,68,58,48,38,28,18].each { |n| y_8 << @yl + @b[n] }
    [99,89,79,69,59,49,39,29,19].each { |n| y_9 << @yl + @b[n] }

    shougi_ban = <<-DISPLAY
        9   8   7   6   5   4   3   2   1
      #{@line_1}
      #{y_1}#{@yl} 一
      #{@line_1}
      #{y_2}#{@yl} 二
      #{@line_1}
      #{y_3}#{@yl} 三
      #{@line_1}
      #{y_4}#{@yl} 四
      #{@line_1}
      #{y_5}#{@yl} 五
      #{@line_1}
      #{y_6}#{@yl} 六
      #{@line_1}
      #{y_7}#{@yl} 七
      #{@line_1}
      #{y_8}#{@yl} 八
      #{@line_1}
      #{y_9}#{@yl} 九
      #{@line_1}
    DISPLAY

    puts shougi_ban
    return

  end
=begin
  将棋盤の表示（初期設定の中身は半角スペース３つ分＼s＼s＼s）
    9   8   7   6   5   4   3   2   1
   +---+---+---+---+---+---+---+---+---+
   |91 |81 |71 |61 |51 |41 |31 |21 |11 | 一
   +---+---+---+---+---+---+---+---+---+
   |92 |82 |72 |62 |52 |42 |32 |22 |12 | 二
   +---+---+---+---+---+---+---+---+---+
   |93 |83 |73 |63 |53 |43 |33 |23 |13 | 三
   +---+---+---+---+---+---+---+---+---+
   |94 |84 |74 |64 |54 |44 |34 |24 |14 | 四
   +---+---+---+---+---+---+---+---+---+
   |95 |85 |75 |65 |55 |45 |35 |25 |15 | 五
   +---+---+---+---+---+---+---+---+---+
   |96 |86 |76 |66 |56 |46 |36 |26 |16 | 六
   +---+---+---+---+---+---+---+---+---+
   |97 |87 |77 |67 |57 |47 |37 |27 |17 | 七
   +---+---+---+---+---+---+---+---+---+
   |98 |88 |78 |68 |58 |48 |38 |28 |18 | 八
   +---+---+---+---+---+---+---+---+---+
   |99 |89 |79 |69 |59 |49 |39 |29 |19 | 九
   +---+---+---+---+---+---+---+---+---+
=end
#-----------------------------------------------------------------

#----将棋盤へ駒の描画（ハンデ戦１０のパターンを含む）---------------------
  def standard
    @m = method(:magenta_color)
    # 後手陣のコマ
    [71, 31].each { |n| @b[n] = @m.call("#銀") }
    [61, 41].each { |n| @b[n] = @m.call("#金") }
    [93, 83, 73, 63, 53, 43, 33, 23, 13].each do |n|
      @b[n] = @m.call("#歩")
    end
    # 先手陣のコマ
    [97, 87, 77, 67, 57, 47, 37, 27, 17].each do |n|
      @b[n] = "歩\s"
    end
    [79, 39].each { |n| @b[n] = "銀\s" }
    [69, 49].each { |n| @b[n] = "金\s" }
    return
  end

  def kyousha
    # 後手陣のコマ
    [91, 11].each { |n| @b[n] = @m.call("#香") }
    # 先手陣のコマ
    [99, 19].each { |n| @b[n] = "香\s" }
    return
  end

  def keima
    # 後手陣のコマ
    [81, 21].each { |n| @b[n] = @m.call("#桂") }
    # 先手陣のコマ
    [89, 29].each { |n| @b[n] = "桂\s" }
    return
  end

  def handicap_6_1
    standard
    # 後手陣のコマ
    [91, 11].each { |n| @b[n] = @m.call("#香") }
    [81, 21].each { |n| @b[n] = @m.call("#桂") }
    @b[51] = @m.call("#玉")
    @b[22] = @m.call("#角")
    @b[82] = @m.call("#飛")
    # 先手陣のコマ
    @b[59] = "王\s"
    game
  end

  def handicap_6_2
    standard
    # 後手陣のコマ
    @b[51] = @m.call("#王")
    # 先手陣のコマ
    @b[88] = "角\s"
    @b[28] = "飛\s"
    [99, 19].each { |n| @b[n] = "香\s" }
    [89, 29].each { |n| @b[n] = "桂\s" }
    @b[59] = "玉\s"
    game
  end

  def handicap_4_1
    standard
    keima
    # 後手陣のコマ
    [91, 11].each { |n| @b[n] = @m.call("#香") }
    @b[51] = @m.call("#玉")
    @b[22] = @m.call("#角")
    @b[82] = @m.call("#飛")
    # 先手陣のコマ
    @b[59] = "王\s"
    game
  end

  def handicap_4_2
    standard
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#王")
    # 先手陣のコマ
    @b[88] = "角\s"
    @b[28] = "飛\s"
    @b[59] = "玉\s"
    [99, 19].each { |n| @b[n] = "香\s" }
    game
  end

  def handicap_2_1
    standard
    kyousha
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#玉")
    @b[22] = @m.call("#角")
    @b[82] = @m.call("#飛")
    # 先手陣のコマ
    @b[59] = "王\s"
    game
  end

  def handicap_2_2
    standard
    kyousha
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#王")
    # 先手陣のコマ
    @b[88] = "角\s"
    @b[28] = "飛\s"
    @b[59] = "玉\s"
    game
  end

  def handicap_1_1f
    standard
    kyousha
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#玉")
    @b[22] = @m.call("#角")
    @b[82] = @m.call("#飛")
    # 先手陣のコマ
    @b[88] = "角\s"
    @b[59] = "王\s"
    game
  end

  def handicap_1_2f
    standard
    kyousha
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#王")
    @b[22] = @m.call("#角")
    # 先手陣のコマ
    @b[88] = "角\s"
    @b[28] = "飛\s"
    @b[59] = "玉\s"
    game
  end

  def handicap_1_1h
    standard
    kyousha
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#玉")
    @b[22] = @m.call("#角")
    @b[82] = @m.call("#飛")
    # 先手陣のコマ
    @b[28] = "飛\s"
    @b[59] = "王\s"
    game
  end

  def handicap_1_2h
    standard
    kyousha
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#王")
    @b[22] = @m.call("#角")
    # 先手陣のコマ
    @b[88] = "角\s"
    @b[28] = "飛\s"
    @b[59] = "玉\s"
    game
  end

  def hirate
    standard
    kyousha
    keima
    # 後手陣のコマ
    @b[51] = @m.call("#王")
    @b[22] = @m.call("#角")
    @b[82] = @m.call("#飛")
    # 先手陣のコマ
    @b[88] = "角\s"
    @b[28] = "飛\s"
    @b[59] = "玉\s"
    game
  end
#-----------------------------------------------------------------

#----常時表示させておくメッセージ--------------------------------------
  def regular_message
    m = method(:fir_or_sec)
    puts
    puts @space_3 * 2 + m.call + "\s" + @message_r_1
    unless @motigoma_1.empty? && @motigoma_2.empty?
      puts @space_3 * 2 + "先手持駒\s#{@motigoma_1}"
      puts @space_3 * 2 + "後手持駒\s#{@motigoma_2}"
    end
  end
#-----------------------------------------------------------------

#----Timer表示-----------------------------------------------------
  def display_time
      [*(11..30)].reverse.each do |t|
        sleep(1)
        print @space_3 * 2 + @message_r_2 + "#{t}\r"
      end
      [*(0..9),"十秒前！！"].reverse.each do |t|
        sleep(1)
        print @space_3 * 3 + "#{t}\r"
      end
  end
#-----------------------------------------------------------------

#----Timer（持ち時間）早打ち将棋--------------------------------------
  def timer
    @t = Thread.new do
    time_start = Time.new
    limit      = time_start + 30
    display_time
    loop do
      progress = Time.new
      next unless limit < progress
      puts "\n\n"
      puts @space_3 * 4 + "＜＜ タイムアウト！！ ＞＞"
      puts
      break
    end
    end
  end
#-----------------------------------------------------------------

#----持駒を獲得（持駒変数へ駒を格納）-----------------------------------
  def get_partner
    k = ""
    case @b[@after_p]
    when /と/; k = "歩"
    when /よ/; k = "香"
    when /け/; k = "桂"
    when /ぎ/; k = "銀"
    when /馬/; k = "角"
    when /龍/; k = "飛"
    else
      k = @b[@after_p].gsub(/[^\p{Han}\p{Hiragana}]/, "").strip
    end
    case @fs
    when 1
      @motigoma_1 << k
    when 2
      @motigoma_2 << k
    else
    end
  end
#-----------------------------------------------------------------

#----持駒を使用する際の表示-------------------------------------------
  def outsider
    case @fs
    when 1; show_motigoma(@motigoma_1)
    when 2; show_motigoma(@motigoma_2)
    end
  end

  def show_motigoma(motigoma)
    @motigoma_list = []
    m = method(:yellow_color)
    i = 0
    motigoma.each.with_index(1) do |k, i|
      @motigoma_list << "#{i}：#{k}"
    end
    puts @space_3 + m.call(@box_line)
    while @motigoma_list[i] do
      puts @space_3 * 2 + @motigoma_list[i..(i + 4)].join("\s")
      i += 4
    end
    puts @space_3 * 12 + @message_g_4
    puts @space_3 + m.call(@box_line)
    puts @space_3 * 2 + @message_g_5
    choice_motigoma
  end
#-----------------------------------------------------------------

#----持駒を選択する-------------------------------------------------
  def choice_motigoma
    choice = gets.to_i
    max    = @motigoma_list.length
    r      = method(:red_color)
    y      = method(:yellow_color)
    if choice == 0
      phase_2
    elsif choice < 1 || max < choice
      if max == 1
        puts r.call("＊１を入力して下さい＊")
      else
        puts r.call("＊1~#{max}までの数値を入力して下さい＊")
      end
      choice_motigoma
    else
    end
    @manage_outsider = choice - 1
    print @space_3 * 2
    print y.call(@motigoma_list[@manage_outsider].gsub(/.：/, ""))
    deploy_player
  end
#-----------------------------------------------------------------

#----持駒を配備する-------------------------------------------------
  def deploy_player
    r = method(:red_color)
    puts @space_3 * 2 + @message_g_6
    @after_p = gets.to_i
    finish
    if @after_p < 11 || 99 < @after_p
      puts @space_3 * 2 + r.call(@error_1)
      deploy_player
    elsif @after_p.to_s.include?("0") #20,30,40,50,60,70,80を除く
      puts @space_3 * 2 + r.call(@error_1)
      deploy_player
    else
    end
    #validate　歩、香車、桂馬は盤上の端っこには置けない制限
    entry_player
  end
#-----------------------------------------------------------------

#----持駒を使用した際の画面への描画------------------------------------
  def entry_player
    r = method(:red_color)
    c = method(:convert_motigoma)
    if @b[@after_p] == "\s\s\s"
      @b[@after_p] = c.call(@motigoma_list[@manage_outsider])
    else
      puts @space_3 * 2 + r.call(@error_4)
      deploy_player
    end
    case @fs
    when 1; @motigoma_1.delete_at(@manage_outsider)
    when 2; @motigoma_2.delete_at(@manage_outsider)
    end
    @motigoma_list.clear
    @manage_outsider = "CEO"
    record
    game
  end
#-----------------------------------------------------------------

#----持駒を盤上へ描画する際の表示の変換--------------------------------
  def convert_motigoma(motigoma)
    motigoma = motigoma.gsub(/.：/, "")
    case @fs
    when 1
      motigoma << "\s"
    when 2
      go_over = "\e[35m#\e[0m"
      go_over.insert(6, motigoma)
    end
  end
#-----------------------------------------------------------------

#----成駒になるゾーン（奧三列）に入った時に成ることができる駒かどうか--------
  def zone_reverse
    case @b[@after_p]
    when /歩/,/香/,/桂/,/銀/,/角/,/飛/
      turn_window
    end
  end
#-----------------------------------------------------------------

#----駒を成りますか？の表示-------------------------------------------
  def turn_window
    b = method(:blue_color)
    #validate 歩、香車、桂馬の場合、強制的に成る場合は選択肢を無視
    puts @space_3 + (@box_line)
    puts @space_3 * 3 + b.call(@message_g_7)
    puts @space_3 + (@box_line)
    case gets.to_i
    when 1; return
    else  ; turn_army
    end
  end
#-----------------------------------------------------------------

#----駒を成る工程---------------------------------------------------
  def turn_army
    r = method(:reverse_color)
    @immature = @b[@after_p].gsub(/[^\p{Han}\p{Hiragana}]/, "").strip
    case @b[@after_p]
    when /歩/; @b[@after_p] = r.call(@b[@after_p].gsub(/歩/, "と"))
    when /香/; @b[@after_p] = r.call(@b[@after_p].gsub(/香/, "よ"))
    when /桂/; @b[@after_p] = r.call(@b[@after_p].gsub(/桂/, "け"))
    when /銀/; @b[@after_p] = r.call(@b[@after_p].gsub(/銀/, "ぎ"))
    when /角/; @b[@after_p] = r.call(@b[@after_p].gsub(/角/, "馬"))
    when /飛/; @b[@after_p] = r.call(@b[@after_p].gsub(/飛/, "龍"))
    end
  end
#-----------------------------------------------------------------

#----棋譜を刻む-----------------------------------------------------
  def record
    koma    = @b[@after_p].gsub(/[^\p{Han}\p{Hiragana}]/, "")
    after_p = Marshal.load(Marshal.dump(@after_p))
    convert = method(:convert_num)
    m       = method(:magenta_color)
    covered = ""
    num     = ""
    case @fs
    when 1
      num  = convert.call(after_p)
      if @records.size != 0
        covered = "同\s" if @records.last.include?(num)
      end
      #4：▽ 3四 （同）歩
      @records << "▲\s" + num + "\s" + covered + koma
    when 2
      num  = convert.call(110 - after_p)
      covered = "同\s" if @records.last.include?(num)
      @records << m.call("▽\s" + num + "\s" + covered + koma)
    end
    reverse_motigoma if @immature != "new coder"
    endless_moves
    game
  end
#-----------------------------------------------------------------

#----駒がなった時のレコードの記載--------------------------------------
  def reverse_motigoma
    m = method(:magenta_color)
    @records.last.gsub!(/\p{Hiragana}/, "")
    case @fs
    when 1; @records.last << @immature + "\s成"
    when 2; @records.last << m.call(@immature + "\s成")
    end
    @immature = "new coder"
  end
#-----------------------------------------------------------------

#----棋譜を表示-----------------------------------------------------
  def show_records
    puts @space_3 + @box_line
    @records.each.with_index(1) do |r, i|
      puts @space_3 * 2 + i.to_s + "：" + r
    end
    puts @space_3 + @box_line
    exit
  end
#-----------------------------------------------------------------

#----千日手による引き分け---------------------------------------------
  def endless_moves
    #とりあえず同一局面２回までをピックアップ
    if @records[-1] == @records[-5] &&
       @records[-3] == @records[-7] &&
       @records[-2] == @records[-6] &&
       @records[-4] == @records[-8]
      puts @space_3 + @message_g_8
      tied_game
    end
  end
#------------------------------------------------------------------

#----王手----------------------------------------------------------
  def oute
    puts @space_3 * 2 + @box_line
    puts @space_3 * 6 + @message_g_11
    puts @space_3 * 2 + @box_line
  end
#-----------------------------------------------------------------

#----終了コマンド---------------------------------------------------
  def finish
    if @before_p == 1 || @after_p == 1
      alert_window("本当に投了しますか？")
    elsif @before_p == 2 || @after_p == 2
      alert_window("本当に終了しますか？")
    else
    end
  end
#-----------------------------------------------------------------


end
