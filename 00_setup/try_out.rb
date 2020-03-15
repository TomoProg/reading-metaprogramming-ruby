class TryOut
  # このクラスの仕様
  # コンストラクタは、2つまたは3つの引数を受け付ける。引数はそれぞれ、ファーストネーム、ミドルネーム、ラストネームの順で、ミドルネームは省略が可能。
  def initialize(*names)
    if names.length < 2 || names.length > 3
      throw ArgumentError
    end

    if names.length == 3
      init_names(names[0], names[1], names[2])
    else
      init_names(names[0], "", names[1])
    end
  end

  # full_nameメソッドを持つ。
  # これは、ファーストネーム、ミドルネーム、ラストネームを半角スペース1つで結合した文字列を返す。
  # ただし、ミドルネームが省略されている場合に、ファーストネームとラストネームの間には1つのスペースしか置かない
  def full_name
    [@first_name, @middle_name, @last_name]
      .select {|name| name.length > 0}
      .join(' ')
  end

  # first_name=メソッドを持つ。
  # これは、引数の内容でファーストネームを書き換える。
  def first_name=(val)
    @first_name = val
  end

  # upcase_full_nameメソッドを持つ。
  # これは、full_nameメソッドの結果をすべて大文字で返す。
  # このメソッドは副作用を持たない。
  def upcase_full_name
    full_name.upcase
  end

  # upcase_full_name! メソッドを持つ。
  # これは、upcase_full_nameの副作用を持つバージョンで、ファーストネーム、ミドルネーム、ラストネームをすべて大文字に変え、オブジェクトはその状態を記憶する
  def upcase_full_name!
    init_names(@first_name.upcase, @middle_name.upcase, @last_name.upcase)
    full_name
  end

  private
  def init_names(first_name, middle_name, last_name)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end
end
