require 'pry'
class Triangle
  # write code here
  def initialize(first, second, third)
    @first = first
    @second = second
    @third = third
  end

  def kind
    validate_triangle
    if @first == @second && @second == @third
      :equilateral
    elsif 
      @first == @second || @second == @third || @first == @third
      :isosceles
    else
      :scalene
    end
  end


  def sides_greater_than_zero?
    [@first, @second, @third].all?(&:positive?)
  end

  def valid_triangle_inequality?
    @first + @second > @third && @first +@third > @second && @third + @second > @first
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? &&  valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end

# equi = Triangle.new(3,3,3)
# isos = Triangle.new(3,4,3)
# scal = Triangle.new(3,0,5)

# binding.pry
