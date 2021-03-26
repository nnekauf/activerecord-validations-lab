class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.match?(/(Won't Believe|Secret|Top \d|Guess)/)
            record.errors[:title] << "Must be clickbait-y"
        end
    end

end