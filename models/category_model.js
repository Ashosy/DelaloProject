const mongoose = require("mongoose");

const schema = mongoose.Schema;

const categorySchema = new schema(
  {
    name: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: true,
    },
    numOfProviders: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
  },
  { collection: "category" }
);

module.exports = mongoose.model("Category", categorySchema);
