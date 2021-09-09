const models = require("../models/user_model");
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');


const postProvider = (req, res) => {
  const emailExist = await User.findOne({ email: req.body.email });
  if (emailExist) {
    return res.status(400).send('Email already exists');
  }

  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(req.body.password, salt);

  const providersList = new models({
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    password: hashedPassword,
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
      const token = jwt.sign({
        _id: result._id
      }, process.env.TOKEN_SECRET);
      const postResult = {
        id: result._id,
        role: result.role,
        token: token
      };
      res.status(200).send(postResult);
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

const getProviderById = (req, res) => {
  models
    .findById(req.params.id)
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const searchProviders = async function (req, res) {
  const keyword = req.body.keyword;
  const perHourWage = req.body.per_hour_wage;
  let rating = req.body.average_rating;
  if (rating && perHourWage) {
    const providers = await models.fuzzySearch(keyword)
      .find(
        {
          per_hour_wage: perHourWage,
          average_rating: rating

        }, function (err, result) {
          if (err) {
            return res.status(404).json({ message: err })

          } else {
            return res.status(200).json({ result });

          }
        });
  }
  else if (perHourWage) {
    const providers = await models.fuzzySearch(keyword)
      .find(
        {
          per_hour_wage: perHourWage,

        }, function (err, result) {
          if (err) {
            return res.status(404).json({ message: err })

          } else {
            return res.status(200).json({ result });

          }
        });
  }

  else if (rating) {
    const providers = await models.fuzzySearch(keyword)
      .find(
        {

          average_rating: rating

        }, function (err, result) {
          if (err) {
            return res.status(404).json({ message: err })

          } else {
            return res.status(200).json({ result });

          }
        });
  }

  else {
    const providers = await models.fuzzySearch(keyword, function (err, result) {
      if (err) {
        return res.status(404).json({ message: err })

      } else {
        return res.status(200).json({ result });

      }
    });
  }

}


// const getTopProviders = (req, res) => {
//     models
//         .average_rating
// }

module.exports = { postProvider, getProvider, getProviderById, searchProviders };
