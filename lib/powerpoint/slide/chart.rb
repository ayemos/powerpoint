require 'fileutils'
require 'erb'

module Powerpoint
  module Slide
    class Chart
      include Powerpoint::Util

      attr_reader :title, :content

      def initialize(options={})
        require_arguments [:title, :content], options
        options.each {|k, v| instance_variable_set("@#{k}", v)}
      end

      def save(extract_path, index)
        save_rel_xml(extract_path, index)
        save_slide_xml(extract_path, index)
        save_chart_xml(extract_path, 1)
      end

      def save_rel_xml(extract_path, index)
        render_view('chart_rel.xml.erb', "#{extract_path}/ppt/slides/_rels/slide#{index}.xml.rels", index: index)
      end
      private :save_rel_xml

      def save_slide_xml(extract_path, index)
        render_view('chart_slide.xml.erb', "#{extract_path}/ppt/slides/slide#{index}.xml")
      end
      private :save_slide_xml

      def save_chart_xml(extract_path, index)
        render_view('chart_chart.xml.erb', "#{extract_path}/ppt/charts/chart#{index}.xml")
      end
      private :save_slide_xml
    end
  end
end
