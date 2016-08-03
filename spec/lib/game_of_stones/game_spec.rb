require "spec_helper"
describe Game do
  it "says SECOND for 1" do
    expect(subject.play(1)).to eq Game::Player::SECOND
  end
  it "says FIRST for 2" do
    expect(subject.play(2)).to eq Game::Player::FIRST
  end
  it "says FIRST for 10" do
    expect(subject.play(10)).to eq Game::Player::FIRST
  end
  it "says FIRST for 100" do
    expect(subject.play(1000)).to eq Game::Player::FIRST
  end
end
