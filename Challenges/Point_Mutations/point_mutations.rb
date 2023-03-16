class DNA
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(other_strand)
    smaller_length = strand.length if strand.length <= other_strand.length
    smaller_length = other_strand.length if other_strand.length < strand.length
    i = 0
    ham_dist = 0
    
    while i < smaller_length
      ham_dist += 1 if strand[i] != other_strand[i]
      i += 1
    end
    
    ham_dist
  end
  
  protected
  
  attr_reader :strand
end