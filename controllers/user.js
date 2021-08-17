const User = require("../models/user_model");


const postUser = (req, res) => {
    const usersList = new User({
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
          message: `User with email ${usersList.email} was created`,
        };
        res.send(postResult);
      })
      .catch((err) => {
        console.log(err);
      });
  };


const getUsers = (req, res) => {
    User
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
    User
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

module.exports={postUser, getUsers, getUserById}; //EXPORT YOUR FUNCTIONS HERE