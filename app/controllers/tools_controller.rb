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
    end
  end

  def json_to_ruby_class
    text = params[:initial_text].present? ? params[:initial_text] : '{"desc": {"someKey": "someValue", "anotherKey" : "value"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'
    type = params[:class_type].present? ? params[:class_type] : 'ruby'

    begin
      @initial_text = text
      @type = type
      @final_text = JsonToRubyClass.produce_models(JSON.parse(text), type)
    rescue JSON::ParserError => e
      flash[:error] = 'Wrong format'
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

  def ssh_generator
    @ssh_key = SSHKey.generate(
        type: params[:type].present? ? params[:type] : 'RSA',
        bits: (params[:bits].present? ? params[:bit] : 1024),
        comment: params[:comment].presence,
        passphrase: params[:passphrase].presence
    )
  end

  def text_analysis
    text = params[:initial_text].present? ? params[:initial_text] : 'The quick brown fox jumps over the lazy dog'

    @initial_text = text
    @analysis_hash = TextAnalysis.analyze_text(text)

    @not_gsm_compatible_characters = []

    text.split('').each do |char|
     unless GSMEncoder.can_encode? char
      @not_gsm_compatible_characters << char
     end
    end
  end

  def text_replacement
    text = params[:initial_text].present? ? params[:initial_text] : 'The quick brown fox jumps over the lazy dog'
    @initial_text = text
    @final_text = text.dup

    @replacement_rule_from = params[:replacement_rule_from].present? ? params[:replacement_rule_from] : 'ΑΒΕΖΗΙΚΜΝΟΡΤΥΧαβγδεζηθικλμνξοπρστυφχψωςΆΈΉΊΪΌΎΫΏάέήίϊόύϋώ'
    @replacement_rule_to = params[:replacement_rule_to].present? ? params[:replacement_rule_to] : 'ABEZHIKMNOPTYXABΓΔEZHΘIKΛMNΞOΠPΣTYΦXΨΩΣAEHIIOYYΩAEHIIOYYΩ'

    @replacement_rule_from.split('').each_with_index do |char,index|
      @final_text.gsub!(char, @replacement_rule_to.split('')[index])
    end
  end

  def json_web_token
    @initial_text = params[:initial_text].present? ? params[:initial_text] : '{"desc" => "someKey"}'
    @algorithm = params[:algorithm].present? ? params[:algorithm] : 'none'
    @key = params[:key].present? ? params[:key] : 'gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C'

    begin
      @final_text = case params[:option]
                      when 'sign' then JsonWebToken.sign(@initial_text, :key => @key, :alg => @algorithm)
                      when 'verify' then JsonWebToken.verify(@initial_text, :key => @key, :alg => @algorithm)
                    end

    rescue Exception => e
      flash[:error] = "Wrong format #{e}"
      redirect_to json_web_token_tools_url
    end
  end
end
