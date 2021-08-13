const models = require("../models/user_model");

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
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const getProvider = (req, res) => {
  models
    .find()
    .then((results) => {
      res.send(results);
    })
    .catch((err) => {
      console.log(err);
    });
};

module.exports = { postProvider, getProvider };
