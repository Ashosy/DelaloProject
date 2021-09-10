const models = require("../models/user_model");
const categoryModels = require("../models/category_model");
const orderModel = require("../models/order_model");

const postProvider = (req, res) => {
  const providersList = new models({
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    password: req.body.password,
    email: req.body.email,
    role: req.body.role,
    phone: req.body.phone,
    image: req.body.image,
    address: req.body.address,
    description: req.body.description,
    category: req.body.category,
    jobs_done: req.body.jobs_done,
    per_hour_wage: req.body.per_hour_wage,
    recommendation: req.body.recommendation,
    average_rating: req.body.average_rating,
  });

  providersList
    .save()
    .then((result) => {
      const postResult = {
        provider: result,
        message: `Provider with email ${providersList.email} was created`,
      };
      res.send(postResult);
    })
    .catch((err) => {
      console.log(err);
    });
};

const getProvider = (req, res) => {
  models
    .find()
    .then((result) => {
      if (result.length == 0) {
        res.send({ message: "No providers found" });
      } else {
        res.send(result);
      }
    })
    .catch((err) => {
      console.log(err);
    });
};

const getProviderById = (req, res) => {
  models
    .findById(req.params.id)
    .then((result) => {
      if (!result) {
        res.send({ message: "No provider with this Id found" });
      } else {
        res.send(result);
      }
    })
    .catch((err) => {
      console.log(err);
    });
};

const updateProviderById = (req, res) => {
  models.findById(req.params.id).then((result) => {
    result.jobs_done += 1;
    rating = req.body.average_rating;
    review_count = orderModel.findById(result.id);
  });
};

const getTopProviders = (req, res) => {
  models
    .find()
    .where("average_rating")
    .gte(3)
    .then((result) => {
      if (result.length == 0) {
        res.send({ message: "No top providers found" });
      } else {
        res.send(result);
      }
    })
    .catch((err) => {
      res.send({ message: err.message });
    });
};

const getProvidersByCategory = (req, res) => {
  models
    .find()
    .where("category")
    .equals(req.params.category_name)
    .then((result) => {
      if (result.length == 0) {
        res.send({ message: "No providers within this category" });
      } else {
        res.send(result);
      }
    })
    .catch((err) => {
      res.send({ message: err.message });
    });
};

const getTopProvidersByCategory = (req, res) => {
  models
    .find()
    .where({ category: req.params.category_name })
    .where("average_rating")
    .gte(3)
    .then((result) => {
      if (result.length == 0) {
        res.send({ message: "No top providers within this category" });
      } else {
        res.send(result);
      }
    });
};

module.exports = {
  postProvider,
  getProvider,
  getProviderById,
  updateProviderById,
  getTopProviders,
  getProvidersByCategory,
  getTopProvidersByCategory,
};
