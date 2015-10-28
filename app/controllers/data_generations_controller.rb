class DataGenerationsController < ApplicationController
  def sample_data
    @address_data = []
    @basic_data = []
    @credit_card_data = []
    @currency_data = []
    @date_data = []
    @email_data = []
    @geo_data = []
    @internet_data = []
    @lorem_ipsum_data = []
    @monetary_data = []
    @personal_data = []

    @address_data << { :type => 'City', :value => Forgery('address').city }
    @address_data << { :type => 'Continent', :value => Forgery('address').continent }
    @address_data << { :type => 'Country', :value => Forgery('address').country }
    @address_data << { :type => 'Phone', :value => Forgery('address').phone }
    @address_data << { :type => 'Province', :value => Forgery('address').province }
    @address_data << { :type => 'Province abbreviation', :value => Forgery('address').province_abbrev }
    @address_data << { :type => 'State', :value => Forgery('address').state }
    @address_data << { :type => 'State abbreviation', :value => Forgery('address').state_abbrev }
    @address_data << { :type => 'Street address', :value => Forgery('address').street_address }
    @address_data << { :type => 'Street name', :value => Forgery('address').street_name }
    @address_data << { :type => 'Street number', :value => Forgery('address').street_number }
    @address_data << { :type => 'Street suffix', :value => Forgery('address').street_suffix }
    @address_data << { :type => 'Street zip', :value => Forgery('address').zip }

    @basic_data << { :type => 'Boolean', :value => Forgery('basic').boolean }
    @basic_data << { :type => 'Color', :value => Forgery('basic').color }
    @basic_data << { :type => 'Encrypt', :value => Forgery('basic').encrypt }
    @basic_data << { :type => 'Frequency', :value => Forgery('basic').frequency }
    @basic_data << { :type => 'HEX color', :value => Forgery('basic').hex_color }
    @basic_data << { :type => 'Number', :value => Forgery('basic').number }
    @basic_data << { :type => 'Password', :value => Forgery('basic').password }
    @basic_data << { :type => 'Short HEX color', :value => Forgery('basic').short_hex_color }
    @basic_data << { :type => 'Text', :value => Forgery('basic').text }
    @basic_data << { :type => 'Timezone', :value => Forgery('time').zone }

    @credit_card_data << { :type => 'Check digit number', :value => Forgery('credit_card').check_digit(Forgery('credit_card').number) }
    @credit_card_data << { :type => 'Credit card number', :value => Forgery('credit_card').number }
    @credit_card_data << { :type => 'Credit card type', :value => Forgery('credit_card').type }

    @currency_data << { :type => 'Currency symbol', :value => Forgery('currency').code }
    @currency_data << { :type => 'Currency description', :value => Forgery('currency').description }

    @date_data << { :type => 'Date', :value => Forgery('date').date }
    @date_data << { :type => 'Day', :value => Forgery('date').day }
    @date_data << { :type => 'Day of week', :value => Forgery('date').day_of_week }
    @date_data << { :type => 'Month', :value => Forgery('date').month }
    @date_data << { :type => 'Year', :value => Forgery('date').year }

    @email_data << { :type => 'Email address', :value => Forgery('email').address }
    @email_data << { :type => 'Email subject', :value => Forgery('email').subject }
    @email_data << { :type => 'Email body', :value => Forgery('email').body }

    @geo_data << { :type => 'Latitude', :value => Forgery('geo').latitude }
    @geo_data << { :type => 'Latitude degrees', :value => Forgery('geo').latitude_degrees }
    @geo_data << { :type => 'Latitude direction', :value => Forgery('geo').latitude_direction }
    @geo_data << { :type => 'Latitude minutes', :value => Forgery('geo').latitude_minutes }
    @geo_data << { :type => 'Latitude seconds', :value => Forgery('geo').latitude_seconds }
    @geo_data << { :type => 'Longitude', :value => Forgery('geo').longitude }
    @geo_data << { :type => 'Longitude degrees', :value => Forgery('geo').longitude_degrees }
    @geo_data << { :type => 'Longitude direction', :value => Forgery('geo').longitude_direction }
    @geo_data << { :type => 'Longitude minutes', :value => Forgery('geo').longitude_minutes }

    @geo_data << { :type => 'Longitude seconds', :value => Forgery('geo').longitude_seconds }

    @internet_data << { :type => 'CCTID', :value => Forgery('internet').cctld }
    @internet_data << { :type => 'Domain name', :value => Forgery('internet').domain_name }
    @internet_data << { :type => 'Email address', :value => Forgery('internet').email_address }
    @internet_data << { :type => 'Email subject', :value => Forgery('internet').email_subject }
    @internet_data << { :type => 'IPv4', :value => Forgery('internet').ip_v4 }
    @internet_data << { :type => 'IPv6', :value => Forgery('internet').ip_v6 }
    @internet_data << { :type => 'Top level domain', :value => Forgery('internet').top_level_domain }
    @internet_data << { :type => 'Username', :value => Forgery('internet').user_name }

    @lorem_ipsum_data << { :type => 'Character', :value => Forgery('lorem_ipsum').character }
    @lorem_ipsum_data << { :type => 'Characters', :value => Forgery('lorem_ipsum').characters }
    @lorem_ipsum_data << { :type => 'Lorem ipsum characters', :value => Forgery('lorem_ipsum').lorem_ipsum_characters }
    @lorem_ipsum_data << { :type => 'Lorem ipsum words', :value => Forgery('lorem_ipsum').lorem_ipsum_words }
    @lorem_ipsum_data << { :type => 'Paragraph', :value => Forgery('lorem_ipsum').paragraph }
    @lorem_ipsum_data << { :type => 'Paragraphs', :value => Forgery('lorem_ipsum').paragraphs }
    @lorem_ipsum_data << { :type => 'Sentence', :value => Forgery('lorem_ipsum').sentence }
    @lorem_ipsum_data << { :type => 'Sentences', :value => Forgery('lorem_ipsum').sentences }
    @lorem_ipsum_data << { :type => 'Text', :value => Forgery('lorem_ipsum').text }
    @lorem_ipsum_data << { :type => 'Title', :value => Forgery('lorem_ipsum').title }
    @lorem_ipsum_data << { :type => 'Word', :value => Forgery('lorem_ipsum').word }
    @lorem_ipsum_data << { :type => 'Words', :value => Forgery('lorem_ipsum').words }

    @monetary_data << { :type => 'Formatted money', :value => Forgery('monetary').formatted_money }
    @monetary_data << { :type => 'Money', :value => Forgery('monetary').money }

    @personal_data << { :type => 'Company name', :value => Forgery('name').company_name }
    @personal_data << { :type => 'Female first name', :value => Forgery('name').female_first_name }
    @personal_data << { :type => 'First name', :value => Forgery('name').first_name }
    @personal_data << { :type => 'Full name', :value => Forgery('name').full_name }
    @personal_data << { :type => 'Industry', :value => Forgery('name').industry }
    @personal_data << { :type => 'Job title', :value => Forgery('name').job_title }
    @personal_data << { :type => 'Job title suffix', :value => Forgery('name').job_title_suffix }
    @personal_data << { :type => 'Last name', :value => Forgery('name').last_name }
    @personal_data << { :type => 'Location', :value => Forgery('name').location }
    @personal_data << { :type => 'Male first name', :value => Forgery('name').male_first_name }
    @personal_data << { :type => 'Name suffix', :value => Forgery('name').suffix }
    @personal_data << { :type => 'Name title', :value => Forgery('name').title }
    @personal_data << { :type => 'Abbreviated gender', :value => Forgery('personal').abbreviated_gender }
    @personal_data << { :type => 'Gender', :value => Forgery('personal').gender }
    @personal_data << { :type => 'Language', :value => Forgery('personal').language }
    @personal_data << { :type => 'Race', :value => Forgery('personal').race }
    @personal_data << { :type => 'Shirt size', :value => Forgery('personal').shirt_size }
  end
end