module ShiprocketAPI
  class Session < Base
    self.prefix += "/auth/login"
    self.element_name = ""

  end
end