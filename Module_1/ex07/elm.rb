#!/usr/bin/env ruby
# elm.rb

class Element
    attr_accessor :name, :position, :number, :small, :molar, :electron, :block
  
    def initialize(data_string)
      parse_data(data_string)
    end
  
    private
  
    def parse_data(data_string)
      data = data_string.split('=').map(&:strip)
      properties = data[1].split(',').map(&:strip)
      
      properties.each do |prop|
        key, value = prop.split(':').map(&:strip)
        case key
        when 'position'
          @position = value.to_i
        when 'number'
          @number = value.to_i
        when 'small'
          @small = value
        when 'molar'
          @molar = value.to_f
        when 'electron'
          @electron = value
        when 'block'
          @block = value
        end
      end
      @name = data[0]
    end
  end
  
  class PeriodicTable
    def initialize(filename)
      @elements = parse_file(filename)
      @max_row = @elements.map { |e| get_row(e.position) }.max
      @max_col = @elements.map { |e| get_col(e.position) }.max
    end
  
    def generate_html
      html = <<~HTML
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <title>Periodic Table</title>
          <style>
            table { border-collapse: collapse; }
            td { 
              border: 1px solid black;
              padding: 10px;
              vertical-align: top;
              width: 100px;
              height: 100px;
            }
            h4 { margin: 0 0 5px 0; }
            ul { 
              padding-left: 20px;
              margin: 0;
            }
          </style>
        </head>
        <body>
          <table>
            #{generate_table_content}
          </table>
        </body>
        </html>
      HTML
  
      File.write('periodic_table.html', html)
    end
  
    private
  
    def parse_file(filename)
      elements = []
      File.readlines(filename).each do |line|
        elements << Element.new(line.chomp) unless line.strip.empty?
      end
      elements
    end
  
    def get_row(position)
      (position - 1) / 18 + 1
    end
  
    def get_col(position)
      (position - 1) % 18 + 1
    end
  
    def generate_table_content
      content = ""
      current_row = 1
  
      (1..@max_row).each do |row|
        content += "<tr>\n"
        (1..@max_col).each do |col|
          position = (row - 1) * 18 + col
          element = @elements.find { |e| e.position == position }
          
          if element
            content += generate_element_cell(element)
          else
            content += "<td></td>\n"
          end
        end
        content += "</tr>\n"
      end
      content
    end
  
    def generate_element_cell(element)
      <<~CELL
        <td>
          <h4>#{element.name}</h4>
          <ul>
            <li>No #{element.number}</li>
            <li>#{element.small}</li>
            <li>#{element.molar}</li>
            <li>#{element.electron}</li>
          </ul>
        </td>
      CELL
    end
  end
  
  # Exécution principale
  if __FILE__ == $PROGRAM_NAME
    table = PeriodicTable.new('periodic_table.txt')
    table.generate_html
  end