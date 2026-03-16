// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
  {
    product_id: "E1001",
    name: "Smart LED TV",
    category: "Electronics",
    price: 45000,
    brand: "Samsung",
    specifications: {
      screen_size: "55 inch",
      resolution: "4K",
      warranty_years: 2
    },
    features: ["Smart TV", "HDR", "WiFi"]
  },

  {
    product_id: "C2001",
    name: "Men's Denim Jacket",
    category: "Clothing",
    price: 2500,
    brand: "Levis",
    sizes: ["S", "M", "L", "XL"],
    material: "Denim",
    colors: ["Blue", "Black"]
  },

  {
    product_id: "G3001",
    name: "Organic Milk",
    category: "Groceries",
    price: 120,
    brand: "Amul",
    expiry_date: ISODate("2024-12-20"),
    nutrition: {
      calories: 150,
      protein: "8g",
      fat: "8g"
    }
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: ISODate("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product

db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field

db.products.createIndex({ category: 1 });

// This index improves query performance when searching products by category.
