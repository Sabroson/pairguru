class TitleBracketsValidator < ActiveModel::Validator
  BRACKETS = [["(", ")"], ["{", "}"], ["[", "]"]]

  def validate(record)
    BRACKETS.each do |pair|
      bracket_symbols = {
        open: pair[0],
        close: pair[1]
      }
      unless check_brackets(record.title, bracket_symbols)
        record.errors[:title] << "Misplaced or empty brackets"
      end
    end
  end

  private

  def check_brackets(title, brackets)
    equal_num_open_close_brackets = title.count(brackets[:open]) == title.count(brackets[:close])
    ordered_brackets = true
    has_open_and_close_brackets = title.index(brackets[:open]) && title.index(brackets[:close])
    if has_open_and_close_brackets && equal_num_open_close_brackets
      ordered_brackets = false if title.index(brackets[:close]) - title.index(brackets[:open]) < 2
    end
    equal_num_open_close_brackets && ordered_brackets
  end
end
