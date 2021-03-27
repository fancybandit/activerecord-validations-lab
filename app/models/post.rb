
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbaity

    private

    def title_is_clickbaity
        baits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title && baits.none? {|bait| title.include?(bait)}
            errors.add(:title, "must conatin \"Won't Believe\", \"Secret\", \"Top [number]\", or \"Guess\"")
        end
    end
end

