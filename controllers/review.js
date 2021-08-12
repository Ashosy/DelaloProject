const models = require("../models/review_model");

const review = async (req, res) => {
  const reviewData = await models.find();
  return res.json(reviewData);
};

module.exports = { review };
