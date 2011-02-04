class BF
	def initialize
		@x = [0]
		@xc = 0
		@dumpBuf = []
		@outBuf = ""
		@outSnapBuf = []
	end
	
	def apply(com)
		pc = 0
		l = 0
		while pc < com.size do
			@x[@xc] ||= 0
			case com[pc]
				# "+"のとき
				when 43 then
					@x[@xc] += 1
				# "-"のとき
				when 45 then
					@x[@xc] -= 1
				# "."のとき
				when 46 then
					@outBuf += sprintf("%c", @x[@xc])
					STDOUT.putc @x[@xc]
				# ","のとき
				when 44 then
					p ">>"
					@x[@xc] = STDIN.getc
				# ">"のとき
				when 62 then
					@xc += 1
				# "<"のとき
				when 60 then
					@xc -= 1
				# "["のとき
				when 91 then
					if @x[@xc] == 0 then
						pc += 1
						while (l > 0 || com[pc] != 93) do
							l += 1 if com[pc] == 91
							l -= 1 if com[pc] == 93
							pc += 1
						end
					end
				# "]"のとき
				when 93 then
					pc -= 1
					while (l > 0 || com[pc] != 91) do
						l += 1 if com[pc] == 93
						l -= 1 if com[pc] == 91
						pc -= 1
					end
					pc -= 1
				# "!"のとき
				when 33 then
					@dumpBuf.push @x.join(", ")
				# "?"のとき
				when 63 then
					@outSnapBuf.push @outBuf
				else
			end
			pc+=1
		end
	end
	
	def getDump
		return @dumpBuf.join("\n") if !@dumpBuf.empty?
		false
	end
	
	def getSnap
		return @outSnapBuf.join("\n") if !@outSnapBuf.empty?
		false
	end
	
	def getResult
		@outBuf
	end
end

ARGV.each{|filename|
	fp = open filename
	bf = BF.new
	command = fp.read
	bf.apply(command)
	if bf.getSnap then
		print "\n\n======== STDOUT Snapshots ========\n"
		print bf.getSnap
		print "\n"
	end
	if bf.getDump then
		print "\n\n======== Dumped Memory Data ========\n"
		print bf.getDump
		print "\n"
	end
	fp.close
	print "\n"
}