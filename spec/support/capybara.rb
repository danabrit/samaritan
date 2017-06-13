def select_datetime(field_name, value)
  fill_in field_name, with: "#{value}.strftime('%m/%d/%Y %I:%M %p')"
end
