
class Chisel

  attr_accessor :input,
                :output

  def initialize
    @input = File.read(ARGV[0])
    @output = File.open(ARGV[1], "w")

  end

  def head_tags
    @output = @input.split("\n\n").map do |line|
      if line.start_with?("# ")
        "<h1>#{line[2..-1]}</h1>"
      elsif line.start_with?("## ")
        "<h2>#{line[3..-1]}</h2>"
      elsif line.start_with?("### ")
        "<h3>#{line[4..-1]}</h3>"
      elsif line.start_with?("#### ")
        "<h4>#{line[5..-1]}</h4>"
      elsif line.start_with?("##### ")
        "<h5>#{line[6..-1]}</h5>"
      elsif line.start_with?("###### ")
        "<h6>#{line[7..-1]}</h6>"
      else
        line.prepend("<p>").insert(-1, "</p>")
      end
    end
      @output.join("\n\n")
  end

  def bold_and_italics
    @output = @input.split("\n").map do |x|
      if x.include?("*") || x.include?("**")
      end
    end
  end

  def html_to_file
    @output.write(head_tags)
  end

end



chisel = Chisel.new
chisel.html_to_file
