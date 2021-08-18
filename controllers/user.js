const User = require("../models/user_model");
const {registerValidation, loginValidation} = require('../middlewares/validation')

const login = async (req, res) => {
    const {error} = loginValidation(req.body);
    if(error){
        return res.status(400).send((error.details[0].message).toString());
    }

    const user = await User.findOne({email:req.body.email});
    if(!user){
        return res.status(400).send('Email or password is incorrect');
    }

    const validPass = await bcrypt.compare(req.body.password, user.password);
    if(!validPass){
        return res.status(400).send('Email or password is incorrect');
    }

    const token = jwt.sign({
        _id: user._id
    }, process.env.TOKEN_SECRET)
    res.header('auth-token', token).send(token);
};

const register = async (req, res) => {
    const {error} = registerValidation(req.body);
    if(error){
        return res.status(400).send((error.details[0].message).toString());
    }

    const emailExist = await User.findOne({email:req.body.email});
    if(emailExist){
        return res.status(400).send('Email already exists');
    }

    const salt= await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(req.body.password, salt);

    const usersList = new User({
        firstname: req.body.firstname,
        lastname: req.body.lastname,
        password: hashedPassword,
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
        const token = jwt.sign({
            _id: user._id
        }, process.env.TOKEN_SECRET)
        res.header('auth-token', token).send({token, postResult});
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

const deleteUser = (req, res) => {
    User
        .findByIdAndDelete(req.params.id)
        .then((user) => {
            res.status(200).json({
                body: user,
                message: `Deleted user ${user._id} Successfully`
            });
        })
        .catch((err) => {
            res.json({
                message: err.message
            }
            );
        });
}

const logout = (req, res) => {};

module.exports={register, getUsers, getUserById, deleteUser}; //EXPORT YOUR FUNCTIONS HERE