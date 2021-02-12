class GamesController < ApplicationController
  def new
    @letters = (0...8).map { rand(65..90).chr }
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] || '').upcase
    @valid = valid?(@word, @letters)
  end

  private

  def valid?(word, _letter)
    word.chars.all? { |letter| word.count(letter) <= @letters.count(letter) }
  end
end
