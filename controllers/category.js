const Category = require("../models/category_model");

const getCategories = (req, res) => {
    Category
        .find()
        .then((categories) => {
            res.json(categories);
        })
        .catch((err) => {
            res.json(
                {message: err.message}
            );
        });
}

const getCategoriesById = (req, res) => {
    Category
        .findById(req.params.id)
        .then((category) => {
            res.json(category)
        })
        .catch((err) => {
            res.json(
                {message: err.message}
            );
        });
}




const deleteCategory = (req, res) => {
    Category
        .findByIdAndDelete(req.params.id)
        .then((category) => {
            res.status(200).json({
                body: category,
                message: `Deleted Category ${category.name} Successfully`
            });
        })
        .catch((err) => {
            res.json({
                message: err.message
            }
            );
        });
}


const addCategory = (req, res) => {
    Category
        .insertOne({ 
            name: req.body.name,
            image: req.body.image,
            numOfProviders: req.body.numOfProviders,
            description: req.body.description
        })
        .then((category) => {
            res.status(201).json({
                body: category,
                message: `Inserted Category ${category.name} Successfully`
            });
        })
        .catch((err) => {
            res.json({
                message: err.message
            });
        });
        
}






module.exports = { getCategories, getCategoriesById, deleteCategory, addCategory }; //EXPORT YOUR FUNCTIONS HERE