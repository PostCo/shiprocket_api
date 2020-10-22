module ShiprocketAPI
  class OrderItem < Base
    DEFAULT_ATTRS = {
      name: "",
      sku: "",
      units: 0,
      selling_price: 0,
      discount: "",
      tax: "",
      hsn: ""
    }
  end
end