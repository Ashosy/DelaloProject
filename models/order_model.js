const mongoose = require("mongoose");

const schema = mongoose.Schema;

const orderSchema = new schema(
  {
    status: {
      type: String,
      required: true,
    },

    progress: {
      type: String,
      required: false,
    },

    is_completed: {
      type: String,
      required: true,
    },

    order_created_date: {
      type: String,
      required: true,
    },

    order_completed_date: {
      type: String,
      required: false,
    },

    start_time: {
      type: Date,
      required: true,
    },

    saved_time: {
      type: Number,
      required: true,
    },

    unique_code: {
      type: Number,
      required: true,
    },

    seeker_id: {
      type: Number,
      required: true,
    },

    provider_id: {
      type: Number,
      required: true,
    },

    final_payment: {
      type: Number,
      required: false,
    },
  },
  { collection: "orders" }
);

module.exports = mongoose.model("Order", orderSchema);
