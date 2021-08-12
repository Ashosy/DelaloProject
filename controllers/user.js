const models = require("../models/user_model");

const user = async (req, res) => {
  const userdata = await models.find();
  return res.json(userdata);
};

module.exports = { user };
