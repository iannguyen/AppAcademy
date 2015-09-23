def first_anagram(word1, word2)
  word1.split('').permutation.include?(word2.split(''))
end

def second_anagram(word1,word2)
  clone1 = word1.dup.split('')
  clone2 = word2.dup.split('')
  word1.each_char.with_index do |char1,idx1|
    word2.each_char.with_index do |char2,idx2|
      if char1 == char2
        clone1.delete(char1)
        clone2.delete(char2)
      end
    end
  end
  clone1.empty? && clone2.empty?
end

def third_anagram(word1,word2)
  word1.sort == word2.sort
end

def fourth_anagram(word1,word2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  word1.each_char do |char|
    hash1[char] += 1
  end
  word2.each_char do |char|
    hash2[char] += 1
  end
  hash1 == hash2 
end
