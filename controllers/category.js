const models = require("../models/category_model");

const category = async (req, res) => {
  const categorydata = await models.find();
  return res.json(categorydata);
};
module.exports = { category };
