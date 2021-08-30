const express = require("express");

const {}= require("../controllers/user"); // IMPORT USER FUNCTIONS HERE

const {
  postProvider,
  getProvider,
  getProviderById,
} = require("../controllers/provider");

const { 
  orderPost,
  orderget,
  ordergetById,
  orderDelete,
  orderUpdate
} = require("../controllers/order"); // IMPORT ORDER FUNCTIONS HERE
const {
  getCategories,
  getCategoryById,
  deleteCategory,
  addCategory
} = require("../controllers/category"); // IMPORT CATEGORY FUNCTIONS HERE

const {
  getReviews,
  getReviewById,
  addReview
} = require("../controllers/review"); // IMPORT CATEGORY FUNCTIONS HERE

const router = express.Router();
// user routes

// provider routes
router.post("/provider", postProvider);
router.get("/provider", getProvider);
router.get("/provider/:id", getProviderById);

//category routes
router.get("/category", getCategories);
router.get("/category/:id", getCategoryById);
router.delete("/category/:id", deleteCategory);
router.post("/category", addCategory);

//order routes

router.get("/order", orderget);
router.post("/order", orderPost);
router.get("/order/:id", ordergetById);
router.delete("/order/:id", orderDelete);
router.put("/order/:id", orderUpdate);
//review routes
router.get("/review", getReviews);
router.get("/review/:id", getReviewById);
router.post("/review", addReview);


module.exports = router;
