class ShougiApp
  require './validations'
  require './methods'
  require './variable'
  include Validations
  include Methods
  include Variable

#----初期画面（選択していく画面）---------------------------------------------------
  def start
    puts @space_3 + @box_line
    puts @space_3 + @message_1_1
    puts @space_3 + @message_1_2
    puts @space_3 + @box_line
    case gets.to_i
    when 1; selection
    when 2; exit
    else  ; selection
    end
  end

  def selection
    puts @space_3 + @box_line
    puts @space_3 + @message_2_1
    puts @space_3 + @message_2_2
    puts @space_3 + @message_2_3
    puts @space_3 + @box_line
    case gets.to_i
    when 1; hirate
    when 2; options
    when 3; start
    else  ; hirate
    end
  end

  def options
    puts @space_3 + @box_line
    puts @space_3 + @message_2_2_1
    puts @space_3 + @message_2_2_2
    puts @space_3 + @message_2_2_3
    puts @space_3 + @message_2_2_4
    puts @space_3 + @message_2_2_5
    puts @space_3 + @message_2_2_6
    puts @space_3 + @box_line
    case gets.to_i
    when 1; handicap_1
    when 2; handicap_2
    when 3; handicap_4
    when 4; handicap_6
    when 5; time_battle
    when 6; selection
    else  ; start
    end
  end

  def handicap_1
    puts @space_3 + @box_line
    puts @space_3 + @message_2_2_1_1
    puts @space_3 + @message_2_2_1_2
    puts @space_3 + @message_2_2_1_3
    puts @space_3 + @message_2_2_1_4
    puts @space_3 + @message_2_2_1_5
    puts @space_3 + @box_line
    case gets.to_i
    when 1; handicap_1_1f
    when 2; handicap_1_2f
    when 3; handicap_1_1h
    when 4; handicap_1_2h
    when 5; options
    else  ; start
    end
  end

  def handicap_2
    puts @space_3 + @box_line
    puts @space_3 + @message_2_2_2_1
    puts @space_3 + @message_2_2_2_2
    puts @space_3 + @message_2_2_2_3
    puts @space_3 + @box_line
    case gets.to_i
    when 1; handicap_2_1
    when 2; handicap_2_2
    when 3; options
    else  ; start
    end
  end

  def handicap_4
    puts @space_3 + @box_line
    puts @space_3 + @message_2_2_3_1
    puts @space_3 + @message_2_2_3_2
    puts @space_3 + @message_2_2_3_3
    puts @space_3 + @box_line
    case gets.to_i
    when 1; handicap_4_1
    when 2; handicap_4_2
    when 3; options
    else  ; start
    end
  end

  def handicap_6
    puts @space_3 + @box_line
    puts @space_3 + @message_2_2_4_1
    puts @space_3 + @message_2_2_4_2
    puts @space_3 + @message_2_2_4_3
    puts @space_3 + @box_line
    case gets.to_i
    when 1; handicap_6_1
    when 2; handicap_6_2
    when 3; options
    else  ; start
    end
  end

  def time_battle
    @time_bttle_switch = true
    game
  end

#-------------------------------------------------------------------------------

#----将棋の盤・駒の表示------------------------------------------------------------
  def game
    @count += 1
    @count.even? ? @fs = 1 : @fs = 2
    if @count == 0
      display_ban
    else
      @b = @b.reverse
      display_ban
    end
    phase_1
  end
#-------------------------------------------------------------------------------

#----次のステージ（常時表示させて置くメッセージまたはタイマー）--------------------------
  def phase_1
    regular_message
    timer if @time_battle_switch
    phase_2
  end
#-------------------------------------------------------------------------------

#----ステージ２(入力画面・入力終了時点でスレッドを削除）--------------------------------
  def phase_2
    puts
    puts @space_3 * 2 + @message_g_1
    puts
    @before_p = gets.to_i
    @t.kill if @t
    case @before_p
    when 1; alert_window("本当に投了しますか？")
    when 2; alert_window("本当に終了しますか？")
    else  ; phase_3
    end
  end
#-------------------------------------------------------------------------------

#----ステージ３（入力の妥当性をチェック）---------------------------------------------
  def phase_3
    if @before_p < 11 || 99 < @before_p
      puts @error_1
      @before_p = gets.to_i; phase_3
    elsif @before_p.to_s.include?("0") #20,30,40,50,60,70,80を除く
      puts @error_1
      @before_p = gets.to_i; phase_3
    else
      validate_1
    end
      phase_4
  end
#-------------------------------------------------------------------------------

#----ステージ４（選ばれた駒のチェック）----------------------------------------------
  def phase_4
    check_1
    #validate_2
    case @fs
    when 1; @motigoma_1.empty? ? phase_5 : phase_6
    when 2; @motigoma_2.empty? ? phase_5 : phase_6
    else  ; puts "エラーでーす！"
    end
  end
#-------------------------------------------------------------------------------

#----ステージ５（持駒があれば使用する選択肢を表示）------------------------------------
  def phase_5
    phase_6
  end
#-------------------------------------------------------------------------------

#----ステージ６（駒を配置する場所の入力）---------------------------------------------
  def phase_6
    puts
    puts @space_3 * 2 + @message_g_2
    puts
    @after_p = gets.to_i
    case @after_p
    when 1; alert_window("本当に投了しますか？")
    when 2; alert_window("本当に終了しますか？")
    else  ; phase_7
    end
    game
  end
#-------------------------------------------------------------------------------

#----ステージ６（駒を配置する場所の入力）---------------------------------------------
  def phase_7
  end
#-------------------------------------------------------------------------------

#----投了or終了------------------------------------------------------------------
  def alert_window(message)
    puts @space_3 + @box_line
    puts @space_3 + "|            " + message + "               |"
    puts @space_3 + "|             1 : YES   2: NO                   |"
    puts @space_3 + @box_line
    case gets.to_i
    when 1; exit
    when 2; phase_2
    else  ; exit
    end
  end
#-------------------------------------------------------------------------------



end

game = ShougiApp.new
game.start
