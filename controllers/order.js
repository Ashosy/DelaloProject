const models = require("../models/order_model");

const order = async (req, res) => {
  const orderdata = await models.find();
  return res.json(orderdata);
};
module.exports = { order };
