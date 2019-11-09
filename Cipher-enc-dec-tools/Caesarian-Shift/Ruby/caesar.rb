## Small Straightforward Script :)

##
 # Run       : $ ruby caesar.rb n cipher.txt
 # n         : positive for encode 1 <= n <= 25
 #             negative for decode -1 <= n <= -25
 # cipher.txt: contains cipher you want to enc/dec
 # result    : enc/dec result printed to stdout
##


nrot = ARGV[0].to_i
filename = ARGV[1]

LETTERS = "abcdefghijklmnopqrstuvwxyz"

lc_letters = {}
uc_letters = {}

(0...26).each do |i|
    letter = LETTERS[i]
    lc_letters[i] = letter
    uc_letters[i] = letter.capitalize
end

shifted_lc_letters = []
shifted_uc_letters = []
    
#if n < 0
#    n = 26 + n
#end


(0...26).each do |i|
    i = i - nrot
    if i < 0
        i = 26 + i
    end
    shifted_lc_letters.push(lc_letters[i])
    shifted_uc_letters.push(uc_letters[i])
end

s = shifted_lc_letters.join('') + shifted_uc_letters.join('')


cipher = ""

open(filename) {|f| cipher = f.read }

all_letters = LETTERS + LETTERS.upcase
decipher = cipher.tr(all_letters, s)
puts decipher