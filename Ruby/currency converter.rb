# OC2. Money, money, money

# We were going back home yesterday. Second week, Monday, rain, new teacher... But just before getting into the subway, we found a bag full of
# money in different currencies! So we skipped TV shows for now (we’ll be back sometime, don’t worry!) because, don’t know why, we were
# suddenly interested in money.

# So we got to our local dealer, knowing that either way he will have a cut of the deal, but anyway we asked him about the current rates.
# And instead of using his services, we decdied we wanted to get home, and write an awesome currency converter so we could know how much
# money was in the bag.

# Let’s do it now!

# You already have a little skeleton class with currency exchanges from and to €. Note that converting from/to € is direct, but if none
# of the from/to currencies is the € you have to do two conversions, using the € as a bridge.

# The only condition is: write ALL the tests first. Go full TDD on it. Yeah, all tests first. All of them. Yeah, every single one. Every.
# Single. One. Got it? One more time: every single one. And then, when everything is failing and so on... go implement it.

# Feel free to add support for your country currency! :)

class TheBanker
  TO_EURO = {
    usd: 0.89,
    gbp: 1.4,
    cad: 0.73,
    aud: 0.69
  }

  FROM_EURO = {
    usd: 1.12,
    gbp: 0.71,
    cad: 1.39,
    aud: 1.45
  }

  def self.convert(wallet, from_currency, to_currency)
    allowed_currencies = TO_EURO.keys << :eur 

    return wallet * TO_EURO(from_currency) if to_currency == :eur
    return wallet * FROM_EURO(to_currency) if from_currency == :eur

    @wallet * TO_EURO[from_currency] * FROM_EURO[to_currency]
  end
end

# ---- OUR TESTS

describe TheBanker do
  it "should be able to convert 10 of any currency to another"
  before {@wallet = 10}

  describe "direct conversion to euros" do
    it "should convert any currency to euros"
      before {@to_currency = :eur}
      TheBanker.convert(@wallet, usd, @to_currency).should == 10 * 0.89
    end
  end

  describe :convert do
    it "should convert an American traveler's dollars into British pounds" do
      expect(TheBanker.convert(@wallet, usd, gbp)).to eq(6.319)
    end

    it "should convert an American traveler's dollars into Canadian dollars" do
      expect(TheBanker.convert(@wallet, usd, cad)).to eq(12.371)
    end

    it "should convert an American traveler's dollars into Australian dollars" do
      expect(TheBanker.convert(@wallet, usd, aud)).to eq(12.905)
    end

    # ---------
  
    it "should convert a British traveler's dollars into Canadian dollars" do
      expect(TheBanker.convert(@wallet, gbp, cad)).to eq(19.46)
    end

    it "should convert a British traveler's dollars into Australian dollars" do
      expect(TheBanker.convert(@wallet, gbp, aud)).to eq(20.3)
    end

    it "should convert a British traveler's dollars into American dollars" do
      expect(TheBanker.convert(@wallet, gbp, usd)).to eq(15.68)
    end

    # ---------

    it "should convert a Canadian traveler's dollars into Australian dollars" do
      expect(TheBanker.convert(@wallet, cad, aud)).to eq(10.585)
    end

    it "should convert a Canadian traveler's dollars into American dollars" do
      expect(TheBanker.convert(@wallet, cad, usd)).to eq(8.176)
    end

    it "should convert a Canadian traveler's dollars into British pounds" do
      expect(TheBanker.convert(@wallet, cad, gbp)).to eq(5.183)
    end

    # ---------

    it "should convert an Australian traveler's dollars into American dollars" do
      expect(TheBanker.convert(@wallet, aud, usd)).to eq(7.728)
    end

    it "should convert an Australian traveler's dollars into British pounds" do
      expect(TheBanker.convert(@wallet, aud, gbp)).to eq(4.899)
    end

    it "should convert an Australian traveler's dollars into Canadian dollars" do
      expect(TheBanker.convert(@wallet, aud, cad)).to eq(9.591)
    end
  end
end

  # p TheBanker.convert(10, aud, cad)