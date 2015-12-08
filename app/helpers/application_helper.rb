module ApplicationHelper
  def menu_items_in_array
    [
        {
            :name => 'Encoding Tools',
            :sub_menus => [
                { :name => 'URL Encoder', :path => url_decoding_tool_tools_url },
                { :name => 'Base64 Encoder', :path => base64_encoder_tools_url },
                { :name => 'Hash generator', :path => hash_generator_tools_url },
                { :name => 'Json Beautifier', :path => json_beautifier_tools_url },
                { :name => 'XML Beautifier', :path => xml_beautifier_tools_url },
                { :name => 'SQL Beautifier', :path => sql_beautifier_tools_url }
            ]
        },
        {
            :name => 'UI Utilities',
            :sub_menus => [
                { :name => 'Screenshot Snapper', :path => screenshot_snapper_utilities_url },
                { :name => 'QR code producer', :path => qr_code_producer_utilities_url },
                { :name => 'Credit Card validator', :path => credit_card_validator_utilities_url }
            ]
        },
        {
            :name => 'Unit Converters',
            :sub_menus => [
                { :name => 'Length converter', :path => length_conversion_conversions_url },
                { :name => 'Weight converter', :path => weight_conversion_conversions_url },
                { :name => 'Time converter', :path => time_conversion_conversions_url },
                { :name => 'Area converter', :path => area_conversion_conversions_url },
                { :name => 'Speed converter', :path => speed_conversion_conversions_url },
                { :name => 'Temperature converter', :path => temperature_conversion_conversions_url },
                { :name => 'Volume converter', :path => volume_conversion_conversions_url },
                { :name => 'Energy converter', :path => energy_conversion_conversions_url },
                { :name => 'Pressure converter', :path => pressure_conversion_conversions_url },
                { :name => 'Power converter', :path => power_conversion_conversions_url },
                { :name => 'Magnetism converter', :path => magnetism_conversion_conversions_url },
                { :name => 'Radiation converter', :path => radiation_conversion_conversions_url }
            ]
        },
        {
            :name => 'Format Converters',
            :sub_menus => [
                { :name => 'XML to Json converter', :path => xml_to_json_format_conversions_url },
                { :name => 'Json to XML converter', :path => json_to_xml_format_conversions_url }
            ]
        },
        {
            :name => 'Data generators',
            :sub_menus => [
                { :name => 'Sample data generator', :path => sample_data_data_generation_url },
                { :name => 'Geographical data generator', :path => geographical_sample_data_data_generation_url },
                { :name => 'Monetary data generator', :path => monetary_sample_data_data_generation_url },
                { :name => 'Internet data generator', :path => internet_sample_data_data_generation_url },
                { :name => 'Commerece and Contact data generator', :path => commerce_and_contact_sample_data_data_generation_url },
                { :name => 'Date and time generator', :path => date_and_time_sample_data_data_generation_url },
                { :name => 'Text generator', :path => text_sample_data_data_generation_url }
            ]
        }
    ]
  end
end
