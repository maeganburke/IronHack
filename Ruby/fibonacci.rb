#require "pry"

class Numermaster
	
def array_of_numbers(array)

	pos = array.select {|n| n > 0}
	neg = array.select {|n| n < 0}
	pos.count
	neg.count

	if pos.count < neg.count
	   return neg
	elsif condition
      neg.count < pos.count
	  return pos
  else condition
      neg.count == pos.count
     return nil
    end
  end

def mmms(array)
  result_mean = array.reduce(:+)/array.length 
  result_mode = array.group_by{|n| n}.max_by{|k,v| v.size}.first

  i = array.length / 2
  if array.length.odd?
  result_median = array[i]
  else
  result_median = ((array[i-1].to_f + array[i].to_f) / 2).to_f
  end
  
  size = []
  size.push(array)
   
  finalshit = []
  finalshit.push(result_mean, result_mode, result_median, size.length)
  return nil if finalshit.length == 0
  
  return finalshit

end

 def fibo(n)
    return 0 if n == 0
    return 1 if n == 1
    fibo(n-1) + fibo(n-2)
 end
end

describe Numermaster do
  before do
    @numbers = Numermaster.new
  end

  describe :array_of_numbers do
    it "should return negative numbers for array = [-1, -2, -3, -4, 1, 10]" do
      expect(@numbers.array_of_numbers([-1, -2, -3, -4, 1, 10])).to eq([-1, -2, -3, -4])
    end
  end

  describe :mmms do
    it "should return for positive values an array of 4 positive elements" do
      expect(@numbers.mmms([9, 6, 8, 11, 20, 100])).to eq([25, 9, 9.5, 1])
    end
  end

  describe :fibo do
    it "should return 2 for n = 10 (55)" do
      expect(@numbers.fibo(10)).to eq(55)
    end
  end
end

