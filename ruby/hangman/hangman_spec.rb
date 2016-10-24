require_relative 'hangman'

describe Hangman do
  let(:game) { Hangman.new(["ari", "bando", "secret"]) }

  it "stores the secret word given on initialization" do
    expect(game.secret_word).to eq "secret"
  end

  it "creates a readable current state of the game" do
    expect(game.current_state).to eq ["_","_","_","_","_","_"]
  end

  it "checks a guess" do
    game.check_guess("s")
    expect(game.current_state).to eq ["s","_","_","_","_","_"]
  end

end