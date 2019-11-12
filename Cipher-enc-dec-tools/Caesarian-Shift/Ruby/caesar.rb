## Small Straightforward Script :)

##
 # Run       : $ ruby caesar.rb N cipher.txt
 # N         : positive for encode 1 <= N <= 25
 #             negative for decode -1 <= N <= -25
 # cipher.txt: contains cipher you want to enc/dec
 # result    : enc/dec result printed to stdout
##


N = ARGV[0].to_i
FNAME = ARGV[1]


LOW_CASE = "abcdefghijklmnopqrstuvwxyz"
UP_CASE  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


shifted_lc_letters = []
shifted_uc_letters = []

l = 0
if N >= 0
  l = N
else
  l = 26 + N
end


(l...l+26).each do |i|
  # left shift in a-zA-Z but right shift in caesaar.
  i = (i >= 26) ? (i - 26) : i
  shifted_lc_letters.push(LOW_CASE[i])
  shifted_uc_letters.push(UP_CASE[i])
end


shifted_letters = shifted_lc_letters.join('') + shifted_uc_letters.join('')
cipher = ""

open(FNAME) {|f| cipher = f.read }

decipher = cipher.tr(LOW_CASE + UP_CASE, shifted_letters)
puts shifted_letters
puts decipher
