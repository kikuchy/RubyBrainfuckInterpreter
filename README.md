#Ruby Brainfuck Interpreter (+ alpha)

##これは何だ
-BrainfuckのインタープリターをRubyで書いたものです。
-オリジナルのBFIと同じように作ってあります。

##使い方はどうだ
	ruby rbfi.rb xxxxxxx.bf yyyyyyyy.bf ...
-実行時引数にはbfファイルをいくつでも続けられます。

##オリジナルのBFIとの違いは何だ
多少コマンドを追加してあります。
-`!`　このコマンドが読まれた時点でのメモリの状況をダンプします。ダンプ結果は実行終了時に表示されます。
-`?`　このコマンドが読まれた時点で標準出力に出力済みになっている文字列を記録します（スナップショット）。スナップショットは実行終了時に表示されます。
