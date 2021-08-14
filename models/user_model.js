const mongoose = require("mongoose");

const schema = mongoose.Schema;
const userSchema = new schema(
  {
    firstname: {
      type: String,
      required: true,
    },
    lastname: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    role: {
      type: String,
      required: false,
    },
    phone: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: false,
    },
    address: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: false,
    },
    category: {
      type: String,
      required: false,
    },
    jobs_done: {
      type: Number,
      required: false,
    },
    per_hour_wage: {
      type: Number,
      required: false,
    },
    recommendation: {
      type: String,
      required: false,
    },
    average_rating: {
      type: Number,
      required: false,
    },
  },
  { collection: "user" }
);

module.exports = mongoose.model("user", userSchema);
