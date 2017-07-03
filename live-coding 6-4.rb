# Write a #french_ssn_info method extracting infos from French SSN (Social Security Number) using regexp.
# Valid French SSN numbers have the following pattern:
# "1 84 12 76 451 089 46"
# key (1 == man, 2 == woman)
# Year of birth (84)
# Month of birth (12)
# Department of birth (76, basically included between 01 and 99)
# 6 random digits (451 089)
# A 2 digits key (46, we'll see later how it can be deduced from the rest of the digits)
# The method must return the following strings:
# french_ssn_info("1 84 12 76 451 089 46")
# => "a man, born in December, 1984 in Seine-Maritime."

# french_ssn_info("123")
# => "The number is invalid"
require "date"
SSN_PATTERN = /^(?<gender>[1-2])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<area>\d[1-9])\s?(?<id>\d{3}\s?\d{3})\s?(?<key>\d{2})$/

AREAS_OF_FRANCE = {
                    76 => "Seine-Maritime",
                    69 => "Lyon",
                    75 => "Paris",
                    14 => "Calvados"
                  }

def french_ssn_info(ssn_number)

  match = ssn_number.match(SSN_PATTERN)

  gender = match[:gender].to_i
  year = match[:year].to_i
  month = match[:month].to_i
  area = match[:area].to_i
  key = match[:key].to_i

  user_gender = gender == 1 ? "man" : "woman"
  birthday = Date.new(1900 + year, month).strftime("%B, %Y")
  place = AREAS_OF_FRANCE[area]

  half_num = (ssn_number.gsub(" ", "").to_i - key) / 100
  check_key = 97 - (half_num % 97)

  if check_key == key
    "invalid number"
  else
    "a #{user_gender}, born in #{birthday} in #{place}."
  end

end

puts french_ssn_info("1 84 12 76 451 089 46")
