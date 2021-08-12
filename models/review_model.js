const mongoose = require("mongoose");

const schema = mongoose.Schema;

const reviewSchema = new schema(
  {
    rating: {
      type: Number,
      required: true,
    },

    comment: {
      type: String,
      required: true,
    },

    order_id: {
      type: Number,
      required: true,
    },
  },
  { collection: "review" }
);

module.exports = mongoose.model("Review", reviewSchema);
