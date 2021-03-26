class Post < ActiveRecord::Base
    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
#     # 
#     # validates_with TitleValidator, on: :create
#     validate :clickbait

#     def clickbait
#         # if !self.title.include?(/Won't Believe/i,/Secret/i,/Guess/i,/Top \d/i)
#         if !self.title.include?("Won't Believe" || "Secret" || "Top #{/\d/}" || "Guess")
#            self.errors.add(:title, "Must be clickbait-y")
#     #       record.errors[:title] << "Must be clickbait-y"
#     #         # errors.add(:clickbait, "Must be clickbait-y")
#         end
#     end
# end
validate :clickbait

    CLICKBAIT_PATTERNS = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def clickbait
        if title.present? && CLICKBAIT_PATTERNS.none? {|p| title.match(p)}
            errors.add(:title, "title not clickbait-y enough")
        end
    end
end
