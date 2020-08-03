require "./test/test_helper"

class AlphabetTest < Minitest::Test 

  def test_it_exists
    alphabet = Alphabet.new

    assert_instance_of Alphabet, alphabet
  end

  def test_it_has_attributes
    alphabet = Alphabet.new

    assert_equal "0.....", alphabet.braille_alphabet["a"]
    assert_equal "g", alphabet.english_braille["0000.."]
  end
end