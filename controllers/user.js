const User = require("../models/user_model");


const postUser = (req, res) => {
    const usersList = new models({
      firstname: req.body.firstname,
      lastname: req.body.lastname,
      password: req.body.password,
      email: req.body.email,
      role: req.body.role,
      phone: req.body.phone,
      image: req.body.image,
      address: req.body.address,
    });
  
    usersList
      .save()
      .then((result) => {
        const postResult = {
          user: result,
          message: `Provider with email ${providersList.email} was created`,
        };
        res.send(postResult);
      })
      .catch((err) => {
        console.log(err);
      });
  };


const getUsers = (req, res) => {
    Review
        .find()
        .then((users) => {
            res.json(users);
        })
        .catch((err) => {
            res.json(
                {message: err.message}
            );
        });
}

const getUserById = (req, res) => {
    Review
        .findById(req.params.id)
        .then((users) => {
            res.json(users)
        })
        .catch((err) => {
            res.json(
                {message: err.message}
            );
        });
}

module.exports={}; //EXPORT YOUR FUNCTIONS HERE