module ApplicationHelper
    
    def full_title(title)
        base = "Expiry Tracker"
        if title.empty?
            base
        else
            title + " | " + base
        end
    end
    
end
