const express = require("express");
const verify = require ('../middlewares/verification');

const {
  register, 
  getUsers, 
  getUserById,
  deleteUser,
  login,
  logout,
  updateUser,
  getUserByEmail
}= require("../controllers/user"); // IMPORT USER FUNCTIONS HERE

const {
  postProvider,
  getProvider,
  getProviderById,
} = require("../controllers/provider"); //IMPORT PROVIDER FUNCTIONS HERE

const { 
  orderPost,
  orderget,
  ordergetById,
  orderDelete,
  orderUpdate,
  getAllJobs, 
  getActiveJob, 
  getPendingJobs, 
  updateJobStatus, 
  getDeclinedJobs, 
  getCompletedJobs
} = require("../controllers/order"); // IMPORT ORDER FUNCTIONS HERE
const {
  getCategories,
  getCategoryById,
  deleteCategory,
  addCategory,
  updateCategory
} = require("../controllers/category"); // IMPORT CATEGORY FUNCTIONS HERE

const {
  getReviews,
  getReviewById,
  addReview
} = require("../controllers/review"); // // IMPORT REVIEW FUNCTIONS HERE

const router = express.Router();

// user routes
router.get("/users",verify, getUsers);
router.get("/users/:id", getUserById);
router.get("/users/byEmail/:email", getUserByEmail);
router.delete("/users/:id", deleteUser);
router.put("/users/:id", updateUser);
router.post("/login", login);
router.post("/users", register);
router.get("/logout",verify, logout);

// provider routes
router.post("/provider", postProvider);
router.get("/provider", getProvider);
router.get("/provider/:id", getProviderById);

//category routes
router.get("/category", getCategories);
router.get("/category/:id", getCategoryById);
router.delete("/category/:id", deleteCategory);
router.post("/category", addCategory);
router.put("/category/:id", updateCategory);

//order routes

router.get("/order", orderget);
router.post("/order", orderPost);
router.get("/order/:id", ordergetById);
router.delete("/order/:id", orderDelete);
router.put("/order/:id", orderUpdate);
router.get("/allJobs/:id", getAllJobs);
router.put("/updateStatus/:id",updateJobStatus);
router.get("/activeJob/:id",getActiveJob);
router.get("/pendingJobs/:id",getPendingJobs);
router.get("/declinedJobs/:id",getDeclinedJobs);
router.get("/completedJobs/:id",getCompletedJobs);

//review routes
router.get("/review", getReviews);
router.get("/review/:id", getReviewById);
router.post("/review", addReview);


module.exports = router;
