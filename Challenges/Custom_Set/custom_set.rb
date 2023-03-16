class CustomSet
  def initialize(arr=[])
    @set = arr.dup
    @set.uniq!
  end

  def empty?
    @set.empty?
  end

  def contains?(num)
    @set.include?(num)
  end

  def subset?(other)
    @set.select { |num| other.contains?(num) }.length == @set.length
  end

  def disjoint?(other)
    l = @set.select { |num| !(other.contains?(num)) }.length
    l == @set.length
  end

  def eql?(other)
    self == other
  end

  def add(num)
    @set << num
    @set.uniq!
    self
  end

  def intersection(other)
    @set = @set.select { |num| other.contains?(num) }
    self
  end

  def difference(other)
    @set = @set.select { |num| !(other.contains?(num)) }
    self
  end

  def union(other)
    other.set.each { |num| @set << num }
    @set.uniq!
    self
  end

  def ==(other)
    @set.sort == other.set.sort
  end

  protected

  attr_reader :set
end