class ShougiApp
  require './methods'
  require './variable'
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
    when 1; game
    when 2; options
    when 3; start
    else  ; game
    end
  end

  def options
    puts @space_3 + @box_line
    puts @space_3 + @message_2_2_1
    puts @space_3 + @message_2_2_2
    puts @space_3 + @message_2_2_3
    puts @space_3 + @message_2_2_4
    puts @space_3 + @message_2_2_5
    puts @space_3 + @box_line
    case gets.to_i
    when 1; handicap_1
    when 2; handicap_2
    when 3; handicap_4
    when 4; handicap_6
    when 5; selection
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
    when 1; handicap_1
    when 2; handicap_1
    when 3; handicap_1
    when 4; handicap_1
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
    when 1; handicap_2
    when 2; handicap_2
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
    when 1; handicap_4
    when 2; handicap_4
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
    when 1; game
    when 2; handicap_6
    when 3; handicap_6
    else  ; start
    end
  end
#-------------------------------------------------------------------------------

  def game
    display_ban
  end

end

game = ShougiApp.new
game.start