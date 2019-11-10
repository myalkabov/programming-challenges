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

LOW_CASE = {
             0  => 'a', 1  => 'b', 2  => 'c', 3  => 'd',
             4  => 'e', 5  => 'f', 6  => 'g', 7  => 'h',
             8  => 'i', 9  => 'j', 10 => 'k', 11 => 'l',
             12 => 'm', 13 => 'n', 14 => 'o', 15 => 'p',
             16 => 'q', 17 => 'r', 18 => 's', 19 => 't',
             20 => 'u', 21 => 'v', 22 => 'w', 23 => 'x',
             24 => 'y', 25 => 'z',
           }

UP_CASE  = {
             0  => 'A', 1  => 'B', 2  => 'C', 3  => 'D',
             4  => 'E', 5  => 'F', 6  => 'G', 7  => 'H',
             8  => 'I', 9  => 'J', 10 => 'K', 11 => 'L',
             12 => 'M', 13 => 'N', 14 => 'O', 15 => 'P',
             16 => 'Q', 17 => 'R', 18 => 'S', 19 => 'T',
             20 => 'U', 21 => 'V', 22 => 'W', 23 => 'X',
             24 => 'Y', 25 => 'Z',
           }

#LETTERS = "abcdefghijklmnopqrstuvwxyz"

#lc_letters = {}
#uc_letters = {}

#(0...26).each do |i|
#    letter = LETTERS[i]
#    lc_letters[i] = letter
#    uc_letters[i] = letter.capitalize
#end

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
