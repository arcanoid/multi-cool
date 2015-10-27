class ToolsController < ApplicationController
  def url_decoding_tool
    @final_text = ''

    if params[:full_text].present?
      @final_text = case params[:type]
                      when 'encode' then ERB::Util.url_encode(params[:full_text])
                      when 'decode' then URI.decode(params[:full_text])
                      else params[:full_text]
                    end
    end
  end

  def hash_generator
    @initial_text = params[:initial_text].present? ? params[:initial_text] : 'Hello world'
    @digested_text = case params[:type]
                       when 'SHA1' then Digest::SHA1.hexdigest(@initial_text)
                       when 'SHA256' then Digest::SHA256.hexdigest(@initial_text)
                       when 'SHA512' then Digest::SHA512.hexdigest(@initial_text)
                       when 'SHA384' then Digest::SHA384.hexdigest(@initial_text)
                       when 'MD5' then Digest::MD5.hexdigest(@initial_text)
                       when 'RMD160' then Digest::RMD160.hexdigest(@initial_text)
                       else ''
                     end

  end

  def json_beautifier
    text = params[:initial_text].present? ? params[:initial_text] : '{"desc": {"someKey": "someValue", "anotherKey" : "value"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'

    begin
      @initial_text = text
      @final_text = JSON.pretty_generate(JSON.parse(text))
    rescue JSON::ParserError => e
      flash[:error] = 'Wrong format'
      redirect_to json_beautifier_tools_url
    end
  end

  def sql_beautifier
    require "anbt-sql-formatter/formatter"

    text = params[:initial_text].present? ? params[:initial_text] : "select `col1`, `col2` FROM `table` WHERE ((`col1` = 1) AND (`col2` = 5))"

    rule = AnbtSql::Rule.new
    %w(count sum substr date coalesce).each{|func_name|
      rule.function_names << func_name.upcase
    }

    formatter = AnbtSql::Formatter.new(rule)

    @initial_text = "" << text
    @final_text = formatter.format(text)
  end

  def xml_beautifier
    xml_text = params[:initial_text].present? ?
        params[:initial_text] :
        "<note><to>Tove</to><from>Jani</from><heading>Reminder</heading><body>Don't forget me this weekend!</body></note>"

    xsl = <<XSL
          <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
            <xsl:strip-space elements="*"/>
            <xsl:template match="/">
              <xsl:copy-of select="."/>
            </xsl:template>
          </xsl:stylesheet>
XSL

    begin
      @initial_text = xml_text
      doc  = Nokogiri::XML(xml_text)
      xslt = Nokogiri::XSLT(xsl)
      out  = xslt.transform(doc)
      @final_text = out
    rescue Nokogiri::XML::SyntaxError => e
      flash[:error] = 'Wrong format'
      redirect_to xml_beautifier_tools_url
    end
  end

  def base64_encoder
    @final_text = case params[:type]
                    when 'encode' then Base64.encode64(params[:full_text])
                    when 'decode' then Base64.decode64(params[:full_text])
                    else ''
                  end

  end
end