module Validations

#----自分の駒を選んでいるかどうか確認------------------------------------------------
  def validate_1
    #先手が後手の駒を選ぶとエラー
    if @fs == 1 && @b[@before_p].include?("^")
      puts @error_2
      @before_p = gets.to_i; validate_1
    #後手が先手の駒を選ぶとエラー
    elsif @fs == 2 && @b[@before_p] =~ /^\p{Han}|^\p{Hiragana}/
      puts @error_2
      @before_p = gets.to_i; validate_1
    #何もないマスを選ぶとエラー
    elsif @b[@before_p] == "\s\s\s"
      puts @error_2
      @before_p = gets.to_i; validate_1
    else
    end
  end
#-------------------------------------------------------------------------------

#----選んだ駒が動ける場所があるかどうかの確認------------------------------------------
  def validate_2
  end
#-------------------------------------------------------------------------------

#----選んだ駒が何かの判別----------------------------------------------------------
  def check_1
    case @b[@before_p]
    when /歩/;
    when /香/;
    when /桂/;
    when /銀/;
    when /金/;
    when /[王玉]/;
    when /角/;
    when /飛/;
    #成駒
    when /と/;
    when /よ/;
    when /け/;
    when /ぎ/;
    when /馬/;
    when /龍/;
    else
    end
  end
#-------------------------------------------------------------------------------



end
